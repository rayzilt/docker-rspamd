# rayzilt/rspamd #

Non-Official Dockerized [Rspamd](https://rspamd.com/) based on Debian Stable Slim.

[![Build Automated](https://img.shields.io/docker/automated/rayzilt/rspamd.svg)](https://hub.docker.com/r/rayzilt/rspamd)
[![Build Status](https://img.shields.io/docker/cloud/build/rayzilt/rspamd.svg)](https://hub.docker.com/r/rayzilt/rspamd)
[![Docker Pulls](https://img.shields.io/docker/pulls/rayzilt/rspamd.svg)](https://hub.docker.com/r/rayzilt/rspamd)
### Tags ###
Branch   | Version  | Tag Name     | Dockerfile | Image Info
-------- | -------- | ------------ | ---------  | -----------
Stable   | [![Stable Version](https://images.microbadger.com/badges/version/rayzilt/rspamd.svg)](https://microbadger.com/images/rayzilt/rspamd "Get your own version badge on microbadger.com")    | latest       | [Dockerfile](https://github.com/Rayzilt/Docker-Rspamd/blob/master/Stable/Dockerfile) | [![Dockerfile](https://images.microbadger.com/badges/image/rayzilt/rspamd.svg)](https://microbadger.com/images/rayzilt/rspamd "Get your own image badge on microbadger.com")
Unstable | [![Unstable Version](https://images.microbadger.com/badges/version/rayzilt/rspamd:2.1.svg)](https://microbadger.com/images/rayzilt/rspamd:2.1 "Get your own version badge on microbadger.com")    | experimental | [Dockerfile](https://github.com/Rayzilt/Docker-Rspamd/blob/master/Experimental/Dockerfile) | [![Dockerfile](https://images.microbadger.com/badges/image/rayzilt/rspamd:2.1.svg)](https://microbadger.com/images/rayzilt/rspamd:2.1 "Get your own image badge on microbadger.com")

### Environment Variables ###
No environment variables are used.

### Volumes ###
Volume                  | Function                      | Persistent
----------------------- | ----------------------------- | --------
/etc/rspamd/local.d/    | Change Rspamd configuration   | Yes
/etc/rspamd/override.d/ | Override Rspamd configuration | No
/var/lib/rspamd/        | Rspamd data                   | Yes

### Exposed Ports ###
Port  | Function
----- | ------------
11332 | Milter
11334 | Webinterface

### Healthcheck ###
The healthcheck runs every minute to check if Rspamd is still responding.
Program `rspamadm` will be responsible for this, default available in the toolset of Rspamd.

### Usage ###
After first deployment run `rspamadm configwizard` inside the docker to configure Rspamd.
This allows configuration of the _Webinterface_, _DKIM_ and _Redis_. The tool writes the configuration in `/etc/rspamd/local.d`

### References ###
* Rspamd Official website: https://rspamd.com
* Documentation: https://rspamd.com/doc/index.html
* Rspamd Github: https://github.com/rspamd/rspamd

### Support ###
This Docker image is for personal use but let me know if there are any improvements available.
Please use [Github](https://github.com/Rayzilt/Docker-Rspamd) to send me a message
