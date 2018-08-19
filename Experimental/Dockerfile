FROM debian:stretch
LABEL maintainer="Rayzilt - <docker@rayzilt.nl>"

# Set apt non-interactive
ENV DEBIAN_FRONTEND noninteractive

# Install Rspamd
RUN set -x \
	&& apt-get update \
	&& apt-get --no-install-recommends install -y lsb-release wget gnupg openssl ca-certificates \
	&& DEBIAN_CODE_NAME=`lsb_release -c -s` \
	&& wget -O - https://rspamd.com/apt/gpg.key | apt-key add - \
	&& echo "deb http://rspamd.com/apt/ $DEBIAN_CODE_NAME main" > /etc/apt/sources.list.d/rspamd.list \
	&& apt-get purge -y lsb-release wget gnupg \
	&& apt-get update \
	&& apt-get --no-install-recommends install -y rspamd \
	&& apt-get autoremove --purge -y \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

# Override default settings
COPY rspamd.conf.local.override /etc/rspamd/

# Keep database persistent
VOLUME /var/lib/rspamd

# Port 11334 is for web frontend
# Port 11332 is for milter
# Port 11333 is for worker
EXPOSE 11332 11334

# Run Rspamd	
CMD /usr/bin/rspamd -f -u _rspamd -g _rspamd
