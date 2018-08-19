# rayzilt/rspamd #

Non-Official Dockerized [Rspamd](https://rspamd.com/) based on Debian Stretch Slim.

### Tags ###
Version  | Tag Name | Dockerfile
-------- | ------------ | ---------
1.7.x    | latest       | [Dockerfile](https://github.com/Rayzilt/Docker-Rspamd/blob/master/Stable/Dockerfile)
1.8.x    | experimental | [Dockerfile](https://github.com/Rayzilt/Docker-Rspamd/blob/master/Experimental/Dockerfile)

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

### Usage ###
After first deployment run `rspamadm configwizard` inside the docker to configure Rspamd.
This allows configuration of the _Webinterface_, _DKIM_ and _Redis_ configuration. The tool writes the configuration in `/etc/rspamd/local.d`

### Links ###
* Rspamd Official website: https://rspamd.com
* Documentation: https://rspamd.com/doc/index.html
* Rspamd Github: https://github.com/rspamd/rspamd

### Support ###
This Docker image is for personal use but let me know if there are any improvements available.
Please use [Github](https://github.com/Rayzilt/Docker-Rspamd) to send me a message