#/bin/sh 

# check_ssh command def

define command {
  command_name check_ssh 
  command_line /usr/lib/nagios/plugins/check_ssh '$HOSTADDRESS$'
}

define service {
  use generic-service 
  host_name localhost 
  service_description SSH 
  check_command check_ssh
}
