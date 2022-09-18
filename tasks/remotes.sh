#! /usr/bin/env bash

git remote

[[ "$(git remote)" == *"origin"* ]] || git remote add origin "git@git.sr.ht:~vlnk/me"
[[ "$(git remote)" == *"github"* ]] || git remote add github --mirror=push "git@github.com:vlnk/vlnk.git"
[[ "$(git remote)" == *"gitlab"* ]] || git remote add gitlab --mirror=push "git@gitlab.com:vlnk/vlnk.git"
