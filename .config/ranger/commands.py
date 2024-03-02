from __future__ import (absolute_import, division, print_function)

import os
import subprocess

# You always need to import ranger.api.commands here to get the Command class:
from ranger.api.commands import Command

class umpv(Command):
    """:umpv
    Add current file to the umpv queue
    """

    def execute(self):
        self.fm.execute_command(["umpv", self.fm.thisfile.path], flags='f')


class fzf(Command):
    """:fzf
    Fuzzy find files recursively under current directory
    """

    def execute(self):
        result = self.fm.execute_command("fzf", universal_newlines=True, stdout=subprocess.PIPE)
        path, _ = result.communicate()
        if not len(path):
            return
        path = os.path.realpath(path)
        self.fm.select_file(path)
