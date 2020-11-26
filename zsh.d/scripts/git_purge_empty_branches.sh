#!/bin/bash

set -o errexit

if [[ $(git status | grep -E "nothing to commit|nothing added to commit but untracked files present") == "" ]]; then
  echo 'Please commit/stash any change before proceeding!'
  exit 1
fi

git fetch --all --prune

git checkout master > /dev/null

for branch in $(git branch | cut -c 3- | egrep -v '^(master|deployment)$'); do
  if [[ ! $(git cherry origin/master $branch | grep '^+') ]]; then
    git branch -D $branch

    if git branch -r | grep "origin/$branch\$"; then
      git push origin :$branch || true
    fi
  fi
done

git checkout - > /dev/null
