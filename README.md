# sprawozdanie 2 - Zadanie 4Z3

<b>Podpunkt 2</b> <br />
Do zbudowania obrazu o nazwie "lab4docker" można użyć polecenia:<br />
```docker build -t lab4docker .```

<b>Podpunkt 3</b> <br />
Utworzenie volumenu o nazwie RemoteVol lokalnie(nie powiodło mi się umieszczenie volumenu na systemie macierzystym Windows):<br />
```docker volume create RemoteVol```

<b>Podpunkt 4</b> <br />
Urochomienie kontenera o nazwie apline4 na bazie zbudowanego obrazu lab4docker w taki sposób, by:
- podłączyć do niego utworzony podłączyć do niego utworzony wolumen RemoteVol w miejsce katalogu /logi w systemie plików
kontenera
- ograniczyć ilość wykorzystywanej pamięci RAM do 512MB<br />

```docker run -it --name alpine4 --memory=512m --mount source=RemoteVol,target=/logi lab4docker```

<b>Podpunkt 5</b> <br />
