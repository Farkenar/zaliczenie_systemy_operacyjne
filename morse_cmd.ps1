
param ($arg)

if($arg -eq "Help" -Or $arg -eq "help"  -Or $arg -eq "-h" -Or $arg -eq "-help" -Or $arg -eq "-Help"){
   Write-Host 'To jest program pozwalający przetłumaczyć plik z języka polskiego na język morsa. Plik który chcesz przetłumaczyć MUSI BYĆ plikiem .txt'
   Write-Host 'Uwaga! Wynik jest tylko do odczytu i nie zostanie nigdzie zapisany!'
}
else{


    $loc = Read-Host "Wprowadź pełną ścieżkę do pliku(np. C:\Users\admin\Desktop\):"
    $nazwa = Read-Host "Wprowadź nazwę pliku(Bez rozszerzenia .txt):"

    $morse = @{A = '. -';
    B = '- . . .';
    C = '- . - .';
    D='- . .';
    E='.';
    F='. . - .';
    G='- - .';
    H='. . . .';
    I='. .';
    J='. - - -';
    K='- . -';
    L='. - . .';
    M='- -';
    N='- .';
    O='- .';
    P='. - - .';
    Q='- - . -';
    R='. - .';
    S='. . .';
    T='-';
    U='. . -';
    V='. . . -';
    W='. - -';
    X='- . . -';
    Y='- . - -';
    Z='- - . .';
    Ą='. - . -';
    Ć='- . - . .';
    Ę='. . - . .';
    Ł='. - . . -';
    Ń='- - . - -';
    Ó='- - - .';
    Ś='. . . - . . .';
    Ż='- - . . - .';
    Ź='- - . . -';
    "1"='. - - - -';
    "2"='. . - - -';
    "3"='. . . - -';
    "4"='. . . . -';
    "5"='. . . . .';
    "6"='- . . . .';
    "7"='- - . . .';
    "8"='- - - . .';
    "9"='- - - - .';
    "0"='- - - - -';
    " " ="`n"}

    Get-Content "$loc$nazwa.txt" | foreach { [char[]] $_ | foreach { echo $morse["$_"] } }
}
