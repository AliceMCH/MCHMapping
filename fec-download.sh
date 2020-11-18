if [ "$1" == "" ]; then
    gdown 'https://drive.google.com/uc?id=1RTSecebbWJ7rEsc4PQe3GCfcW9KC_bWm' --proxy http://10.161.58.101:8080
    gdown 'https://drive.google.com/uc?id=1AQFx_uWw_GwHYdJy5J7kr9GUY6jBRQRI' --proxy http://10.161.58.101:8080
    gdown 'https://drive.google.com/uc?id=1cdmfrL8ggK9Yau3TI7j8nh8WXkseR2UE' --proxy http://10.161.58.101:8080
    gdown 'https://drive.google.com/uc?id=12y4Csu2oLBV24mEIhWL36kC6JC_1gtRw' --proxy http://10.161.58.101:8080
    gdown 'https://drive.google.com/uc?id=1GUz2mKMDKiFs6e-RTQY7WQrS4LjfPagR' --proxy http://10.161.58.101:8080
    gdown 'https://drive.google.com/uc?id=1oeErW_L8HsPNQ82FnBnnfuXhPn3Ob2so' --proxy http://10.161.58.101:8080
    gdown 'https://drive.google.com/uc?id=1X_QMmym-9SOwXPVumu9LtnSWrP44vCMY' --proxy http://10.161.58.101:8080
fi

if [ "$1" == "--no-proxy" ]; then
    gdown 'https://drive.google.com/uc?id=1RTSecebbWJ7rEsc4PQe3GCfcW9KC_bWm'
    gdown 'https://drive.google.com/uc?id=1AQFx_uWw_GwHYdJy5J7kr9GUY6jBRQRI'
    gdown 'https://drive.google.com/uc?id=1cdmfrL8ggK9Yau3TI7j8nh8WXkseR2UE'
    gdown 'https://drive.google.com/uc?id=12y4Csu2oLBV24mEIhWL36kC6JC_1gtRw'
    gdown 'https://drive.google.com/uc?id=1GUz2mKMDKiFs6e-RTQY7WQrS4LjfPagR'
    gdown 'https://drive.google.com/uc?id=1oeErW_L8HsPNQ82FnBnnfuXhPn3Ob2so'
    gdown 'https://drive.google.com/uc?id=1X_QMmym-9SOwXPVumu9LtnSWrP44vCMY'
fi

rm -f fec.map


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
