import subprocess 

def parse_quotas():
    output = subprocess.check_output(['quota', 'v', '/nfsmount'], shell=True)
    parse_output = output.decode('utf-8').strip('').split(' ')
    strip_parse = list(filter(None, parse_output))
    limit = strip_parse[17]
    print(strip_parse)
    
comments="""
convert blocks to GB to %
if block is 80% of ql then email user else pass 
posix standards require that the default output of 'df' or 'du' be in 512 byte blocks 
convert 512 byte blocks to kilobytes by dividing them by 2
convert byte blocks by multiplying by 512
"""

parse_quotas()
