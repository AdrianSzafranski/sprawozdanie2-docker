#!/bin/sh

#Zapisanie informacji o dacie utworzenia serwera do pliku info.log
date +"Data utworzenia serwera: %d.%m.%Y" > /logi/info.log
#Zapisanie informacji o ilości dostępnej pamięci do pliku info.log
cat /proc/meminfo | awk 'NR==3' >> /logi/info.log

#linijka do podpunktu 5 w sprawozdaniu
#cat /logi/info.log

#linijka do podpunktu 6 w sprawozdaniu
#while true; do sleep 1000; done