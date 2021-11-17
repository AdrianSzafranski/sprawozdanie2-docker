# sprawozdanie 2 - Zadanie 4Z3

<b>Podpunkt 2</b> <br />
Do zbudowania obrazu o nazwie "lab4docker" można użyć polecenia:<br />
```docker build -t lab4docker .```

<b>Podpunkt 3</b> <br />
Utworzenie volumenu o nazwie RemoteVol lokalnie(nie powiodło mi się umieszczenie volumenu na systemie macierzystym Windows):<br />
```docker volume create RemoteVol```

<b>Podpunkt 4</b> <br />
Uruchomienie kontenera o nazwie apline4 na bazie zbudowanego obrazu lab4docker w taki sposób, by:
- podłączyć do niego utworzony podłączyć do niego utworzony wolumen RemoteVol w miejsce katalogu /logi w systemie plików
kontenera
- ograniczyć ilość wykorzystywanej pamięci RAM do 512MB<br />

```docker run -it --name alpine4 --memory=512MB --mount source=RemoteVol,target=/logi lab4docker```

<b>Podpunkt 5</b> <br />
<b>a</b><br />
1. Sprawdzenie czy skrypt zapisuje dane do pliku /logi/info.log
W tym celu używamy w skrypcie pluto.sh komendy ```cat /logi/info.log```, która wypisuje w terminalu zawartość pliku. Wyświetlona została poprawna zawartość, więc wiemy, że skrypt pluto.sh zapisuje poprawne dane w porządanym katalogu.<br />
![Podpunkt5-1](https://github.com/AdrianSzafranski/chmurki/blob/main/spr2-0.png)<br />
2. Sprawdzenie czy skrypt pluto.sh generuje wymagane dane i umieszcza je w pliku info.log na wolumenie.
W tym celu, używamy komendy ```docker volume inspect RemoteVol``` do sprawdzenia miejsca podmontowania.<br />
![Podpunkt5-2-1](https://github.com/AdrianSzafranski/chmurki/blob/main/spr2-1.png)<br />
Następnie używamy tej ściężki do sprawdzenia czy istnieje plik "info.log" oraz jaką ma zawartość.
![Podpunkt5-2-2](https://github.com/AdrianSzafranski/chmurki/blob/main/spr2-2.png)<br />
<b>b</b><br />

5. Za pomocą poznanych narzędzi docker plugin ....., docker inspect ..., docker
stats ...  itd. należy potwierdzić, że:
a. skrypt  pluto.sh  generuje wymagane dane i umieszcza je w pliku  info.log  na wolumenie, który
znajduje się w systemie plików na maszynie macierzystej.
b. kontener alpine4 ma ograniczoną ilość pamięci RAM zgodnie z treścią zadania  
6. Jeśli do wykonania punktu 5 użyty zostanie (poza narzędziami z konsoli) narzędzie CADVISOR,
będzie to podstawą do przyznania dodatkowych punktów za sprawozdania.
W   sprawozdaniu   należy   przedstawić   opracowany   skrypt,   plik   Dockerfile   oraz   treść   i   wynik
wszystkich   użytych   poleceń   wraz   z   wynikiem   ich   działania.   Poszczególne   kroki   należu   krótko
opisać a jeśli to konieczne, to skomentować.
