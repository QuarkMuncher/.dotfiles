#!/bin/bash

link() {
  for file in $( ls -A | grep -vE '\.exclude*|\.git$|\.gitignore|\.gitmodules|.*.md' ) ; do
    ln -sv "$PWD/$file" "$HOME" || true
  done
}

link
