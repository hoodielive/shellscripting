#!/bin/bash

set -x

unset THE_DOMAIN
unset NEW_YEAR



# Functions
log_begin_msg_pre() { :; }
log_begin_msg_post() { :; }

log_warning_msg () { if [ -n "${1:-}" ]; then log_begin_msg $@ "..." fi log_end_msg 255 || true }

log_begin_msg() { log_begin_msg_pre "$@" if [ -z "${1:-}" ]; then return 1 fi echo -n "$@" || true log_begin_msg_post "$@" }

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
if [ "${RENEW_CERT} " == "1" ]; then
	echo "For what domain are you renewing?"
	read THE_DOMAIN

	echo "For what year is this renewal?"
	read NEW_YEAR
else
	echo "Moving on.."
	#log_warning_msg "Error: Please check your entries as something has went awfully wrong."
fi

# We should set permissions on new certificates, csrs and keys.
chmod 0644 /etc/pki/tls/private/{DOMAIN}.${NEW_YEAR}.key
chmod 0644 /etc/pki/tls/private/{DOMAIN}.${NEW_YEAR}.csr
chmod 0644 /etc/pki/tls/certs/{DOMAIN}.${NEW_YEAR}.crt
chmod 0644 /etc/pki/tls/private/{SHORTNAME}-ca-bundle.${NEW_YEAR}.crt


if [ "${OPTARG}" == "1" ]; then
		# Decommission old certificates.
		unlink /etc/pki/tls/private/${DOMAIN}.key
		unlink /etc/pki/tls/private/${DOMAIN}.csr
		unlink /etc/pki/tls/certs/${DOMAIN}.crt
		unlink /etc/pki/tls/certs/${SHORTNAME}-ca-bundle.crt

		# Commission new certificates.
		ln -s /etc/pki/tls/private/${DOMAIN}.${NEW_YEAR}.key /etc/pki/tls/private/${DOMAIN_KEY}.key
		ln -s /etc/pki/tls/private/${DOMAIN}.${NEW_YEAR}.csr /etc/pki/tls/private/${DOMAIN_CSR}.csr
		ln -s /etc/pki/tls/certs/${DOMAIN}.${NEW_YEAR}.crt /etc/pki/tls/certs/${DOMAIN}.crt
		ln -s /etc/pki/tls/certs/${SHORTNAME}-ca-bundle.${NEW_YEAR}.crt /etc/pki/tls/certs/${SHORTNAME}-ca-bundle.crt
	else
		echo "Moving on.."
		#log_warning_msg "Error: Please check your requirements."
fi
