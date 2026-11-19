#!/bin/bash
FILE="$HOME/etc/hosts"
valid_ip() {
        [[ $1 =~ ^([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})$ ]] || return 1
        if valid_ip "$ip"; then echo "$ip: valida"; else echo "$ip: INVALIDA"; fi
done < "$FILE"
