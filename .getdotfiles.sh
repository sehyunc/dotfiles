# curl https://raw.githubusercontent.com/sehyunc/dotfiles/master/.getdotfiles.sh | bash

echo "cloning dotfiles"
git clone git@github.com:sehyunc/dotfiles.git "${HOME}/dotfiles"
ln -s "${HOME}/dotfiles/.gitconfig" "${HOME}/.gitconfig"
ln -s "${HOME}/dotfiles/.gitignore_global" "${HOME}/.gitignore_global"
ln -s "${HOME}/dotfiles/.hyper.js" "${HOME}/.hyper.js"
ln -s "${HOME}/dotfiles/.vimrc" "${HOME}/.vimrc"
ln -s "${HOME}/dotfiles/.zshrc" "${HOME}/.zshrc"
