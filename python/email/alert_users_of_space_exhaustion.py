import os
import subprocess 
from email.mime.text import MIMEText

LIMIT = 80
DIR = '/home/ogun/Clones/shellscripting/python/email'
SUBJECT = f'{DIR} disk usage is reaching limit'
MAILTO = ""
MAILX = 'mailx'

def check_binary():
    subprocess.call(['which', 'mailx', '>', '2>/dev/null'], shell=True)
    if not subprocess.call(["echo", '$?'], shell=True) == 0:
        print("The application mailx is not installed on this server")
        subprocess.call("exit", "1", shell=True)

os.chdir(DIR)

# locate users 
def get_user():
    output = subprocess.check_output(['ls', '-dl']).decode('utf-8').strip('\n').split(' ')
    parse_output = output[2]
    print(parse_output) # if first-class function then return parse_out

def check_quotas():
    output = subprocess.check_output(['du', '-sBK']).decode('utf-8').strip('\t')
    limit = subprocess.check_output(['quota', 'v'])
    parse_output = output.split()
    used = parse_output[0].strip('K')
    print(parse_out)

def email_user():
    msg = MIMEText("WARNING: You have reached 80% of your quota for /home directories.")
    msg["From"] = ""
    msg["To"] = ""
    msg["Subject"] = "Quota nearing exhaustion"
    p = Popen(['/usr/sbin/sendmail', '-t', '-oi'], stdin=PIPE)
    p.communicate(msg.as_string())

#check_binary()
get_user()
check_quotas()
#email_user()
