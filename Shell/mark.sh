#!/bin/sh

note=0
g=$(find . -name note.csv)

if [ "$g" != "./note.csv" ]; then
  echo "Nom; Prenom; Note" > note.csv
fi

nom=$(grep -Eo '[a-zA-Z]+$' readme.txt)
prenom=$(grep -Eo '^[a-zA-Z]+' readme.txt)

for i in main.c Makefile; do
  found=$(find . -name "$i")
  if [ "$found" != "./$i" ]; then
    echo "COMMENT J'EXECUTE CA ???? 0/20"
    echo "$nom; $prenom; $note" >> note.csv
    exit 0
  fi
done

header=$(find . -name header.h)
if [ "$header" != "./header.h" ]; then
  echo "pas de header"
  note=$(expr "$note" - 2)
else
  note=$(expr "$note" + 2)
fi

chmod +x function/*.sh

make

if [ ! -f factorielle ]; then
  echo "$nom; $prenom; $note" >> note.csv
  echo "le make fonctionne meme pas travail frauduleux."
  exit 0
fi

f=factorielle

facta10=$(./function/facta10.sh "$f")
fact0=$(./function/fact0.sh "$f")
negative=$(./function/negative.sh "$f")
noInput=$(./function/noInput.sh "$f")
hasSignature=$(./function/hasSignature.sh)
countLinesMain=$(./function/countLines.sh main.c)
countLinesHeader=$(./function/countLines.sh header.h)
hasTabMain=$(./function/hasTab.sh main.c)
hasTabHeader=$(./function/hasTab.sh header.h)

if [ "$hasSignature" = "true" ]; then
  echo "La signature int factorielle( int number ) est bien presente"
  note=$(expr "$note" + 2)
else
  echo "La signature int factorielle( int number ) n'est pas presente"
fi

if [ "$facta10" = "true" ]; then
  note=$(expr "$note" + 5)
  echo "factorielle jusqu'a 10 realisable"
else
  echo "factorielle jusqu'a 10 non realisable"
fi

if [ "$fact0" = "true" ]; then
  note=$(expr "$note" + 3)
  echo "factorielle de 0 bien traité"
else
  echo "pas de factorielle de 0 ?"
fi

if [ "$negative" = "true" ]; then
  note=$(expr "$note" + 4)
  echo "message d'erreur present when nombre negatif"
else
  echo "pas de traitement de negatif ?"
fi

if [ "$noInput" = "true" ]; then
  note=$(expr "$note" + 4)
  echo "message d'erreur present when pas d'entrée"
else
  echo "meme pas ca traite les entrées..."
fi

if [ "$countLinesMain" = "false" ] || [ "$countLinesHeader" = "false" ]; then
  echo "gr gr gr gr plus de 80 lignes pas bien"
  note=$(expr "$note" - 2)
else
  echo "bien bien ici on respecte les regles"
fi

if [ "$hasTabMain" = "true" ] && [ "$hasTabHeader" = "true" ]; then
  echo "bien bien ici on respecte les regles il y'a des tab"
else
  echo "gr gr gr gr pas de tab c'est pas bien"
  note=$(expr "$note" - 2)
fi

make clean

if [ -f factorielle ]; then
  note=$(expr "$note" - 2)
  echo "le make clean ne marche pas super !!!!!!!"
fi

echo "$nom; $prenom; $note" >> note.csv
