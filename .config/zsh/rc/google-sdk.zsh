#--------------------------------------------------
# Google Cloud SDK
#--------------------------------------------------

# Google Cloud SDK install directory
export GCP_SDK_DIR=/usr/local/etc/google-cloud-sdk

if [ -d "$GCP_SDK_DIR" ]; then
  # The next line updates PATH for the Google Cloud SDK.
  source $GCP_SDK_DIR/path.zsh.inc

  # The next line enables shell command completion for gcloud.
  source $GCP_SDK_DIR/completion.zsh.inc
fi
