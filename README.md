## rayzilt/rspamd ##

Non-Official Dockerized [Rspamd](https://rspamd.com/) based on Debian Stretch Slim.

### Tags ###
Version  | Tag Name
----- | ------------
1.7.x | latest
1.8.x | experimental

### Environment Variables ###
No environment variables are used.

### Volumes ###
* `/etc/rspamd/local.d` = Override configuration
* `/var/lib/rspamd` = Rspamd data location

### Exposed Ports ###
Port  | Function
----- | ------------
11332 | Milter
11334 | Webinterface

### Usage ###
After first deployment run `rspamadm configwizard` inside the docker to configure Rspamd.
This allows configuration of the _Webinterface_, _DKIM_ and _Redis_ configuration. The tool writes the configuration in `/etc/rspamd/local.d`

### Links ###
Rspamd Official website: https://rspamd.com
Documentation: https://rspamd.com/doc/index.html
Rspamd Github: https://github.com/rspamd/rspamd

### Support ###
This Docker image is for personal use but let me know if there are any improvements available.
Please use [Github] (https://github.com/Rayzilt/Docker-Rspamd) to send me a message