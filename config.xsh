#===========================================================================================================
# User defined variables
#===========================================================================================================
# All the packages that will be installed by HARBS. You can change this list as you see fit,
# but be aware that removing some of the pre-defined packages may break HARBS.
packages = [
    # Needed for startx
    "xorg-server",
    "xorg-xinit",
    # Needed to lock the screen automatically
    "xorg-xset",
    "xss-lock",
    "xsecurelock",
    "physlock",
    # User programs
    "bspwm",
    "sxhkd",
    "rofi",
    "polybar",
    "alacritty",
    "neovim",
    "ranger",
    "neofetch",
    "htop",
    "git",
    "code",
    "brave",
    "network-manager-applet",
    "python-ueberzug",
    "picom",
    "xdg-utils",
    # Monitors
    "xorg-xrandr",
    "autorandr",
    # Appearance
    "ttf-font-awesome",
    "ttf-jetbrains-mono",
    "lxappearance",
    "nitrogen",
    "materia-gtk-theme",
    "arc-icon-theme",
    # Audio
    "alsa-utils",
    "pulseaudio",
    "pulseaudio-alsa",
    "pavucontrol"
]

# All the packages that will be installed by HARBS using Yay. You can change this list as you see fit,
# but be aware that removing some of the pre-defined packages may break HARBS.
yayPackages = [
]

# Dotfiles repository link, using HTTPS and with .git at the end.
dotFilesRepository = "https://github.com/HenryRocha/dotfiles.git"

# List of files/folders to place in '~/', you home directory. Every other file that
# is not listed here will be placed in '~/.config'.
homeWhitelist = [
    ".xinitrc",
    ".Xresources",
    ".zprofile",
    ".gtkrc-2.0",
    ".locker.sh"
]

# Dotfiles blacklist. A list of files/folders to ignore. These will not be placed anywhere.
blacklist = [
    ".",
    "..",
    ".git",
    "README.md",
    "dconf-settings.conf",
    "libinput-gestures.conf",
    "current-desktop.jpeg"
]
