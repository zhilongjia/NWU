#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

git config --global user.email "zhilongjia@gmail.com"
git config --global user.name "Zhilong Jia"

git clone -b master https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git book-output
cd book-output
cp -r ../docs ./
git add --all *
git commit -m "Update the book at `TZ='Asia/Shanghai' date`" || true
git push -q origin master
