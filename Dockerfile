FROM pam79/php-fpm:v7.4.1
LABEL maintainer="Abdullah Morgan <paapaabdullahm@gmail.com>"

# Add Tini init
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

# Add Terminus CLI
ENV LATEST_RELEASE 2.6.0
RUN apt update && apt install -y bash curl wget git openssh-server openssl zip unzip; \
    #
    # Download the phar to the current directory
    wget https://github.com/pantheon-systems/terminus/releases/download/${LATEST_RELEASE}/terminus.phar; \
    #
    # Move binary to your path
    mv terminus.phar /usr/bin/terminus; \
    #
    # Make binary executable
    chmod +x /usr/bin/terminus; \
    #
    # Create directory where terminus can write to
    mkdir -p /var/www/.terminus; \
    #
    # Make directory writable
    chmod -R 775 /var/www/.terminus/;

ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

WORKDIR /src
VOLUME /src

ENTRYPOINT ["/bin/sh", "/docker-entrypoint.sh"]
CMD ["terminus"]
