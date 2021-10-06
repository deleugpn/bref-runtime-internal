set -xe

docker build --build-arg BASE_IMAGE=al2-x86_64 -f PHP80.Dockerfile . -t bref-runtime/php-80

CONTAINER_NAME=php80-extractor

rm ./dist/php80 -rf

#mkdir -p ./dist/php80/bref/phpini
mkdir -p ./dist/php80/bin
mkdir -p ./dist/php80/lib
mkdir -p ./dist/php80/php-modules

docker rm --force ${CONTAINER_NAME} || true

docker run -it -d --name ${CONTAINER_NAME} bref-runtime/php-80 /bin/bash

# Binary
docker exec ${CONTAINER_NAME} /bin/cat /opt/remi/php80/root/usr/bin/php > ./dist/php80/bin/php

# Modules
docker exec ${CONTAINER_NAME} /bin/cat /opt/remi/php80/root/lib64/php/modules/curl.so > ./dist/php80/php-modules/curl.so

# Bref
docker exec ${CONTAINER_NAME} /bin/cat /opt/bref-runtime/vendor/deleugpn/bref-runtime-experiment/bootstrap/bootstrap > ./dist/php80/bootstrap
docker cp ${CONTAINER_NAME}:/opt/bref-runtime ./dist/php80/bref-runtime
#docker exec ${CONTAINER_NAME} /bin/cat /opt/bref/bootstrap.php > ./dist/php80/bref/bootstrap.php
#docker exec ${CONTAINER_NAME} /bin/cat /opt/bref/phpini/00-bref.ini > ./dist/php80/bref/phpini/00-bref.ini

# Shared Libraries
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libcrypt.so.1 > ./dist/php80/lib/libcrypt.so.1
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libresolv.so.2 > ./dist/php80/lib/libresolv.so.2
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libncurses.so.5 > ./dist/php80/lib/libncurses.so.5
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libtinfo.so.5 > ./dist/php80/lib/libtinfo.so.5
docker exec ${CONTAINER_NAME} /bin/cat /lib64/librt.so.1 > ./dist/php80/lib/librt.so.1
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libstdc++.so.6 > ./dist/php80/lib/libstdc++.so.6
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libutil.so.1 > ./dist/php80/lib/libutil.so.1
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libm.so.6 > ./dist/php80/lib/libm.so.6
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libdl.so.2 > ./dist/php80/lib/libdl.so.2
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libxml2.so.2 > ./dist/php80/lib/libxml2.so.2
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libgssapi_krb5.so.2 > ./dist/php80/lib/libgssapi_krb5.so.2
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libkrb5.so.3 > ./dist/php80/lib/libkrb5.so.3
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libk5crypto.so.3 > ./dist/php80/lib/libk5crypto.so.3
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libcom_err.so.2 > ./dist/php80/lib/libcom_err.so.2
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libssl.so.10 > ./dist/php80/lib/libssl.so.10
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libcrypto.so.10 > ./dist/php80/lib/libcrypto.so.10
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libz.so.1 > ./dist/php80/lib/libz.so.1
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libedit.so.0 > ./dist/php80/lib/libedit.so.0
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libc.so.6 > ./dist/php80/lib/libc.so.6
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libpthread.so.0 > ./dist/php80/lib/libpthread.so.0
docker exec ${CONTAINER_NAME} /bin/cat /lib64/ld-linux-x86-64.so.2 > ./dist/php80/lib/ld-linux-x86-64.so.2
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libgcc_s.so.1 > ./dist/php80/lib/libgcc_s.so.1
docker exec ${CONTAINER_NAME} /bin/cat /lib64/liblzma.so.5 > ./dist/php80/lib/liblzma.so.5
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libkrb5support.so.0 > ./dist/php80/lib/libkrb5support.so.0
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libkeyutils.so.1 > ./dist/php80/lib/libkeyutils.so.1
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libtinfo.so.6 > ./dist/php80/lib/libtinfo.so.6
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libselinux.so.1 > ./dist/php80/lib/libselinux.so.1
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libpcre.so.1 > ./dist/php80/lib/libpcre.so.1

# Curl
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libcurl.so.4 > ./dist/php80/lib/libcurl.so.4
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libnghttp2.so.14 > ./dist/php80/lib/libnghttp2.so.14
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libidn2.so.0 > ./dist/php80/lib/libidn2.so.0
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libssh2.so.1 > ./dist/php80/lib/libssh2.so.1
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libldap-2.4.so.2 > ./dist/php80/lib/libldap-2.4.so.2
docker exec ${CONTAINER_NAME} /bin/cat /lib64/liblber-2.4.so.2 > ./dist/php80/lib/liblber-2.4.so.2
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libunistring.so.0 > ./dist/php80/lib/libunistring.so.0
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libsasl2.so.3 > ./dist/php80/lib/libsasl2.so.3
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libssl3.so > ./dist/php80/lib/libssl3.so
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libsmime3.so > ./dist/php80/lib/libsmime3.so
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libnss3.so > ./dist/php80/lib/libnss3.so
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libnssutil3.so > ./dist/php80/lib/libnssutil3.so
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libplds4.so > ./dist/php80/lib/libplds4.so
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libplc4.so > ./dist/php80/lib/libplc4.so
docker exec ${CONTAINER_NAME} /bin/cat /lib64/libnspr4.so > ./dist/php80/lib/libnspr4.so

cd dist/php80 && zip -r php80.zip .

