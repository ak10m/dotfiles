# Fish directory
set -x FISH_DIR (dirname (status -f))

# XDG Base Directory Specification
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_DATA_HOME $HOME/.local/share

# Path
#set -g fish_user_paths "/usr/local/bin" $fish_user_paths

# theme
set fish_theme bobthefish

# Environment Variables
set -x EDITOR nvim


# key bindings
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
  # bind \c] peco_select_ghq_repository
  bind \c] peco_select_ghq_repository_multi_root
end


#--------------------------------------------------
# vim
#--------------------------------------------------
alias vim='nvim'

#alias vi='vim'
#set -x VIMINIT 'let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'


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

#--------------------------------------------------
# golang
#--------------------------------------------------
if type go >/dev/null 2>&1
  set -x GOPATH $HOME/go
  set -g fish_user_paths "$GOPATH/bin" $fish_user_paths
end

#--------------------------------------------------
# Google Cloud SDK
#--------------------------------------------------

# Google Cloud SDK install directory
export GCP_SDK_DIR=/usr/local/lib/google-cloud-sdk

if test -d "$GCP_SDK_DIR"
  set -g fish_user_paths "$GCP_SDK_DIR/bin" $fish_user_paths

  # The next line updates PATH for the Google Cloud SDK.
  #source $GCP_SDK_DIR/path.fish.inc

  # The next line enables shell command completion for gcloud.
  #source $GCP_SDK_DIR/completion.zsh.inc
end

