#!/bin/bash
error=$(./$1)
if [[ "$error" == "Erreur: Mauvais nombre de parametres" ]]; then
	echo "true"
	exit 1
fi
echo "false"
exit 0