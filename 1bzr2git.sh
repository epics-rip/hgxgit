#!/bin/sh
set -e -x

die() {
  echo "$1"
  exit 1
}

branch=${1:-"3.14"}
target=${2:-"epics-base"}

if [ -d bzr2git ]
then
    cd bzr2git
else
    git init bzr2git

    cd bzr2git

    git remote add ${branch} bzr::lp:~epics-core/epics-base/${branch}
    git remote add github https://epics-bot:2b4ac3ffdbfe648faffcbbb9c4f353758fe37b82@github.com/epics-base/${target}.git
fi

git fetch ${branch}

git push --tags github +${branch}/master:refs/heads/${branch}
