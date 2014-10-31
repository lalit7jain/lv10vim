lv10vim
=======

What/How/Why?

- powerline directory should go inside ~/.config/ (HOMEDIR). This directory is usually copied from:
    /home/lv10/.local/lib/python2.7/site-packages/powerline/bindings/

  You can choose to keep you defaults there and have tmux.conf. However, it makes more sense to have
  all config files in one place (~/.config/)


- The path in the ~/.vimrc should be modified so that Vundle can install the plugins. Line 15 is the
  line that needs to be modified: set rtp+=~/.vim/bundle/Vundle.vim
