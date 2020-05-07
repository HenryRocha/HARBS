#===========================================================================================================
# User defined variables
#===========================================================================================================
# All the packages that will be installed by HARBS. You can change this list as you see fit,
# but be aware that removing some of the pre-defined packages may break HARBS.
packages = [
    # User programs
    "bspwm",
    "sxhkd",
    "rofi",
    "alacritty",
    "neovim",
    "ranger",
    "neofetch",
    "htop",
    "git",
    "code",
    "python-ueberzug",
    "spacefm",
    # Appearance
    "ttf-jetbrains-mono",
    "nitrogen",
]

# All the packages that will be installed by HARBS using Yay. You can change this list as you see fit,
# but be aware that removing some of the pre-defined packages may break HARBS.
yayPackages = [
]

# Dotfiles repository link, using HTTPS and with .git at the end.
dotFilesRepository = "https://github.com/HenryRocha/dotfiles.git"

# List of files/folders to place in '~/', your home directory. Every other file that
# is not listed here will be placed in '~/.config'.
homeWhitelist = [
    ".profile"
]

# Dotfiles blacklist. A list of files/folders to ignore. These will not be placed anywhere.
blacklist = [
    ".",
    "..",
    ".git",
    "README.md",
    "dconf-settings.conf",
    "libinput-gestures.conf",
    "current-desktop.jpeg",
    "awesome",
    "gtk-3.0",
    "openbox",
    "picom",
    "polybar",
    ".Xresources",
    ".locker.sh",
    ".gtkrc-2.0",
    ".xinitrc",
    ".zprofile"
]
