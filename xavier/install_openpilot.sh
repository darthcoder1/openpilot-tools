#!/bin/bash

OPENPILOT_INSTALL_PATH=$PWD

# repositories
OPENPILOT_REPO_URL=git@github.com:yaak-ai/openpilot.git
OPENPILOT_REPO_NAME="$(basename $OPENPILOT_REPO_URL .git)"

OPENPILOT_TOOLS_REPO_URL=git@github.com:yaak-ai/openpilot-tools.git
OPENPILOT_TOOLS_REPO_NAME="$(basename $OPENPILOT_TOOLS_REPO_URL .git)"

# if an argument is passed, it is considered an git repo override. 
if [ -n "${1+set}" ]; then
    OPENPILOT_REPO_URL=$1
    OPENPILOT_REPO_NAME="$(basename $OPENPILOT_REPO_URL .git)"
fi

# clone forked 'openpilot' repository
git clone $OPENPILOT_REPO_URL
cd $OPENPILOT_REPO_NAME
pipenv install
pipenv shell

# clone forked 'openpilot-tools'
git clone $OPENPILOT_TOOLS_REPO_URL
cd $OPENPILOT_TOOLS_REPO_NAME
pip install -r requirements.txt # Install openpilot-tools dependencies in virtualenv


echo 'export PYTHONPATH="$PYTHONPATH:$OPENPILOT_INSTALL_PATH"' >> ~/.bashrc
source ~/.bashrc
