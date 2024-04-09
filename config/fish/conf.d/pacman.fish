#
# Pacman aliases
#

# The zpacman_frontend is _only_ used for package installs.

#
# Setup
#

set -l priv_command "sudo"
set -l zpacman_frontend "pikaur"
set -l zpacman_frontend_priv "$priv_command $zpacman_frontend"

#
# General
#

abbr -a pac $zpacman_frontend

#
# Build
#

# build package in current directory, cleanup, and install
abbr -a pacb 'makepkg -sci'

#
# Install
#

#NOTE: Installing/upgrading individual packages is NOT supported. Sync and upgrade ALL on install.

# install, sync, and upgrade packages
abbr -a paci "$zpacman_frontend_priv -Syu"

# install packages without syncing
abbr -a pacI "$zpacman_frontend_priv -S"

# install, sync, and upgrade packages (forcibly refresh package lists)
abbr -a pacu "$zpacman_frontend_priv -Syyu"

# install packages by filename
abbr -a pacU "$zpacman_frontend_priv -U"

# install all packages in current directory
abbr -a pacd "$zpacman_frontend_priv -U *.pkg.*"


#
# Remove
#

# remove package and unneeded dependencies
abbr -a pacr "$zpacman_frontend_priv -R"

# remove package, unneeded dependencies, and configuration files
abbr -a pacrm "$zpacman_frontend_priv -Rns"


#
# Query
#

# query package information from the remote repository
abbr -a pacq "$zpacman_frontend -Si"

# query package information from the local repository
abbr -a pacQ "$zpacman_frontend -Qi"


#
# Search
#

# search for package in the remote repository
abbr -a pacs "$zpacman_frontend -Ss"

# search for the package in the local repository
abbr -a pacS "$zpacman_frontend -Qs"


#
# Orphans
#

# list orphan packages
abbr -a pacol "$zpacman_frontend -Qdt"

# remove orphan packages
abbr -a pacor "$zpacman_frontend_priv -Rns \$(pacman -Qtdq)"


#
# Ownership
#

# list all files that belong to a package
abbr -a pacown "$zpacman_frontend -Ql"

# show package(s) owning the specified file
abbr -a pacblame "$zpacman_frontend -Qo"

