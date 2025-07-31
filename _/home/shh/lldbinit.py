#
#
#

import os
import lldb

this_dir = os.path.dirname(os.path.abspath(__file__))
source_dir = os.path.join(os.path.join(this_dir, os.pardir), os.pardir)

lldb.debugger.HandleCommand('shell echo ' + __file__ + ' loaded.')
