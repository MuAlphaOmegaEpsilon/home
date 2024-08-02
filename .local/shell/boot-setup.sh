#!/bin/bash
# Script written by maze
set -euf

create_entry() {
	if [ "$#" -ne 3 ]; then
		echo "Illegal number of parameters"
	fi

	NAME="$1"
	EFI_NAME="$2"
	PARAMS_FILE="$3"
	SPLASH_IMAGE="/boot/debian.bmp"
	EFISTUB="/usr/lib/systemd/boot/efi/linuxx64.efi.stub"
	OS_RELEASE="/usr/lib/os-release"
	OUTPUT_SIGNED_EFI="/boot/efi/EFI/Linux/debian-signed.efi"


	tmp="$(objdump -p ${EFISTUB} | gawk '{ if ($1 == "SectionAlignment"){print $2} }')"
	align=$((16#$tmp))

	tmp="$(objdump -h ${EFISTUB} | gawk 'NF==7 {size=strtonum("0x"$3); offset=strtonum("0x"$4)} END {print size + offset}')"
	osrel_offs=$((tmp + "$align" - tmp % "$align"))

	tmp=$((osrel_offs + $(stat -Lc%s "$OS_RELEASE")))
	cmdline_offs=$((tmp + "$align" - tmp % "$align"))

	tmp=$((cmdline_offs + $(stat -Lc%s "$PARAMS_FILE")))
	splash_offs=$((tmp + "$align" - tmp % "$align"))

	tmp=$((splash_offs + $(stat -Lc%s "$SPLASH_IMAGE")))
	initrd_offs=$((tmp + "$align" - tmp % "$align"))

	tmp=$((initrd_offs + $(stat -Lc%s "/initrd.img")))
	linuz_offs=$((tmp + "$align" - tmp % "$align"))

	objcopy \
	  --add-section        .osrel="$OS_RELEASE"                 \
	  --change-section-vma .osrel=$(printf 0x%x $osrel_offs)    \
	  --add-section        .cmdline="$PARAMS_FILE"              \
	  --change-section-vma .cmdline=$(printf 0x%x $cmdline_offs)\
	  --add-section        .splash="${SPLASH_IMAGE}"            \
	  --change-section-vma .splash=$(printf 0x%x $splash_offs)  \
	  --add-section        .initrd="/initrd.img"                \
	  --change-section-vma .initrd=$(printf 0x%x $initrd_offs)  \
	  --add-section        .linux="/vmlinuz"                    \
	  --change-section-vma .linux=$(printf 0x%x $linuz_offs)    \
	  "${EFISTUB}" "/boot/efi/EFI/Linux/${EFI_NAME}"

	efibootmgr --create --disk /dev/nvme0n1 --part 1 --label "${NAME}" --loader "/EFI/Linux/${EFI_NAME}" > /dev/null
	# sbsign --key /boot/UEFI-signoff.key --cert /boot/UEFI-signoff.crt --output "${OUTPUT_SIGNED_EFI}" "/EFI/Linux/${EFI_NAME}" 2> /dev/null
	# efibootmgr --create --disk /dev/nvme0n1 --part 1 --label "Debian UEFI" --loader "/EFI/Linux/debian-signed.efi" > /dev/null
}

mount -t efivarfs efivarfs /sys/firmware/efi/efivars/

for BOOTNUM in $(efibootmgr | grep "Debian" | colrm 9 | colrm 1 4); do
	efibootmgr --delete-bootnum --bootnum $BOOTNUM > /dev/null
done
rm -r /boot/efi/EFI/Linux/
mkdir /boot/efi/EFI/Linux/

KERNEL_PARAMS="root=UUID=6f8d455c-c28c-47e5-959e-03b346c6f21d rootfstype=ext4 resume=UUID=44c68e3d-e03c-4fa4-ac53-1b829174250b rw quiet nosplash"
KERNEL_VERSION=$(readlink -f /initrd.img | cut -d '-' -f 2)
echo "${KERNEL_PARAMS} 3" > /tmp/kernel-params.txt
create_entry "Debian $KERNEL_VERSION - Safe mode" "debian-safemode.efi" /tmp/kernel-params.txt
echo "${KERNEL_PARAMS} nvidia-drm.modeset=1" > /tmp/kernel-params.txt
create_entry "Debian $KERNEL_VERSION" "debian.efi" /tmp/kernel-params.txt
rm /tmp/kernel-params.txt
