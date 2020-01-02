FROM debian:stable-slim
LABEL maintainer="Rayzilt - <docker@rayzilt.nl>"

# Set apt non-interactive
ENV DEBIAN_FRONTEND noninteractive

# Install Rspamd
RUN set -x \
	&& apt update \
	&& apt --no-install-recommends install -y lsb-release wget gnupg openssl ca-certificates \
	&& DEBIAN_CODE_NAME=`lsb_release -c -s` \
	&& wget -O - https://rspamd.com/apt/gpg.key | apt-key add - \
	&& echo "deb http://rspamd.com/apt/ $DEBIAN_CODE_NAME main" > /etc/apt/sources.list.d/rspamd.list \
	&& apt purge -y lsb-release wget gnupg \
	&& apt update \
	&& apt --no-install-recommends install -y rspamd \
	&& apt autoremove --purge -y \
	&& apt clean \
	&& rm -rf /var/lib/apt/lists/*

# Override default settings
COPY rspamd.conf.local.override /etc/rspamd/

# Keep database and configuration persistent
VOLUME /etc/rspamd/local.d
VOLUME /var/lib/rspamd

# Port 11334 is for web frontend
# Port 11332 is for milter
# Port 11333 is for worker
EXPOSE 11332 11334

# Healtcheck if Rspamd is returning stats
HEALTHCHECK --interval=1m --timeout=5s --start-period=10s \
	CMD /usr/bin/rspamadm control stat || exit 1

# Run Rspamd
ENTRYPOINT ["/usr/bin/rspamd","-f","-u","_rspamd","-g","_rspamd"]

# Setup Labels
ARG VERSION
ARG COMMIT
ARG BRANCH
ARG DATE

LABEL org.label-schema.name="Rspamd" \
	org.label-schema.description="Rspamd Spam Filter - EXPERIMENTAL" \
	org.label-schema.usage="https://hub.docker.com/r/rayzilt/rspamd/" \
	org.label-schema.url="https://rspamd.com" \
	org.label-schema.vendor="Rayzilt" \
	org.label-schema.schema-version="1.0" \
  org.label-schema.version=$VERSION \
  org.label-schema.vcs-url="https://github.com/rspamd/rspamd/" \
  org.label-schema.vcs-ref=$COMMIT \
  org.label-schema.build-date=$DATE \
