#!/bin/sh 

source .env

file=public_mm_linux_main_2016v2.tar.bz2 
bucket=betterpath-code
resource="/${bucket}/${file}" 
region="s3-us-east-1"
contentType="text/plain" 
dateValue="`date +'%a, %d %b %Y %H:%M:%S %z'`" 
stringToSign="GET\n\n${contentType}\n${dateValue}\n${resource}"
signature=`/bin/echo -en "$stringToSign" | openssl sha1 -hmac ${s3Secret} -binary | base64` 

curl -H "Date: ${dateValue}" -H "Content-Type: ${contentType}" -H "Authorization: AWS ${S3_KEY}:${signature}" \
     "https://${region}.amazonaws.com/${resource}" -o "${file}"
