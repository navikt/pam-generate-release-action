#!/bin/bash

if [ -n "$GITHUB_WORKSPACE" ]; then
  cd "$GITHUB_WORKSPACE" || exit
fi

USER=$(echo "$GITHUB_REPOSITORY" | cut -d "/" -f1 )
PROJECT=$(echo "$GITHUB_REPOSITORY" | cut -d "/" -f2 )

if [ "$INPUT_USELATESTRELEASETAG" = "yes" ]; then
  LATEST_TAG=$(curl -s -H "Authorization: token $INPUT_TOKEN" "https://api.github.com/repos/$GITHUB_REPOSITORY/releases/latest" | jq '.tag_name' | sed -e 's/"//g')
  if [ "$LATEST_TAG" = "null" ]; then LATEST_TAG=$(git describe --abbrev=0 --tags);fi;
  $INPUT_CMD+=" --since-tag=$LATEST_TAG"
fi

github_changelog_generator -u $USER -p $PROJECT --token $INPUT_TOKEN $INPUT_CMD

FILE="CHANGELOG.md"
sed -i '/This Changelog was automatically generated/d' "$FILE"
