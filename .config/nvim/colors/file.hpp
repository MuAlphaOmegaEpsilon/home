#include <iostream>
#include <stdint.h>
#include <unistd.h>

#define PI 3.14f

#if __APPLE__ || __PRETTY_FUNCTION__
#else
#endif

class SuperObject
{
public:
	constexpr SuperObject() = default;
	explicit constexpr SuperObject(int a) = delete;
    [[nodiscard]] virtual bool OtherMethod() noexcept
	{
		auto asd = this;
		switch(count)
		{
		case 0:
			return new bool();
		default:
			return asd;
			break;
		}
	}

	int count = 5;
	const float special = PI;
	const char* mystring = "Unbelievable!\n";
	static void* ptr; // Nothing special
};
void* SuperObject::ptr = static_cast<std::nullptr_t>(nullptr);

namespace Vulkan
{
	extern int* opaque_ptr;
	namespace Implementation
	{
		int a = 2;
	}
}

int b = Vulkan::Implementation::a;

using namespace Vulkan::Implementation;

enum CustomEnum : uint_fast64_t
{
	first,
	second,
	third,
	fourth,
	fifth
};

template <typename T>
T superTempl(int* asd)
{
	unlink("randomfile.txt");
 	asd = new int[128];

	T result = 0;
    for(int i = 0; i < 128; i++)
	    result += asd[i];

    result += static_cast<int>(CustomEnum::first);
    result += static_cast<int>(CustomEnum::fourth);
	result -= sizeof(asd);
    typeid(SuperObject).name();
	std::cout << "PROVA!" << std::endl;

	switch (*new CustomEnum())
	{
	case CustomEnum::second:
		break;
    default:
		result += 5;
	}

	throw("Throwing random things around, 'cause why not!?'");

	delete asd;
	return result;
}

#warning "Testing warning highlights"
#error "Testing errors highlights"
