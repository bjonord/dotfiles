#! /bin/bash
function grep_selecta(){
    vim `grep -lr $1 ./* | selecta`;
}
