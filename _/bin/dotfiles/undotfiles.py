#!/usr/bin/env python3

# pylint: disable=invalid-name,missing-docstring

"""
undotfiles
"""

from pathlib import Path

from common import move_then_symlink


def main():
    dotless_dir = Path.home() / "_"
    dotless_dir.mkdir(exist_ok=True)
    for dotfile in [i for i in Path.home().iterdir() if i.name.startswith(".")]:
        if (
            dotfile.name.endswith("_history")
            or dotfile.name in exceptions
            or dotfile.is_symlink()
        ):
            continue
        dotless_path = dotless_dir / dotfile.name[1:]
        print(f"{dotfile} -> {dotless_path}")
        move_then_symlink(item=dotfile, dest_path=dotless_path)


exceptions = set(
    [
        ".bitwarden-ssh-agent.sock",
        ".CFUserTextEncoding",
        ".cups",
        ".DS_Store",
        ".lesshst",
        ".ssh",
        ".stCommitMsg",
        ".Trash",
        ".viminfo",
        ".zsh_sessions",
    ]
)


if __name__ == "__main__":
    main()
