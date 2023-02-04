# home
Welcome to my personal home folder!<br/>
Whether I am running a UNIX based OS or a Windows machine using MSYS2, this is the first repository that I am cloning on a new machine.<br/>
Everything is stored here: my utilities scripts, my command line development environment, references to my projects, aliases and defaults.<br/>
You probably won't be able to access my private repositories, but even those are referenced inside here as submodules.<br/>
Having my home folder on GitHub allows me to setup a new machine faster and to be more robust in case I lose one of the existing machines, and having it public also allows me and anybody else to access it for inspiration, help, or whatever.

## Projects
Inside the [prj](prj) folder you will find all the submodules related to past projects, ongoing ones and various experiments and attempts.<br/>
My latest WIP projects and experiments are the following:
 - **[us](prj/us/):** a Qt6 based cross-platform app (Linux, Windows, macOS, iOS and Android) to track personal finances and investments
 - **[dove](prj/dove):** a data oriented video editor, aimed at blazingly fast performance and written in Qt6 mainly for desktop: will be publicly released at a later stage
 - **[minimalib](prj/minimalib/):** a library comprised of a small set of functions and helpers to allow a C++ program to be written without linking to a libc implementation, calling kernel syscalls straight from user code. This gives the programmer a bigger control (and responsibility) because there is no more a middle-layer between user-land and kernel-land. The resulting binaries are also much smaller, and a performance gain is to be expected (on my Ubuntu machine I am recording a 3x improvement in process boot up time).

## Configurations
Most configurations file can be found under the [.config](.config) folder, as usual.<br/>
The files under the [.config/profile.d/](.config/profile.d) folder are used for machine-specific setup as well as to setup environment variables ([.config/profile.d/env](.config/profile.d/env)) and aliases ([.config/profile.d/alias](.config/profile.d/alias)).

## Scripts
Most utilities scripts are located inside the [.local/shell/](.local/shell/) folder.<br/>
Inside there you will notice folders called after machines names: those folders are sourced depending on the name of the machine when the [.profile](.profile) is run at session opening, this allows to have machine-specific versions of scripts, like the [.local/shell/battery](.local/shell/battery) hints at.

## Terminal
I am using a custom color scheme for my terminal, look at the [.config/vtrgb/maze](.config/vtrgb/maze) file for more info.<br/>
These colors are applied in different ways depending on the terminal interface I am using:
 - **TTY:** colors are applied using the [setvtrgb](https://www.man7.org/linux/man-pages/man8/setvtrgb.8.html) command when the [.profile](.profile) is read at session opening
 - **Terminal emulator:** I manually add the colors in the terminal profile by hand, converting them to hexadecimal when needed, this is tedious but allows me to have a uniform look

### TMUX
I started using [tmux](https://github.com/tmux/tmux) a while back and it changed the way I use the terminal. My tmux configuration can be found in the [.config/tmux/tmux.conf](.config/tmux/tmux.conf) file.

#### Neofetch
When opening the first tmux pane, [neofetch](https://github.com/dylanaraps/neofetch) is going to be called to greet the user.

#### Appearance
Once everything is setup correctly, this is the look of the command line when opening a new session:
![](https://user-images.githubusercontent.com/26225010/146658957-4651100e-8443-4ac9-93dd-d665d5c9f6c4.png)
Please note that this might be subject to change.

## Neovim
I use [Neovim](https://github.com/neovim/neovim) as my primary editor, unless I am doing some specific work that requires me to use a more common IDE ([Visual Studio Code](https://code.visualstudio.com/) or [QtCreator](https://www.qt.io/product/development-tools)).<br/>

### Color scheme
I have a customized color scheme for both, my [terminal](#Terminal) and therefore my Neovim as well.<br/>
In Neovim I am shuffling the color codes association in order to have a pleasent

### Plugins
I don't have a plugin manager for Neovim because there's a feature already integrated in the editor that will automatically import any plugin found under the [.local/share/nvim/site/pack/git-plugins/start/](.local/share/nvim/site/pack/git-plugins/start/) folder:
this is where I keep my plugins as Git submodules, allowing me to update the plugin reference to update the plugin on every machine.


### Hiding README.md in the home folder
I don't want to see a README.md file when launching `ls` from my home folder, and I don't want either to see git showing me that I deleted the file so the idea is to run the following:
```bash
rm README.md
git update-index --assume-unchanged README.md
```

