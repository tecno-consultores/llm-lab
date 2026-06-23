#!/usr/bin/env bash
# Made by Sinfallas <sinfallas@yahoo.com>
# Licence: GPL-2
export LC_ALL=C
LOCKFILE="/tmp/$(basename $0)_$(whoami)"
LOCKFD="150"
SID_FILE="$HOME/.sid.txt"
# change this
token="TOKEN"
url="https://n8n.example.com/webhook/path"
miip="192.168.1.1"

function clean_1() {
        rm -f "$LOCKFILE"
        echo -e "\e[00m"
}


function lock () {
	echo {LOCKFD}>"$LOCKFILE"
	flock -n $LOCKFD
}


function exit_error () {
        echo "ERROR: Ya hay una instancia en ejecución. Saliendo" >&2
        exit 1
}


if ! [[ -f $SID_FILE ]]; then
        echo $(openssl rand -hex 32) > $SID_FILE
fi
sid=$(cat $SID_FILE)


modo="normal"
if [[ ! -z "$1" ]]; then
    if [[ "$1" == "retro" ]]; then
        modo="retro"
    fi
fi


trap "clean_1; exit" 0 1 2 3 9 15
lock || exit_error


disponible=$(curl --http2 -s -o /dev/null -w "%{http_code}" --request POST ${url})
if [[ "$disponible" == "403" ]]; then
        echo -e "\e[00;1;92mPara salir presione Ctrl + C\e[00m"
else
        echo -e "\e[00;31mServicio no disponible.\e[00m"
        exit 1
fi


while true; do
        echo ""
        echo -e "\e[00;1;92mEscribe tu mensaje:\e[00m"
        read -t 60 prompt
        if [[ $? -gt 128 ]] ; then
                echo -e "\e[00;31mTiempo de espera agotado.\e[00m" >&2
                exit 1
        fi
	curl_cmd="curl --http2 -s --request POST '${url}' -d 'chatInput=${prompt}&sessionId=${sid}&MiIp=${miip}' -H 'Accept: application/json' -H 'Authorization: Bearer ${token}' | jq -r '.output'"
	echo -e "\e[00;1;92mI.A.:\e[00m"
	if [[ "$modo" == "retro" ]]; then
		echo -e "\e[00;1;32m"
		eval "$curl_cmd | pv -qL 10"
	else
                echo ""
		eval "$curl_cmd"
	fi
done
exit 0
