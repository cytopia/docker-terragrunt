#!/bin/sh

set -eu

###
### Default values
###
DEFAULT_UID=1000
DEFAULT_GID=1000
DEFAULT_USER=cytopia
DEFAULT_HOME=/home/cytopia
RUN_ROOT=1


###
### Get environment variables
###
if env | grep -q '^RUN_NON_ROOT='; then
	RUN_NON_ROOT="$( env | grep '^RUN_NON_ROOT=' | awk -F'=' '{print $2}' )"
	if [ "${RUN_NON_ROOT}" = "1" ]; then
		RUN_ROOT=0
	fi
fi
if env | grep -q '^UID='; then
	DEFAULT_UID="$( env | grep '^UID=' | awk -F'=' '{print $2}' )"
fi
if env | grep -q '^GID='; then
	DEFAULT_GID="$( env | grep '^GID=' | awk -F'=' '{print $2}' )"
fi


if [ "${RUN_ROOT}" = "0" ]; then
	###
	### Add user and adjust permissions
	###
	>&2 echo "Creating user '${DEFAULT_USER}' (uid: ${DEFAULT_UID} gid: ${DEFAULT_GID}) in '${DEFAULT_HOME}'"
	echo "${DEFAULT_USER}:x:${DEFAULT_UID}:${DEFAULT_GID}:${DEFAULT_USER}:${DEFAULT_HOME}:/bin/sh" >> /etc/passwd
	mkdir -p "${DEFAULT_HOME}"
	chown -R "${DEFAULT_UID}:${DEFAULT_GID}" "${DEFAULT_HOME}"

	>&2 printf "\\e[0;92m%s> %s\\e[0m\\n" "${DEFAULT_USER}" "${*}"
	exec su "${DEFAULT_USER}" -c "${*}"
else
	>&2 printf "\\e[0;91m%s> %s\\e[0m\\n" "root" "${*}"
	exec "${@}"
fi
