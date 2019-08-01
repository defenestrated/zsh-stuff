# Add your own custom plugins in the custom/plugins directory. Plugins placed
# here will override ones with the same name in the main plugins directory.

autoload zmv

alias n="nano"
alias m="mkdir"
alias c="clear"
alias tl="tree -dL"
alias t="tree"
alias ..="cd .."


function pc() {
	pwd | pbcopy
	pwd | xargs echo "path copied to clipboard:" $1
}


alias customplug="nano ~/.oh-my-zsh/custom/plugins/samplug/samplug.plugin.zsh"
alias lsp="ls -l | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\"%0o \",k);print}'"

