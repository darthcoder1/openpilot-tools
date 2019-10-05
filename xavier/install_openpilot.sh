#!/bin/bash

OPENPILOT_PATH=~/dev/yaak/openpilot

# clone forked 'openpilot'
git clone git@github.com:darthcoder1/openpilot.git
cd openpilot
pipenv install # Install dependencies in a virtualenv
pipenv shell # Activate the virtualenv

# clone forked 'openpilot-tools'
git clone https://github.com:darthcoder1/openpilot-tools.git tools
cd tools
pip install -r requirements.txt # Install openpilot-tools dependencies in virtualenv


echo 'export PYTHONPATH="$PYTHONPATH:$OPENPILOT_PATH"' >> ~/.bashrc
source ~/.bashrc
