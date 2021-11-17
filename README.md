# sprawozdanie 2 - Zadanie 4Z3

<b>Podpunkt 2</b> <br />
Do zbudowania obrazu o nazwie "lab4docker" można użyć polecenia:<br />
```docker build -t lab4docker .```

<b>Podpunkt 3</b> <br />
Utworzenie wolumenu o nazwie RemoteVol lokalnie(nie powiodło mi się umieszczenie volumenu na systemie macierzystym Windows):<br />
```docker volume create RemoteVol```

<b>Podpunkt 4</b> <br />
Uruchomienie kontenera o nazwie apline4 na bazie zbudowanego obrazu lab4docker w taki sposób, by:
- podłączyć do niego utworzony podłączyć do niego utworzony wolumen RemoteVol w miejsce katalogu /logi w systemie plików
kontenera
- ograniczyć ilość wykorzystywanej pamięci RAM do 512MB<br />

```docker run -it --name alpine4 --memory=512MB --mount source=RemoteVol,target=/logi lab4docker```

<b>Podpunkt 5</b> <br />

<b>a</b><br />
Komendą ```docker inspect alpine4 | jq '.[] .Mounts'``` sprawdzimy miejsce montowania wolumenu oraz miejsce montowania w kontenerze.<br />
![Podpunkt5](https://github.com/AdrianSzafranski/chmurki/blob/main/spr2-5.png)<br />
1. Sprawdzenie czy skrypt pluto.sh zapisuje w kontenerze dane do pliku /logi/info.log.
W tym celu, na potrzebe tego podpunktu używamy w skrypcie komendy ```cat /logi/info.log```, która wypisuje w terminalu zawartość pliku. Wyświetlona została poprawna zawartość, więc wiemy, że skrypt pluto.sh zapisuje poprawne dane w porządanym katalogu.<br />
![Podpunkt5-1](https://github.com/AdrianSzafranski/chmurki/blob/main/spr2-6.png)<br />
2. Sprawdzenie czy skrypt pluto.sh generuje wymagane dane i umieszcza je w pliku info.log na wolumenie.
W tym celu, używamy ściężki montowania wolumenu do sprawdzenia czy istnieje plik "info.log" oraz jaką ma zawartość.
![Podpunkt5-2-2](https://github.com/AdrianSzafranski/chmurki/blob/main/spr2-7.png)<br />
Na powyższym screenie można zauważyć, że pluto.sh poprawnie wygenerował dane i umieścił je w pliku info.log na wolumenie.

<b>b</b><br />
Aby sprawdzić czy alpine4 ma ograniczoną ilość pamięci RAM zgodnie z treścią zadania można użyć polecenia:
```docker inspect alpine4```
W informacji zwrotnej można znaleźć taką informacje:<br />
![Podpunkt5-2-3](https://github.com/AdrianSzafranski/chmurki/blob/main/spr2-3.png)<br />
536870912 bajtów to 512 MB. Więc wykazaliśmy, że alpine4 ma ograniczoną ilość pamięci RAM.

<b>Podpunkt 6</b> <br />
W celu możliwości użycia narzędzia CADVISOR, kontener alpine4 musi być cały czas uruchomiony. W tym celu na potrzebe tego podpunktu, używam w skrypcie plute.sh komendy ```while true; do sleep 1000; done```.
Uruchamiamy CADVISOR komendą:
```
sudo docker run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:ro \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --volume=/dev/disk/:/dev/disk:ro \
  --publish=8080:8080 \
  --detach=true \
  --name=cadvisor \
  --privileged \
  --device=/dev/kmsg \
  gcr.io/cadvisor/cadvisor:v0.36.0
  ```
  Wchodzimy na przeglądarce na "localhost:8080", klikamy "Docker Containers", następnie wybieramy w kategorii Subcontainers "alpine4". Na wyświetlonej podstronie możemy uzyskać informacje o ograniczonej ilości pamięci RAM:<br />
 ![Podpunkt6](https://github.com/AdrianSzafranski/chmurki/blob/main/spr2-4.png)<br />
