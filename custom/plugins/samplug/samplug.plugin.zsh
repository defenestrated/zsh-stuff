# Add your own custom plugins in the custom/plugins directory. Plugins placed
# here will override ones with the same name in the main plugins directory.

autoload zmv

alias n="nano"
alias m="mkdir"
alias md="mkdir -p"
alias c="clear"
alias tl="tree -dL"
alias t="tree"
alias ..="cd .."


function pc() {
	pwd | pbcopy
	pwd | xargs echo "path copied to clipboard:" $1
}

function mcd() {
    mkdir -p "$1"
    cd "$1"
}

function dired() {
	open -a Emacs
	emacsclient -e "(dired \"$1\")"
}

function unwebp() {
	echo "   ----- converting -----   "
  # find . -name "*.webp" -maxdepth 1 | xargs -I {} dwebp {} -o {}.png
  parallel dwebp {} -o {.}.png ::: *.webp
	# echo "   -----  renaming  -----   "
	# zmv -Wv '*.webp.png' '*.png'
	echo "   --- removing webps ---   "
	rm -v *.webp
}

alias backshitup="source ~/.oh-my-zsh/custom/backshitup.sh"
alias customplug="nano ~/.oh-my-zsh/custom/plugins/samplug/samplug.plugin.zsh"
alias lsp="ls -l | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\"%0o \",k);print}'"

export LOCAL_IP=`ipconfig getifaddr en0`
alias serve="browser-sync start -s -f . --no-notify --host $LOCAL_IP --port 9000"
