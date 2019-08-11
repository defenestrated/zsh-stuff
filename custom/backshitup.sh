#!/bin/zsh
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "backing shit up..."

startdir=$(pwd)

read "yn?include zsh backup? [y/n] "
if [[ "$yn" =~ ^[Yy]$ ]]
then
    cd ~/zsh-stuff
    echo "${CYAN}running zsh migrate...${NC}"
    ./zsh-migrate.sh export
    cd $startdir
else
     echo "cool, skipping"
fi

if [ -d "/Volumes/BigFatSkinny" ]
then

    dirs=(
        "/Users/sam/Active-Work/_mine"
        "/Users/sam/Active-Work/Freelance"
        "/Users/sam/Active-Work/invoices"
        "/Users/sam/Active-Work/reference"
        "/Users/sam/Active-Work/teaching"
        "/Users/sam/Active-Work/web_dev"
        "/Users/sam/code"
        "/Users/sam/Documents"
        "/Users/sam/Pictures"
    )

    for i in "${dirs[@]}"
    do
	      echo "${CYAN}backing up ${YELLOW}$i ${CYAN}to ${YELLOW}bigfatskinny crypt${NC}"
	      rsync -avhP --exclude "node_modules" $i /Volumes/BigFatSkinny/_The_Crypt/
    done

    echo "${CYAN}backing up filetwo to ${YELLOW}bigfatskinny${NC}"
    echo "copying to dated version..."
    cp -r ~/Active-Work/filetwo.sparsebundle ~/Active-Work/filetwo-$(date '+%Y-%m-%d').sparsebundle
    echo "rsync'ing..."
    rsync -avh ~/Active-Work/filetwo-*.sparsebundle /Volumes/BigFatSkinny/_The_Crypt/
    echo "removing dated filetwo..."
    rm -r ~/Active-Work/filetwo-*.sparsebundle

    if [ -d "/Volumes/BigFatFatty" ]
    then
        echo "${CYAN}backing up ${YELLOW}bigfatskinny ${CYAN}to ${YELLOW}bigfatfatty${NC}"
        rsync -avhP /Volumes/BigFatSkinny/ /Volumes/BigFatFatty/
    else
        echo "${YELLOW}...couldn't find bigfatfatty, not doing that rsync"
    fi

    echo -e "${GREEN}all backed up.${NC} look at you, so responsible."
else
    echo "${YELLOW}...couldn't find bigfatskinny -- is it plugged in?"
fi
