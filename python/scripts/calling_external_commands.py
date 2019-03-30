#!/usr/bin/env python3 

""" execute something outside of python
"""

import subprocess 

retcode = subprocess.call(['ls', '-l', '/home'])

print('Returned: ', retcode)

retcode = subprocess.call(['ls', '-l', '/home/nobody'])

print("Returned: ", retcode)
