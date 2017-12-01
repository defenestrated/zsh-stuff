#!/bin/zsh
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

dirs=(
 "/Users/sam/Active-Work/_mine"
 "/Users/sam/Active-Work/cda"
 "/Users/sam/Active-Work/Freelance"
 "/Users/sam/Active-Work/invoices"
 "/Users/sam/Active-Work/reference"
 "/Users/sam/Active-Work/void"
 "/Users/sam/teaching"
 "/Users/sam/Documents"
 "/Users/sam/web_dev"
)

echo "backing shit up..."
for i in "${dirs[@]}"
do
	:
	echo "${CYAN}backing up ${YELLOW}$i ${CYAN}to ${YELLOW}optibay crypt${NC}"
	rsync -avhP $i /Volumes/MCE\ 1TB\ OptiBay/_The_Crypt --exclude '_cda_drive'
done

# rsync -avhP /Users/sam/Active-Work/_mine /Volumes/MCE\ 1TB\ OptiBay/_The_Crypt
# rsync -avhP /Users/sam/Active-Work/cda /Volumes/MCE\ 1TB\ OptiBay/_The_Crypt
# rsync -avhP /Users/sam/Active-Work/Freelance /Volumes/MCE\ 1TB\ OptiBay/_The_Crypt/
# rsync -avhP /Users/sam/Active-Work/invoices /Volumes/MCE\ 1TB\ OptiBay/_The_Crypt/
# rsync -avhP /Users/sam/Active-Work/reference /Volumes/MCE\ 1TB\ OptiBay/_The_Crypt/
# rsync -avhP /Users/sam/Active-Work/void /Volumes/MCE\ 1TB\ OptiBay/_The_Crypt/
# rsync -avhP /Users/sam/teaching /Volumes/MCE\ 1TB\ OptiBay/_The_Crypt/
# rsync -avhP /Users/sam/Documents /Volumes/MCE\ 1TB\ OptiBay/_The_Crypt/
# rsync -avhP /Users/sam/web_dev /Volumes/MCE\ 1TB\ OptiBay/_The_Crypt/

echo "${CYAN}backing up ${YELLOW}optibay ${CYAN}to ${YELLOW}bigfatskinny${NC}"
rsync -avhP /Volumes/MCE\ 1TB\ OptiBay/ /Volumes/BigFatSkinny

echo "${CYAN}backing up ${YELLOW}bigfatskinny ${CYAN}to ${YELLOW}bigfatfatty${NC}"
rsync -avhP /Volumes/BigFatSkinny/ /Volumes/BigFatFatty/

echo -e "${GREEN}all backed up.${NC} look at you, so responsible."
