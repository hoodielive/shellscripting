#!/bin/bash

unset OLD_CERT
unset OLD_CSR
unset OLD_KEY
unset OLD_BUNDLE
unset NEW_CERT
unset NEW_CSR
unset NEW_KEY
unset NEW_BUNDLE

DATE=$(date +"%Y") # Parse year from date command.
OLD_CERT=0
OLD_CSR=0
OLD_KEY=0
OLD_BUNDLE=0
NEW_CERT=0
NEW_CSR=0
NEW_KEY=0
NEW_BUNDLE=0

# Functions
log_begin_msg_pre() { :; }
log_begin_msg_post() { :; }

log_warning_msg () {
    if [ -n "${1:-}" ]; then
        log_begin_msg $@ "..."
    fi
    log_end_msg 255 || true
}

log_begin_msg() {
	log_begin_msg_pre "$@"
	if [ -z "${1:-}" ]; then
		return 1
	fi
	echo -n "$@" || true
	log_begin_msg_post "$@"
}

figure_out_year() {
	echo  "What year is the renewal for? "
	read NEW_YEAR
}

help() {
	echo "Usage: Follow the instructions. "
}

OPTIND=1

while getopts drqh: OPT ; do
	case $OPT in
		-d) DEBUG=1 ;;
    -r) RENEW_CERT=1 ;; 
    -q) QUERY_CERT=1 ;;
		-h) GET_HELP=1 ;;
		default)
			help ;;
	esac
done
shift $(( $OPTIND - 1 ))

# @Enable Debugging?
if [ "${OPTARG}" == "d" ]; then
	set -x
else
	echo "Do nothing."
fi

# @Cert Renewal?
if [ "${OPTARG} " == "r" ]; then
	echo "Cert renewal for which domain? "
	read DOMAIN

	echo "What year was the present certificate issued? "
	read OLD_YEAR

	echo "And you are attempting to renew cert for year ${DATE} "
	read NEW_YEAR_ANSWER
else
	echo "Moving on.."
	#log_warning_msg "Error: Please check your entries as something has went awfully wrong."
fi

echo "Is ${DOMAIN} the correct domain for cert renewal? yes or no "
read ANSWER

if [ "${NEW_YEAR_ANSWER}" == "yes" ]; then
	NEW_YEAR=${DATE}
else
	figure_out_year
fi

if [ "${ANSWER}" == "yes" ]; then
		# @Decommission old certificates.
		unlink /etc/pki/tls/private/${DOMAIN}.${OLD_YEAR}.key
		unlink /etc/pki/tls/private/${DOMAIN}.${OLD_YEAR}.csr
		unlink /etc/pki/tls/certs/${DOMAIN}.${OLD_YEAR}.crt
		unlink /etc/pki/tls/certs/${DOMAIN_BUNDLE}.${OLD_YEAR}.crt

		# @Commission new certificates.
		ln -s /etc/pki/tls/private/${DOMAIN}.${NEW_YEAR}.key /etc/pki/tls/private/${DOMAIN_KEY}.key
		ln -s /etc/pki/tls/private/${DOMAIN}.${NEW_YEAR}.csr /etc/pki/tls/private/${DOMAIN_CSR}.csr
		ln -s /etc/pki/tls/certs/${DOMAIN}.${NEW_YEAR}.crt /etc/pki/tls/certs/${DOMAIN}.crt
		ln -s /etc/pki/tls/certs/${DOMAIN_BUNDLE}.${NEW_YEAR}.crt /etc/pki/tls/certs/${DOMAIN_BUNDLE}.crt
	else
		echo "Moving on.."
		#log_warning_msg "Error: Please check your requirements."
fi
