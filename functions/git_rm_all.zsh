#! /bin/bash
function git_rm_all(){
    git rm `git status | grep deleted | awk '{print $3}'`
}
git_rm_all
