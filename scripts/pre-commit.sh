#!/usr/bin/env bash

# Note: This is based on a tutorial which can be found here:
#       https://medium.com/@kevin.gamboa/how-to-configure-a-pre-commit-for-a-flutter-application-29dfbb853366

printf "\e[33;1m%s\e[0m\n" 'Pre-Commit'

# Undo the stash of the files
pop_stash_files() {
    if [ -n "$hasChanges" ]; then
        printf "\e[33;1m%s\e[0m\n" '=== Applying git stash changes ==='
        git stash pop
    fi
}

# Stash unstaged files
hasChanges=$(git diff)
if [ -n "$hasChanges" ]; then
    printf "\e[33;1m%s\e[0m\n" 'Stashing unstaged changes'
    git stash push --keep-index
fi

# Flutter formatter
printf "\e[33;1m%s\e[0m\n" '=== Running Flutter Formatter ==='
dart format lib test

# Arb sorting
printf "\e[33;1m%s\e[0m\n" '=== Running Flutter Formatter ==='
find localization -name "*.arb" -exec dart run arb_utils sort {} \;

hasNewFilesFormatted=$(git diff)
if [ -n "$hasNewFilesFormatted" ]; then   
    printf "\e[33;1m%s\e[0m\n" 'Formatted files need to be staged for commit'
    pop_stash_files
    exit 1
fi
printf "\e[33;1m%s\e[0m\n" 'Finished running Flutter Formatter'
printf '%s\n' "${avar}"

# Flutter Analyzer
printf "\e[33;1m%s\e[0m\n" '=== Running Flutter analyzer ==='
flutter analyze lib test
if [ $? -ne 0 ]; then
    printf "\e[31;1m%s\e[0m\n" '=== Flutter analyzer error ==='
    pop_stash_files
    exit 1
fi
printf "\e[33;1m%s\e[0m\n" 'Finished running Flutter analyzer'
printf '%s\n' "${avar}"

# Unit tests
printf "\e[33;1m%s\e[0m\n" '=== Running Unit Tests ==='
flutter test
if [ $? -ne 0 ]; then
    printf "\e[31;1m%s\e[0m\n" '=== Unit tests error ==='
    pop_stash_files
    exit 1
fi
printf "\e[33;1m%s\e[0m\n" 'Finished running Unit Tests'
printf '%s\n' "${avar}"

pop_stash_files
