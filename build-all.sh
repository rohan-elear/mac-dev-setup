  #!/bin/bash

##********************************************************************************************#
 # @brief         Toolchain build for automted build and export by Jenkins CICD
 # @details       Script to build artifacts and upload to conan server by Jenkins CICD
 # @author        T Venkata Deekshith, venkatadeekshith@elear.solutions
 # @author        Rohan Sahay, rohansahay@elear.solutions
 # @copyright     Copyright (c) 2020 Elear Solutions Tech Private Limited.
 #                All rights reserved.
 # @license       To any person (the "Recipient") obtaining a copy of this software
 #                and associated documentation files (the "Software"):
 #
 #                All information contained in or disclosed by this software is confidential
 #                and proprietary information of Elear Solutions Tech Private Limited and all
 #                rights therein are expressly reserved. By accepting this material the
 #                recipient agrees that this material and the information contained therein is
 #                held in confidence and in trust and will NOT be used, copied, modified,
 #                merged, published, distributed, sublicensed, reproduced in whole or in part,
 #                nor its contents revealed in any manner to others without the express
 #                written permission of Elear Solutions Tech Private Limited.
##********************************************************************************************#

# Exit script on Error
set -e

DEV_FOLDER=~/Developer
buildCmdBase="elear-conan-toolchain-build --upload --force-clean --toolchain mac"
#toolchain_ubuntu_x86_64 macos_x86_64
#toolchain_android_armeabi toolchain_android_aarch64 toolchain_android_x86 toolchain_android_x86_64 
#toolchain_alpine_x86_64
# build command for macOS and iOS
# buildCmdBase="${buildCmdBase} --strict"
buildCmdStable="${buildCmdBase} --channel develop"
# build command for macOS and iOS
buildCmd="${buildCmdBase} --channel master"
gitBranch=master
# if [ "$gitBranch" != "" ]; then
#   stableGitBranch="elear-$gitBranch"
# fi


declare -a public_repos=(
  "json-c"
  "zlib"
  "sqlite"
  "openssl"
  "curl"
  # "cmocka"
  # "meshlink"
  # "meshlink-mac"
  # "meshlink-test-roop-e2e-stable"
)

declare -a client_sdk_repos=(
  "vrb"
  "elearcommon"
  "httpclient"
  "cococommon"
  "cocostandard"
  "clusterprotocol"
  "cococpinterface"
  "cococlientsdk" # client
  # "cococlientsdk-java" # client
  # "coco-platform-qa-test-apps/client-app"
)

declare -a device_sdk_repos=(
  # "vrb"
  # "elearcommon"
  # "httpclient"
  # "httpserver"
  # "meshdemux"
  # "cococommon"
  # "cocostandard"
  # "clusterprotocol"
  # "cococpinterface"
  "cocodb" # device
  "cocodevicesdk" # device
  # "networkmanagementnode"
  # "coco-platform-qa-test-apps/device-app"
)

function build_repo_stable() {
  repos=("$@")
  cd $DEV_FOLDER
  for repo in "${repos[@]}"
  do
    echo "DEBUG: BUILD $repo"
    cd $repo
    if [ "$stableGitBranch" != "" ]; then
      echo "DEBUG: Fetching latest $stableGitBranch"
      git stash
      git checkout $stableGitBranch
      git pull
    fi
    rm -rf build/
    eval "$buildCmdStable"
    cd ..
  done
}

function build_repo() {
  repos=("$@")
  cd $DEV_FOLDER
  for repo in "${repos[@]}"
  do
    echo "DEBUG: BUILD $repo"
    cd $repo
    if [ "$gitBranch" != "" ]; then
    	echo "DEBUG: Fetching latest $gitBranch"
      git stash
    	git checkout $gitBranch
      git pull
    fi
    rm -rf build/
    if [[ "$repo" == "cococlientsdk" || "$repo" == "cocodevicesdk" ]]; then
      eval "$buildCmd --rebuild"
    else
      eval "$buildCmd"
    fi
    echo "[$(date +%Y%m%d_%H%M%S)] INFO: "
    cd ..
  done
}

echo "[$(date +%Y%m%d_%H%M%S)] INFO: BUILD STARTED"
logfile="build_$(date +%Y%m%d_%H%M%S).log"
# build_repo_stable "${public_repos[@]}" | tee -a "${logfile}"
build_repo "${client_sdk_repos[@]}" | tee -a "${logfile}"
# build_repo "${device_sdk_repos[@]}" | tee -a "${logfile}"
echo "[$(date +%Y%m%d_%H%M%S)] INFO: BUILD COMPLETED"
