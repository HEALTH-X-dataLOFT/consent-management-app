#!/usr/bin/env bash

# Note: This is based on a tutorial which can be found here:
#       https://medium.com/@kevin.gamboa/how-to-configure-a-pre-commit-for-a-flutter-application-29dfbb853366

GIT_DIR=$(git rev-parse --git-dir)

echo "Installing hooks..."
# this command creates symlink to our pre-commit script
ln -s ../../scripts/pre-commit.sh $GIT_DIR/hooks/pre-commit
echo "Done!"
