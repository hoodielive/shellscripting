import os
import subprocess 
from email.mime.text import MIMEText

LIMIT = 80
DIR = '/var' 
SUBJECT = f'{DIR} disk usage is reaching limit'
MAILTO = ""
MAILX = 'mailx'

def check_binary():
    subprocess.call(['which', 'mailx', '>', '2>/dev/null'], shell=True]
    if not subprocess.call(["echo", '$?'], shell=True) == 0:
        print("The application mailx is not installed on this server")
        subprocess.call("exit", "1", shell=True)

os.chdir(DIR)

# 
