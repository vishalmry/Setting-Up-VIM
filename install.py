# install script
import os as process
import subprocess as os
from distutils.spawn import find_executable

home = process.path.expanduser("~")

# setting up the vimrc
os.call(["cp", "-y", ".vimrc", home])

# find the distro and install vim in it
if find_executable("vim") is None :
    print ("Installing Vim")
    distroName =  process.popen("lsb_release -a").read()
    if "Fedora" in distroName :
        os.call(["sudo", "dnf", "install", "vim"])
    elif "Ubuntu" in distroName :
        os.call(["sudo" "apt" "install" "vim"])
    elif "Arch" in distroName :
        os.call(["sudo", "pacman", "-S", "vim"])
    elif "Antergos" in distroName :
        os.call(["sudo", "pacman", "-S", "vim"])

home = home + "/.vim"

# create .vim directory, if not available
if not process.path.isdir(home) :
    os.call(["mkdir", home])

# now copy all the files in .vim directory, to set up the working environment
os.call(["cp", "-r", "*", home])

# install all the required plugins
os.call(["vim", "-c", '":PlugInstall"', "-c", '":qa"'])
