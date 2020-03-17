#===============================================================================
# User defined variables
#===============================================================================
# All the packages that will be installed.
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
    "arc-icon-theme"
]

# Dotfiles repository link, using HTTPS and with .git at the end.
dotFilesRepository = "https://github.com/henryrocha/GuidesAndFiles.git"

# Dotfiles blacklist. A list of files to ignore and not create symlinks for.
filesBlacklist = [
    ".git",
    "README.md"
]

#===============================================================================
# Imports
#===============================================================================
import os

#===============================================================================
# Classes
#===============================================================================
class HARBS():
    def __init__(self, packages, dotFilesRepository, filesBlacklist):
        '''
            Initializes all the necessary variables.

            @param packages List of strings, each one being a package name.

            @param dotFilesRepository HTTPS link to the repository where the
                dotfiles are stored, ending in '.git'.

            @param filesBlacklist List of strings, each one being the name of a
                file or folder to ignore and not create symlinks for.
        '''
        # Given parameters.
        self.packages = packages
        self.dotFilesRepository = dotFilesRepository
        self.filesBlacklist = filesBlacklist

        # Colors.
        self.RED='\033[0;31m'
        self.LIGHTRED='\033[1;31m'
        self.GREEN='\033[0;32m'
        self.BLUE='\033[0;34m'
        self.NC='\033[0m'

        # Getting environment variables.
        self.username = os.environ.get("USER")
        self.home = os.environ.get("HOME")

        # Getting this script's current location.
        self.currentDirectory = os.getcwd()

        # List of files to place in '~/'.
        self.homeFilesWhitelist = [
            ".xinitrc",
            ".Xresources"
        ]

        # Created variables
        self.parentDirectory = "/".join(self.currentDirectory.split("/")[:-1])
        self.dotFilesRepositoryName = self.dotFilesRepository.split("/")[-1].split(".")[0]

        self.dotConfigPath = self.home + "/.config"
        self.dotConfigFiles = os.listdir(self.dotConfigPath)

        self.dotFilesPath = self.parentDirectory + "/" + self.dotFilesRepositoryName + "/dot-files"

    def installPackages(self):
        '''
            Installs all the given packages.
        '''
        
        # Shell commands
        ![echo -e f"[{self.GREEN}HARBS{self.NC}] Installing packages"]
        ![sudo pacman -S @(self.packages)]

        return

    def cloneRepository(self):
        '''
            Clones the given repository in the same folder HARBS was cloned into.
        '''

        print(f"[{self.GREEN}HARBS{self.NC}] Cloning {self.GREEN}dotfiles repository{self.NC} in the {self.BLUE}parent directory{self.NC} of HARBS")
        
        if not os.path.isdir(self.parentDirectory + "/" + self.dotFilesRepositoryName):
            # Shell commands
            ![cd ..]
            ![git clone @(self.dotFilesRepository)]
            ![cd "HARBS/"]
        else:
            print(f"[{self.RED}HARBS{self.NC}] Folder {self.GREEN}{self.dotFilesRepositoryName}{self.NC} already exists in {self.BLUE}{self.parentDirectory}{self.NC}, assuming repository is already cloned")

        # List all dot files in the cloned repository
        self.dotFiles = os.listdir(self.dotFilesPath)

        return

    def createSymbolicLinks(self):
        '''
            Creates a symbolic link for every file in the given dotfiles repository,
            as long as it is not in the blacklist.
        '''
        for dotFile in self.dotFiles:
            pathToDotFile = self.dotFilesPath + "/" + dotFile
            pathToConfigFile = self.dotConfigPath + "/" + dotFile

            # If the dotFile is a folder and is not in the blacklist.
            if os.path.isdir(pathToDotFile) and dotFile not in self.filesBlacklist:
                # If the folder already exists in '~/.config/'.
                if os.path.isdir(pathToConfigFile):
                    print(f"[{self.RED}HARBS{self.NC}] Folder {self.GREEN}{dotFile}{self.NC} already exists in {self.BLUE}{self.dotConfigPath}{self.NC}")
                    print(f"[{self.RED}HARBS{self.NC}] {self.LIGHTRED}Delete{self.NC} the folder and run the installer again")
                # If the file does not exist in '~/.config'.
                else:
                    print(f"[{self.GREEN}HARBS{self.NC}] Symbolic link for {self.GREEN}{dotFile}{self.NC} created on {self.BLUE}{pathToConfigFile}{self.NC}")
                    ![ln -s @(pathToDotFile) @(self.dotConfigPath)]

            # If the dotFile is a file and is not in the blacklist.
            elif os.path.isfile(pathToDotFile) and dotFile not in self.filesBlacklist:
                # If the file should be placed in '~/'.
                if dotFile in self.homeFilesWhitelist:
                    # If the file already exists in '~/'.
                    if os.path.isfile(self.home + "/" + dotFile):
                        print(f"[{self.RED}HARBS{self.NC}] File {self.GREEN}{dotFile}{self.NC} already exists in {self.BLUE}{self.home}{self.NC}")
                        print(f"[{self.RED}HARBS{self.NC}] {self.LIGHTRED}Delete{self.NC} the file and run the installer again")
                    # If the file does not exist in '~/.config'.
                    else:
                        print(f"[{self.GREEN}HARBS{self.NC}] Symbolic link for {self.GREEN}{dotFile}{self.NC} created on {self.BLUE}{self.home}{self.NC}")
                        ![ln -s @(pathToDotFile) @(self.home + "/" + dotFile)]
                # If the file should be place in '~/.config'.
                else:
                    # If the file already exists in '~/.config'.
                    if os.path.isfile(pathToConfigFile):
                        print(f"[{self.RED}HARBS{self.NC}] File {self.GREEN}{dotFile}{self.NC} already exists in {self.BLUE}{self.dotConfigPath}{self.NC}")
                        print(f"[{self.RED}HARBS{self.NC}] {self.LIGHTRED}Delete{self.NC} the file and run the installer again")
                    # If the file does not exist in '~/.config'.
                    else:
                        print(f"[{self.GREEN}HARBS{self.NC}] Symbolic link for {self.GREEN}{dotFile}{self.NC} created on {self.BLUE}{pathToConfigFile}{self.NC}")
                        ![ln -s @(pathToDotFile) @(self.dotConfigPath)]

        return

    def install(self):
        '''
            Installs HARBS.
        '''
        # Installing the chosen packages.
        self.installPackages()

        # Cloning the given dotfiles repository.
        self.cloneRepository()

        # Create symbolic links.
        self.createSymbolicLinks()


#===============================================================================
# Main
#===============================================================================
if __name__ == "__main__":
    # Create HARBS object.
    harbs = HARBS(packages, dotFilesRepository, filesBlacklist)

    # Run the HARBS installer.
    harbs.install()
