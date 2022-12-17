#!/bin/bash

if [[ $# -lt 2 ]]; then
	echo "Usage: ./mkrepo <username> <repo name> <optional path>"
	exit 1
fi
user=$1;
repo=$2;
loc=${3:-$(pwd)};
path="$loc/$repo";

echo "Creating repo $path for user $user...";
ret=$(curl -iu $user https://api.github.com/user/repos -d '{"name":'\"$repo\"',"private":true}' | head -n 1 | cut -d$' ' -f2)
if ![ "$ret" != 200 ]; then
	echo "Error code $ret: unable to create remote repository. Exiting."
	exit 1
fi

mkdir $path && 
cd $path &&
git init && 
touch README.md LICENSE.md .gitignore &&
git add . &&
git commit -m "first commit" &&
git branch -M main &&
git remote add origin "git@github.com:$user/$repo.git" &&
git push -u origin main
