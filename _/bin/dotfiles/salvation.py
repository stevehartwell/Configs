#!/usr/bin/env python3

# pylint: disable=invalid-name,missing-docstring

'''
Replace files in argv with symlinks to Configs/_/usr/shh

For example, tag the files you want to be saved as //Save/Config,
and then run:
    ./salvation.py $(mdfind -onlyin ~/_/ tag://Save/Config)
'''

import os
from pathlib import Path

from common import move_then_symlink


def main(argv: list[str]):
    opts = {'verbose': True}
    save_dir = Path("/Users/Shared/Configs/_/usr/shh")
    save_dir.mkdir(exist_ok=True)
    for item in [Path(i) for i in argv[1:] if not os.path.islink(i)]:
        move_then_symlink(item=item, dest_path=save_dir / item.name, **opts)


if __name__ == "__main__":
    import sys

    main(sys.argv)
