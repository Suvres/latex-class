#!/bin/bash
mkdir -p _tex


if ! [ -d _tex ]; then
	echo "Brak katalogu \`_tex' !"
	exit 1
fi


echo -ne "\033]0;▶LaTEX compilation ("$PWD")\007"

for x in *.tex
do
	if head -n 1 "$x" | grep -q "documentclass"
	then
		main=$x
	fi
	cat $x | sed 's/ [ ]*/ /g;s/ \([a-zA-Z0-9]\) / \1~ /g' > _tex/$x
	
done

if ! [ -e "$main" ]
then
	echo -e "Brak pliku \`*.tex' !\033[0;37m"
	exit 2
fi

cp ./suvresdpl.cls ./_tex/
cd _tex;
ln -s ../images images


xelatex $main && xelatex $main && xelatex $main;

cp main.pdf ../main.pdf
cd ..

rm -rf _tex
