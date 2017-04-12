# Fish directory
set -x FISH_DIR (dirname (status -f))

# XDG Base Directory Specification
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_DATA_HOME $HOME/.local/share

# Path
set -g fish_user_paths "/usr/local/bin" $fish_user_paths

# theme
set fish_theme agnoster


#--------------------------------------------------
# vim
#--------------------------------------------------
set -x EDITOR vim
set -x VIMINIT 'let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'


#--------------------------------------------------
# direnv - https://github.com/direnv/direnv
#--------------------------------------------------
if type direnv >/dev/null 2>&1
  eval (direnv hook fish)
end


#--------------------------------------------------
# asdf - https://github.com/asdf-vm/asdf
#--------------------------------------------------

set -x ASDF_DIR $HOME/.asdf

if test -d "$ASDF_DIR"
  source $ASDF_DIR/asdf.fish
  mkdir -p $FISH_DIR/completions
  cp -f $ASDF_DIR/completions/asdf.fish $FISH_DIR/completions/.

  # nodejs
  set -x GNUPGHOME $ASDF_DIR/keyrings/nodejs
  mkdir -p $GNUPGHOME
  chmod 0700 $GNUPGHOME
end
