#!/bin/bash

if [ -n "$GITHUB_WORKSPACE" ]; then
  cd "$GITHUB_WORKSPACE" || exit
fi

USER=$(echo "$GITHUB_REPOSITORY" | cut -d "/" -f1 )
PROJECT=$(echo "$GITHUB_REPOSITORY" | cut -d "/" -f2 )

github_changelog_generator -u $USER -p $PROJECT --token $INPUT_TOKEN $INPUT_CMD

FILE="CHANGELOG.md"
sed -i '/This Changelog was automatically generated/d' "$FILE"
