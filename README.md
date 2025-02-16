New way of handling dotfiles.

## Requirements

- GNU Stow
- Git

## Installation

Have this directory e.g. `dotfiles_new` or `dotfiles` in the home directory.

## Usage

Edit and add files as normal. Use git in this directory to version control.
Then run `stow .` to symlink the files in this files to the home directory.

# Advanced Usage

    stow --adopt . 

Will copy conflicting files from homedirectory to dotfiles and symlink after.


