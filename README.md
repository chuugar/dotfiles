# chuugar's dotfiles
## General
All dotfiles are managed with `stow` except the `other` folder.
You can install a dots with the following command :
`stow -t $XDG_CONFIG_HOME whatever`

## Special vim notes.
Since vim v8.x, it included a plugins manager. They are managed has submodules.

### Adding a package

    git submodule init
    git submodule add https://github.com/vim-airline/vim-airline.git vim/vim/pack/git/start/vim-airline
    git add .gitmodules vim/vim/pack/start/start/vim-airline
    git commit

### Updating package

If the package had never been installed before :

    git submodule update --init --recursive
    git commit

Else :

    git submodule update --remote --merge
    git commit

### Removing package

    git submodule deinit vim/vim/pack/start/start/vim-airline
    git rm vim/vim/pack/git/start/vim-airline
    rm -Rf .git/modules/vim/vim/pack/vim-airline
    git commit
