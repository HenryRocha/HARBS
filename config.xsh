#===========================================================================================================
# User defined variables
#===========================================================================================================
# All the packages that will be installed by HARBS. You can change this list as you see fit,
# but be aware that removing some of the pre-defined packages may break HARBS.
packages = [
    # User programs
    "bspwm",
    "flameshot",
    "sxhkd",
    "rofi",
    "alacritty",
    "neovim",
    "neofetch",
    "htop",
    "git",
    "code",
    "python-ueberzug",
    "spacefm",
    "ttf-jetbrains-mono",
    "nitrogen",
    "zsh-history-substring-search",
    "zsh-syntax-highlighting",
    "pulseaudio",
    "pavucontrol",
    "ttf-font-awesome",
]

# All the packages that will be installed by HARBS using Yay. You can change this list as you see fit,
# but be aware that removing some of the pre-defined packages may break HARBS.
yayPackages = [
    "spaceship-prompt-git",
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
