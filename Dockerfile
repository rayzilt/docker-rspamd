FROM debian:latest
LABEL maintainer="Rayzilt - <docker@rayzilt.nl>"

# Set apt non-interactive
ENV DEBIAN_FRONTEND noninteractive

# Install Rspamd
RUN set -x \
	&& apt-get update \
	&& apt-get --no-install-recommends install -y lsb-release wget gnupg openssl ca-certificates \
	&& DEBIAN_CODE_NAME=`lsb_release -c -s` \
	&& wget -O - https://rspamd.com/apt-stable/gpg.key | apt-key add - \
	&& echo "deb http://rspamd.com/apt-stable/ $DEBIAN_CODE_NAME main" > /etc/apt/sources.list.d/rspamd.list \
	&& apt-get purge -y wget \
	&& apt-get update \
	&& apt-get --no-install-recommends install -y rspamd \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

# Override default settings
COPY rspamd.conf.local.override /etc/rspamd/

# Keep database persistent
VOLUME /var/lib/rspamd

# Run Rspamd	
CMD /usr/bin/rspamd -f -u _rspamd -g _rspamd
