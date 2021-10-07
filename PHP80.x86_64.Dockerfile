FROM public.ecr.aws/lambda/provided:al2-x86_64

RUN yum install -y \
        https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
        https://rpms.remirepo.net/enterprise/remi-release-7.rpm \
        yum-utils \
        epel-release \
        curl

RUN yum-config-manager --enable remi-php80

RUN yum update -y && yum upgrade -y

RUN yum install -y php80-php unzip

RUN php80 -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
&&  php80 -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
&&  php80 composer-setup.php \
&&  php80 -r "unlink('composer-setup.php');"

RUN mkdir -p /opt/bref-runtime

RUN cat /dev/null

RUN php80 composer.phar require deleugpn/bref-runtime-experiment:dev-main -d /opt/bref-runtime/ --prefer-dist
