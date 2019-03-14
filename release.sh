#!/bin/sh
#set -ex

# ensure we're up to date
git pull

# bump version
docker run --rm -v "$PWD":/bitcore treeder/bump patch
version=`cat VERSION`
echo "version: $version"

# run build
# ./push.sh
docker build -t seductive/bitcore:latest .

# tag it
git add -A
git commit -m "version $version"
git tag -a "$version" -m "version $version"
git push
git push --tags
docker tag seductive/bitcore:latest seductive/bitcore:$version
# push it
docker push seductive/bitcore:latest
docker push seductive/bitcore:$version
