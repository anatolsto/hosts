#!/bin/bash
if [[ $# -ne 1 ]]; then echo "Utilizare: $0 fisier_hosts" >&2; exit 1; fi
FILE=$1
if [[ ! -f $FILE ]]; then echo "Eroare: fisierul $FILE nu exista" >&2; exit 1; fi
valid_ip() {
           [[ $1 =~ ^([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})$ ]] || return 1
           for o in "${BASH_REMATCH[@]:1}"; do (( 10#$o <= 255 )) || return 1; done
}
while read -r ip rest; do
         [[ -z $ip || $ip == \#* ]] && continue

         if valid_ip "$ip"; then echo "$ip: valida"; else echo "$ip: INVALIDA"; fi
done < "$FILE"
