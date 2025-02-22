#!/usr/bin/env python3

# pylint: disable=invalid-name,missing-docstring

'''
Move files and replace with symlink
'''

import os
from pathlib import Path
from common import move_then_symlink


def main(argv: list[str]):
    save_dir = Path('/Volumes/NoSave/NAS/_Configs@/_')
    save_dir.mkdir(exist_ok=True)
    for item in [Path(i) for i in argv[1:] if not os.path.islink(i)]:
        move_then_symlink(item, save_dir / item.name)


if __name__ == '__main__':
    import sys

    main(sys.argv)
