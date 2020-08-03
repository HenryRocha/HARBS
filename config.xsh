#===========================================================================================================
# User defined variables
#===========================================================================================================
# All the packages that will be installed by HARBS. You can change this list as you see fit,
# but be aware that removing some of the pre-defined packages may break HARBS.
packages = [
    # Base programs
    "xorg-server",
    "xorg-xinit",
    "xorg-xsetroot",
    # User programs
    "git",
    "neovim",
    "bspwm",
    "sxhkd",
    "dex",
    "rofi",
    "code",
    "firefox",
    "alacritty",
    "pcmanfm",
    "flameshot",
    "neofetch",
    "htop",
    "polybar",
    "ueberzug",
    "nitrogen",
    "lxappearance",
    "lxrandr",
    "pulseaudio",
    "pavucontrol",
    "xautolock",
    "xsecurelock",
    "matcha-gtk-theme",
    "pamixer",
    "ranger",
    "picom",
    # Bluetooth
    "bluez",
    "bluez-utils",
    "blueman",
    "pulseaudio-bluetooth",
    # ZSH plugins
    "zsh-history-substring-search",
    "zsh-syntax-highlighting",
    # Fonts
    "ttf-jetbrains-mono",
    "ttf-font-awesome",
]

# All the packages that will be installed by HARBS using Yay. You can change this list as you see fit,
# but be aware that removing some of the pre-defined packages may break HARBS.
yayPackages = [
    "spaceship-prompt-git",
    "deadd-notification-center-bin",
    "ly",
]

# Dotfiles repository link, using HTTPS and with .git at the end.
dotFilesRepository = "https://github.com/HenryRocha/dotfiles.git"

# List of files/folders to place in '~/', your home directory. Every other file that
# is not listed here will be placed in '~/.config'.
homeWhitelist = [
    ".zprofile"
]

# Dotfiles blacklist. A list of files/folders to ignore. These will not be placed anywhere.
blacklist = [
    ".",
    "..",
    ".git",
    ".gitignore",
    "README.md",
    "dconf-settings.conf",
    "libinput-gestures.conf",
    ".xinitrc",
]
