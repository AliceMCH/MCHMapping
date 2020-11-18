if [ "$1" == "" ]; then
    gdown 'https://drive.google.com/uc?id=1JV92ZT5usQrX8DGR5Y2-Ao2qqZ4X1CqF' --proxy http://10.161.58.101:8080 &
    gdown 'https://drive.google.com/uc?id=1X_hh_Pq9-JHnYmCE_tdxUJTP78Z3Ainb' --proxy http://10.161.58.101:8080 &
    gdown 'https://drive.google.com/uc?id=15-MpWXsLwLI54t2erccWHbHVhjCpfuTa' --proxy http://10.161.58.101:8080 &
    gdown 'https://drive.google.com/uc?id=1yE8WIH8Nf1mVdOwwn6CYGc-4eK6B2EA8' --proxy http://10.161.58.101:8080 &
    gdown 'https://drive.google.com/uc?id=10Sg55fsHtCvc_V5fCcOo-wXnlw2rb9-I' --proxy http://10.161.58.101:8080 &
    gdown 'https://drive.google.com/uc?id=1CA4mw8QTQjI2KaN55kOmMwzGrW10-Yqt' --proxy http://10.161.58.101:8080 &
    gdown 'https://drive.google.com/uc?id=1bMbt2PGzsfaEyzol5Qjho_ZHBZLqHJvS' --proxy http://10.161.58.101:8080 &
fi

if [ "$1" == "--no-proxy" ]; then
    gdown 'https://drive.google.com/uc?id=1JV92ZT5usQrX8DGR5Y2-Ao2qqZ4X1CqF' &
    gdown 'https://drive.google.com/uc?id=1X_hh_Pq9-JHnYmCE_tdxUJTP78Z3Ainb' &
    gdown 'https://drive.google.com/uc?id=15-MpWXsLwLI54t2erccWHbHVhjCpfuTa' &
    gdown 'https://drive.google.com/uc?id=1yE8WIH8Nf1mVdOwwn6CYGc-4eK6B2EA8' &
    gdown 'https://drive.google.com/uc?id=10Sg55fsHtCvc_V5fCcOo-wXnlw2rb9-I' &
    gdown 'https://drive.google.com/uc?id=1CA4mw8QTQjI2KaN55kOmMwzGrW10-Yqt' &
    gdown 'https://drive.google.com/uc?id=1bMbt2PGzsfaEyzol5Qjho_ZHBZLqHJvS' &
fi

rm -f fec.map

wait


for f in ./fec-*.map
do
  input=./$f

  n=0

  while IFS= read -r line
  do
    #echo "$line"
    nc=$(echo "$line" | tr -s "\t" | wc -c)
    if [ $nc -lt 3 ]; then
      n=$((n+1))

      if [ $n -eq 1 ]; then echo "" >> fec.map; fi

      continue;

      fi
      n=0

  echo "$line" >> fec.map

  done < "$input"

done
