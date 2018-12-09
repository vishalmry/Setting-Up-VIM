# install script
import os
from distutils.spawn import find_executable

home = os.path.expanduser("~")

# find the distro and install vim in it
if find_executable("vim") is None :
    print ("Installing Vim")
    distroName =  os.popen("lsb_release -a").read()
    if "Fedora" in distroName :
        os.system("sudo dnf install vim")
    elif "Ubuntu" in distroName :
        os.system("sudo apt install vim")
    elif "Arch" in distroName :
        os.system("sudo pacman -S vim")
    elif "Antergos" in distroName :
        os.system("sudo pacman -S vim")

home = home + "/.vim"

# create .vim directory, if not available
if not os.path.isdir(home) :
    os.system("mkdir " + home)

# now copy all the files in .vim directory, to set up the working environment
os.system("cp -r * " + home)

# install all the required plugins
os.system('vim -c ":PlugInstall" -c ":qa"')

# setting up the vimrc
os.system("cp -i .vimrc " + os.path.expanduser("~"))
