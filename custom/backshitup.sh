#!/bin/zsh
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

dirs=(
    "/Users/sam/Active-Work/_mine"
    "/Users/sam/Active-Work/applications-for-stuff"
    "/Users/sam/Active-Work/Freelance"
    "/Users/sam/Active-Work/invoices"
    "/Users/sam/Active-Work/reference"
    "/Users/sam/Active-Work/web_dev"
    "/Users/sam/code"
    "/Users/sam/adobe-custom"
    "/Users/sam/zsh-stuff"
    "/Users/sam/Documents"
)

echo "backing shit up..."
for i in "${dirs[@]}"
do
	  :
	  echo "${CYAN}backing up ${YELLOW}$i ${CYAN}to ${YELLOW}bigfatskinny crypt${NC}"
	  rsync -avhP $i /Volumes/BigFatSkinny/_The_Crypt/ --exclude "node_modules"
done

# echo "${CYAN}backing up ${YELLOW}bigfatskinny ${CYAN}to ${YELLOW}bigfatfatty${NC}"
# rsync -avhP /Volumes/BigFatSkinny/ /Volumes/BigFatFatty/

echo -e "${GREEN}all backed up.${NC} look at you, so responsible."
