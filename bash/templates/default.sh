#!/usr/bin/env bash

function usage() {
  print "
Program: your_function

This function displays the default phrase \"howdy!\" or it displays a message provided by the user at the command line.

Usage: ${1##*/} [-?vV] 

  Where:
    -v = Verbose mode - displays your_function function info
    -V = Very Verbose Mode - debug output displayed
    -? = Help - display this message

\"AutoContent\" enabled
"
}
################################################################
#### 
#### Description:
#### 
#### Place a full text description of your shell function here.
#### 
#### Assumptions:
#### 
#### Provide a list of assumptions your shell function makes,
#### with a description of each assumption.
#### 
#### Dependencies:
#### 
#### Provide a list of dependencies your shell function has,
#### with a description of each dependency.
#### 
#### Products:
#### 
#### Provide a list of output your shell function produces,
#### with a description of each product.
#### 
#### Configured Usage:
#### 
#### Describe how your shell function should be used.
#### 
#### Details:
#### 
#### Place nothing here, the details are your shell function.
#### 
################################################################
configure_your_function()
{
#### 
#### Notice this function is a POSIX function so that it can see local
#### and global variables from calling functions and scripts.
#### 
#### Configuration parameters can be stored in a file and
#### this script can be dynamically reconfigured by sending
#### the running script a HUP signal using the kill command.
#### 
#### Configuration variables can be defined in the configuration file using
#### the same syntax as defining a shell variable, e.g.: VARIABLE="value"

  CFILE=~/.your_function.conf

  (( VERBOSE == TRUE )) && print -- "# Configuration File: ${CFILE}"

  if [[ -f ${CFILE} ]]
  then
      (( VERBOSE == TRUE )) && cat ${CFILE}
      . ${CFILE}
  fi

  return 0
}  
################################################################
function your_function {
  typeset VERSION="1.0"
  typeset TRUE="1"
  typeset FALSE="0"
  typeset VERBOSE="${FALSE}"
  typeset VERYVERB="${FALSE}"

#### Set up a trap of the HUP signal to cause this script
#### to dynamically configure or reconfigure itself upon
#### receipt of the HUP signal.

  trap "configure_your_function ${0}" HUP

#### Read the configuration file and initialize variables by
#### sending this script a HUP signal

  kill -HUP ${$}

#### Process the command line options and arguments.

  while getopts ":vV" OPTION
  do
      case "${OPTION}" in
          'v') VERBOSE="${TRUE}";;
          'V') VERYVERB="${TRUE}";;
          '?') usage "${0}" && return 1 ;;
          ':') usage "${0}" && return 1 ;;
          '#') usage "${0}" && return 1 ;;
      esac
  done
   
  shift $(( ${OPTIND} - 1 ))
  
  trap "usage ${0}" EXIT

#### Place any command line option error checking statements
#### here.  If an error is detected, print a message to
#### standard error, and return from this function with a
#### non-zero return code.  The "trap" statement will cause
#### the "usagemsg" to be displayed.

  trap "-" EXIT
  
  (( VERYVERB == TRUE )) && set -x
  (( VERBOSE  == TRUE )) && print -u 2 "# Version........: ${VERSION}"

################################################################

####
#### Your shell function should perform it's specfic work here.
#### All work performed by your shell function should be coded
#### within this section of the function.  This does not mean that
#### your function should be called from here, it means the shell
#### code that performs the work of your function should be 
#### incorporated into the body of this function.  This should
#### become your function.
#### 

  print -- "# MSG = ${MSG}"

  trap "-" HUP

  return 0
}
################################################################

your_function "${@}"


