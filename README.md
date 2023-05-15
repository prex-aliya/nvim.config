# NVIM Configuration

This is my neovim configuration files

It is transformed into lua,
Although I am too lazy to transform my colorscheme into lua as well.

_Added work off the bat diff file to help with little to no dependencys_

# Install

git clone this repo, then install
[packer](https://github.com/wbthomason/packer.nvim#quickstart) if not
already installed.


Then Run 

    :PackerInstall

To Download all the plugins


Then you need to install (nerd font)[https://www.nerdfonts.com/] to have the
full Experience

## NerdFont install

Download your font, then unzip, most lily by:

    unzip [file-name.zip]

Then Move them into the ~/.local/share/fonts/ .
/usr/share/fons/ or /usr/local/share/fonts if you want
all users to have access to this.

    mv [file-names] ~/.local/share/fonts

After Moving the files, you need to update the fonts cache

    fc-cache -fv


# Problems And Fixes

## surf and markdown preview

The default browser for my setup up is surf, and when you run markdown preview and
nothing happens try:

'''console
:call mkdp#util#install()
'''

Else make an issue.



<!-- vim: tw=80
