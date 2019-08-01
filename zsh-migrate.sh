if [[ $1 = "export" ]]; then
    echo "copying needed stuff into zsh-stuff folder"
    cp -rfv /Users/$USER/.oh-my-zsh/custom .
    cp -rfv /Users/$USER/.oh-my-zsh/themes .
    cp -rfv /Users/$USER/.zshrc
    echo "pushing changes"
    git add --all
    echo "enter commit message:"
    read msg
    git commit -m "$msg"
    git push
elif [[ $1 = "import" ]]; then
    echo "pulling changes"
    git pull
    echo "copying everything out of zsh sfolder"
    cp -rfv ./custom /Users/$USER/.oh-my-zsh/
    cp -rfv ./themes /Users/$USER/.oh-my-zsh/
    cp -rfv ./.zshrc /Users/$USER/
else
    echo "specify 'import' (pull remote changes) or 'export' (saves local changes + pushes)"
fi
