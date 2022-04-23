#!/usr/bin/env bash
#
#set -x
#######################################
declare -A morse

morse[A]='. -'
morse[B]='- . . .'
morse[C]='- . - .'
morse[D]='- . .'
morse[E]='.'
morse[F]='. . - .'
morse[G]='- - .'
morse[H]='. . . .'
morse[I]='. .'
morse[J]='. - - -'
morse[K]='- . -'
morse[L]='. - . .'
morse[M]='- -'
morse[N]='- .'
morse[O]='- - -'
morse[P]='. - - .'
morse[Q]='- - . -'
morse[R]='. - .'
morse[S]='. . .'
morse[T]='-'
morse[U]='. . -'
morse[V]='. . . -'
morse[W]='. - -'
morse[X]='- . . -'
morse[Y]='- . - -'
morse[Z]='- - . .'
morse[Ą]='. - . -'
morse[Ć]='- . - . .'
morse[Ę]='. . - . .'
morse[Ł]='. - . . -'
morse[Ń]='- - . - -'
morse[Ó]='- - - .'
morse[Ś]='. . . - . . .'
morse[Ż]='- - . . - .'
morse[Ź]='- - . . -'
morse[1]='. - - - -'
morse[2]='. . - - -'
morse[3]='. . . - -'
morse[4]='. . . . -'
morse[5]='. . . . .'
morse[6]='- . . . .'
morse[7]='- - . . .'
morse[8]='- - - . .'
morse[9]='- - - - .'
morse[0]='- - - - -'
#######################################


function Help () {
	printf "\n Program na zaliczenie służący do tłumaczenia dowolnego tekstu w języku polskim lub angielskim na język morsa."
	printf "\n Program wykorzystuje standardowe wejście do działania. By użyć go na pliku tekstowym, wystarczy wkleić jego zawartość albo"
	printf " przekierować jego zawartość do skryptu."

	printf "Do zakończenia działania pliku należy wykorzystać znak © (alt + R). \n\n UWAGA! W wypadku nieoczekiwanego zamknięcia translatora,"
	printf "Wszystkie przetłumaczone do tej pory znaki zapisane zostaną w pliku 'plik.temp'. Plik ten zostanie usunięty przy ponownym"
	printf " uruchomieniu translatora."
	printf "\n\n Opcje: \n -h lub -help    ||     uruchamia widok pomocy   \n";
}


while getopts ":h" option; do
         Help
         exit
done
while getopts "::help" option; do
         Help
         exit
done

touch plik.temp
while read -rN1 c; do
	c=${c^}
	if [[ $c == $'\n' ]]; then
		printf '\n' >> plik.temp
	elif [[ $c == ' ' ]]; then
		printf '       ' >> plik.temp
	elif [[ $c == '©' ]]; then
		cp plik.temp plik_morsa
		rm plik.temp
		exit
	
	else
		printf '%s   ' "${morse[$c]}" >> plik.temp
	fi
done

cp plik.temp plik_morsa
rm -f plik.temp
