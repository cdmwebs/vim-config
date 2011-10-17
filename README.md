My vim config
=============

### Requirements
* vim!
* Ruby & Rubygems
* [homesick](https://github.com/technicalpickles/homesick)

### Installation
    gem install homesick
    homesick clone cdmwebs/vim-config
    homesick symlink cdmwebs/vim-config
    vim -c BundleInstall
    :qa

#### Optional [command-t setup](https://wincent.com/products/command-t)

Note: vim needs to be compiled with ruby support. `vim --version` should 
tell you if you have it or not.

    cd $HOME/.homesick/repos/cdmwebs/vim-config/home/.vim/bundle/command-t/ruby/command-t
    (optional) rvm use system OR rbenv local system
    ruby extconf.rb
    make

Now you're vimming!
