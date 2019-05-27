#!/bin/bash

set -e

cd $(dirname $0)

tmp_path=./app.asar
target_path=${PWD}/fuck-xuexiqiangguo.app/Contents/Resources/app.asar

function download() {
	curl https://raw.githubusercontent.com/fuck-xuexiqiangguo/Fuck-XueXiQiangGuo/master/app.asar -o ${tmp_path}
}

function get_checksum() {
	version_file_url="https://raw.githubusercontent.com/fuck-xuexiqiangguo/Fuck-XueXiQiangGuo/master/version.json"
	echo $(curl ${version_file_url} | jq -r .sha256)
}

function calc_sha256() {
	echo $(openssl dgst -sha256 ${tmp_path} | awk '{print $2}')
}

function validate() {
	expected=$(get_checksum)
	actual=$(calc_sha256)

	if [ "${expected}" != "${actual}" ]; then
		echo "Error: sha256 validate failed!"
		echo "	expected: ${expected}"
		echo "	actual:   ${actual}"

		exit -1
	fi
}

function deploy() {
	mv ${tmp_path} ${target_path}
	echo "Successfully updated."
}

function main() {
	download
	validate
	deploy
}

main
