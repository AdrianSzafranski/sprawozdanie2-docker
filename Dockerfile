#wybranie basowego obrazu
FROM alpine

#stworzenie volumenu, który podmontowywany jest w systemie plików kontenera w ścieżce /logi
VOLUME /logi

#ustawienie katalogu roboczego
WORKDIR /usr/app

#kopiowanie skryptu pluto.sh
COPY pluto.sh pluto.sh

#uruchomienie skryptu pluto.sh przy starcie kontenera
ENTRYPOINT ["./pluto.sh"]
