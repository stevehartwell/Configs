'''
move_then_symlink
'''

from pathlib import Path
import shutil
import sys


def move_then_symlink(item: Path, dest_path: Path):
    '''move_then_symlink'''
    if dest_path.exists():
        sys.stderr.write(f"{dest_path} exists, skipping\n")
        return
    try:
        is_dir = item.is_dir()
        shutil.move(item, dest_path)
        item.symlink_to(dest_path, is_dir)
    except OSError as failure:
        sys.stderr.write(f"move: {item} to {dest_path}: {failure}\n")
