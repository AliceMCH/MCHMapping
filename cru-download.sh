if [ "$1" == "" ]; then
  gdown 'https://drive.google.com/uc?id=1ARqwqzHB1VsOLQ4aK8GSD_GVMAPD3jif' --proxy http://10.161.58.101:8080
  gdown 'https://drive.google.com/uc?id=1XBprJ2rJTzgxfFCitWPVkn1snmQfc13E' --proxy http://10.161.58.101:8080
  gdown 'https://drive.google.com/uc?id=1VSr7F09-BMSF6HB6Eh922nLb0GZ5oWrO' --proxy http://10.161.58.101:8080
  gdown 'https://drive.google.com/uc?id=1vVLhW9Gcb6tlcSKujbS2S8M5rZfsYQmj' --proxy http://10.161.58.101:8080
  gdown 'https://drive.google.com/uc?id=1JnoypvIROBKAvndKII5fC7liQd89WYwW' --proxy http://10.161.58.101:8080
  gdown 'https://drive.google.com/uc?id=1dmBkTV5Ta_We1oaKfjzpqlE64wu0oX6w' --proxy http://10.161.58.101:8080
  gdown 'https://drive.google.com/uc?id=1ENb0GauUwN_T8c9HUBQhCXLrN0stXv-y' --proxy http://10.161.58.101:8080
fi

if [ "$1" == "--no-proxy" ]; then
    gdown 'https://drive.google.com/uc?id=1ARqwqzHB1VsOLQ4aK8GSD_GVMAPD3jif'
    gdown 'https://drive.google.com/uc?id=1XBprJ2rJTzgxfFCitWPVkn1snmQfc13E'
    gdown 'https://drive.google.com/uc?id=1VSr7F09-BMSF6HB6Eh922nLb0GZ5oWrO'
    gdown 'https://drive.google.com/uc?id=1vVLhW9Gcb6tlcSKujbS2S8M5rZfsYQmj'
    gdown 'https://drive.google.com/uc?id=1JnoypvIROBKAvndKII5fC7liQd89WYwW'
    gdown 'https://drive.google.com/uc?id=1dmBkTV5Ta_We1oaKfjzpqlE64wu0oX6w'
    gdown 'https://drive.google.com/uc?id=1ENb0GauUwN_T8c9HUBQhCXLrN0stXv-y'
fi

rm -f cru.map

wait


for f in *\ CRU\ map.map
do
  input=./$f

  n=0

  while IFS= read -r line
  do
    #echo "$line"
    nc=$(echo "$line" | tr -s "\t" | wc -c)

    if [ $nc -lt 3 ]; then
      n=$((n+1))

      if [ $n -eq 1 ]; then echo "" >> cru.map; fi

      continue;

      fi
      n=0

  echo "$line" >> cru.map

  done < "$input"

done
