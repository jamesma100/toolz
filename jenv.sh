#!/bin/bash

name=${1:-"my_project"}

if [ -d "$name" ]; then
	echo "$name exists. Exiting."
	exit 1
fi

mkdir "$name" && cd "$name"
python3 -m venv venv
source ./venv/bin/activate
pip install flask requests numpy pandas \
	seaborn urllib3 pytest pep8 pex

