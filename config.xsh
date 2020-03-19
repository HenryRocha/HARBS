#===========================================================================================================
# User defined variables
#===========================================================================================================
# All the packages that will be installed by HARBS. You can change this list as you see fit,
# but be aware that removing some of the pre-defined packages may break HARBS.
packages = [
    "xorg-server",
    "xorg-xinit",
    "bspwm",
    "sxhkd",
    "rofi",
    "polybar",
    "alacritty",
    "neovim",
    "ranger",
    "neofetch",
    "htop",
    "ttf-font-awesome",
    "ttf-jetbrains-mono",
    "lxappearance",
    "nitrogen",
    "git",
    "code",
    "brave",
    "network-manager-applet",
    "python-ueberzug",
    "materia-gtk-theme",
    "arc-icon-theme",
    "lxrandr",
    "alsa-utils",
    "pulseaudio",
    "pulseaudio-alsa",
    "pavucontrol",
    "picom"
]

# Dotfiles repository link, using HTTPS and with .git at the end.
dotFilesRepository = "https://github.com/HenryRocha/dotfiles.git"

# List of files/folders to place in '~/', you home directory. Every other file that
# is not listed here will be placed in '~/.config'.
homeWhitelist = [
    ".xinitrc",
    ".Xresources",
    ".zprofile",
    ".gtkrc-2.0.mine"
]

# Dotfiles blacklist. A list of files/folders to ignore. These will not be placed anywhere.
blacklist = [
    ".",
    "..",
    ".git",
    "README.md",
    "dconf-settings.conf",
    "libinput-gestures.conf"
]
