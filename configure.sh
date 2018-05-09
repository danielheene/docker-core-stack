#!/bin/bash

for i in "$@"
do
    case ${i} in
        -e=*|--email=*)
        EMAIL="${i#*=}"
        shift
        ;;
        -d=*|--domain=*)
        DOMAIN="${i#*=}"
        shift
        ;;
    esac
done

if [ -z ${EMAIL} ]; then echo "missing email parameter"; exit 1 ;fi
if [ -z ${DOMAIN} ]; then echo "missing domain paramter"; exit 1 ;fi
if [ `uname` == 'Darwin' ]; then
    SED_CMD='sed -i "" -e'
else
    SED_CMD='sed -i -e'
fi

echo "generating files from examples"
cp -n ./etc/acme.example.json ./etc/acme.json
cp ./etc/traefik.example.toml ./etc/traefik.toml
cp docker-compose.example.yml docker-compose.yml

echo "pasting email and domain values"
eval ${SED_CMD} "s/EMAIL_PARAM_HERE/${EMAIL}/g" etc/traefik.toml
eval ${SED_CMD} "s/DOMAIN_PARAM_HERE/${DOMAIN}/g" etc/traefik.toml
eval ${SED_CMD} "s/DOMAIN_PARAM_HERE/${DOMAIN}/g" docker-compose.yml
exit 0
