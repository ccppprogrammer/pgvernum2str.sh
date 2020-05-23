#!/bin/bash

PG_VERSION_NUM=$1

if ! [[ "${PG_VERSION_NUM}" =~ ^[0-9]+$ ]]; then
	echo "ERROR: incorrect version number '${PG_VERSION_NUM}'"
	exit 1
fi

case ${#PG_VERSION_NUM} in
	5)
		# Format: MMmmPP: M - major, m - minor, P - patch
		PG_VERSION_MAJOR=$((${PG_VERSION_NUM} / 10000))
		PG_VERSION_MINOR=$((${PG_VERSION_NUM} % 10000 / 100))
		PG_VERSION_PATCH=$((${PG_VERSION_NUM} % 100))
		echo "${PG_VERSION_MAJOR}.${PG_VERSION_MINOR}.${PG_VERSION_PATCH}"
		;;
	6)
		# Format: MMmmmm: M - major, m - minor
		PG_VERSION_MAJOR=$((${PG_VERSION_NUM} / 10000))
		PG_VERSION_MINOR=$((${PG_VERSION_NUM} % 10000))
		echo "${PG_VERSION_MAJOR}.${PG_VERSION_MINOR}"
		;;
	*)
		echo "ERROR: incorrect version number '${PG_VERSION_NUM}'"
		exit 1
		;;
esac
