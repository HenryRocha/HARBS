# ==========================================================================================================
# Imports
# ==========================================================================================================
import os
from config import *

# ==========================================================================================================
# Classes
# ==========================================================================================================
class HARBS():
    def __init__(self, packages, yayPackages, dotFilesRepository, homeWhitelist, blacklist):
        '''
            Initializes all the necessary variables.

            @param packages List of strings, each one being a package name.

            @param dotFilesRepository HTTPS link to the repository where the
                dotfiles are stored, ending in '.git'.

            @param homeWhitelist List of strings, each one being the name of a
                file that should be place in '~/', the home directory.

            @param blacklist List of strings, each one being the name of a
                file or folder to ignore and not create symlinks for.
        '''
        # Given parameters.
        self.packages = packages
        self.yayPackages = yayPackages
        self.dotFilesRepository = dotFilesRepository
        self.homeWhitelist = homeWhitelist
        self.blacklist = blacklist

        # Colors.
        self.RED = '\033[0;31m'
        self.LIGHTRED = '\033[1;31m'
        self.GREEN = '\033[0;32m'
        self.BLUE = '\033[0;34m'
        self.NC = '\033[0m'

        # Get this scripts absolute path.
        self.harbsDirectory = os.getcwd()

        # Get the repository name from the given link.
        self.dotFilesRepositoryName = self.dotFilesRepository.split("/")[-1].split(".")[0]

    def installPackages(self):
        '''
            Installs all the given packages.
        '''

        if len(self.packages) > 0:
            print(f"\n[{self.GREEN}HARBS{self.NC}] Installing pacman packages...")
            ![sudo pacman -S @(self.packages)]

        if len(self.yayPackages) > 0:
            print(f"\n[{self.GREEN}HARBS{self.NC}] Installing aur packages using yay...")
            ![yay -S @(self.yayPackages)]

        return

    def cloneRepository(self):
        '''
            Clones the given repository in parent directory of HARBS.
        '''

        print(f"\n[{self.GREEN}HARBS{self.NC}] Cloning {self.GREEN}{self.dotFilesRepositoryName}" +
              f"{self.NC} in the {self.BLUE}parent directory{self.NC} of HARBS...")

        # If a directory with the same name of the dotfiles repository does not exist in
        # the parent directory of HARBS.
        if !(ls ../@(self.dotFilesRepositoryName) 2> /dev/null).returncode == 2:
            ![cd ..]
            ![git clone @(self.dotFilesRepository)]
            ![cd "HARBS/"]
        else:
            print(f"[{self.RED}HARBS{self.NC}] Folder {self.GREEN}{self.dotFilesRepositoryName}" +
                  f"{self.NC} already exists in {self.BLUE}the parent directory" +
                  f"{self.NC}... Assuming repository is already cloned")

        return

    def createSymbolicLinks(self):
        '''
            Creates a symbolic link for every file in the given dotfiles repository,
            as long as it is not in the blacklist.
        '''

        print(f"\n[{self.GREEN}HARBS{self.NC}] Creating symbolic links...")
        ![cd ../@(self.dotFilesRepositoryName)]
        dotFiles = $(ls -a).strip().split("\n")

        for dotFile in dotFiles:
            if dotFile not in self.blacklist:
                if dotFile in self.homeWhitelist:
                    destination = os.environ.get("HOME") + "/"
                else:
                    destination = os.environ.get("HOME") + "/.config/"

                if !(ln -s @(os.path.abspath(dotFile)) @(destination) 2> /dev/null).returncode != 0:
                    print(f"[{self.RED}HARBS{self.NC}] {self.GREEN}{dotFile}{self.NC} already " +
                        f"exists in {self.BLUE}'{destination}'{self.NC}, {self.LIGHTRED}delete{self.NC} " +
                        "it and run the installer again")
                else:
                    print(f"[{self.GREEN}HARBS{self.NC}] Symbolic link for " +
                        f"{self.GREEN}{dotFile}{self.NC} created on {self.BLUE}'{destination}'{self.NC}")

        # Go back to HARBS's directory.
        ![cd @(self.harbsDirectory)]

        return

    def configAlsa(self):
        '''
            Unmutes all the channels in ALSA. Mainly so I don't forget to do it.
        '''

        !(amixer sset Master unmute 2> /dev/null)
        !(amixer sset Speaker unmute 2> /dev/null)
        !(amixer sset Headphone unmute 2> /dev/null)

        return

    def configBluetooth(self):
        '''
            Enables and starts the bluetooth service.
        '''

        !(sudo systemctl enable bluetooth.service 2> /dev/null)
        !(sudo systemctl start bluetooth.service 2> /dev/null)

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

        # Unmute channels in ALSA
        self.configAlsa()

        # Enable/start bluetooth service
        self.configBluetooth()

# ==========================================================================================================
# Main
# ==========================================================================================================
if __name__ == "__main__":
    # Create HARBS object.
    harbs = HARBS(packages, yayPackages, dotFilesRepository, homeWhitelist, blacklist)

    # Run the HARBS installer.
    harbs.install()
