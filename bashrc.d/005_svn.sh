#!/bin/bash

export SVN_EDITOR=vim

svnRemoveUntrackedFiles() {
    svn st | grep '^?' | awk '{print $2}' | xargs rm -rf
}

svnAddUntrackedFiles() {
    svn st | grep '^?' | awk '{print $2}' | xargs svn add
}

