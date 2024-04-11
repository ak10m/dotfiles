#!/bin/zsh

#--------------------------------------------------
# Google Cloud SDK
# https://cloud.google.com/sdk/docs/install
#--------------------------------------------------

() {
  # Google Cloud SDK install directory
  local GCP_SDK_DIR=${XDG_DATA_HOME}/google-cloud-sdk

  if [ -d "${GCP_SDK_DIR}" ]; then
    # The next line updates PATH for the Google Cloud SDK.
    source ${GCP_SDK_DIR}/path.zsh.inc

    # The next line enables shell com mand completion for gcloud.
    source ${GCP_SDK_DIR}/completion.zsh.inc
  fi
}
