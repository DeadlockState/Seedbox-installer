# Seedbox-installer [![Build Status](https://travis-ci.org/Punk--Rock/Seedbox-installer.svg?branch=master)](https://travis-ci.org/Punk--Rock/Seedbox-installer)

## About

Preparing and installing a fully seedbox server (Plex Media Server + Sonarr/Radarr or SickRage/CouchPotato + Transmission or rTorrent/ruTorrent + Jackett + PlexPy)

![Seedbox](http://i.imgur.com/VhrGlvn.png)

## Compatibility

Tested on 

* [x] Ubuntu Server 16.04.2 LTS Xenial Xerus and above
* [x] Debian 9.0.0 Stretch and above

## Services

Service                | Installation   | Version      | Port
---------------------- | -------------- | ------------ | -------
Plex Media Server      | Installed      | [1.9.4.4325](https://www.plex.tv/downloads/)   | 32400
Sonarr                 | Optional       | [latest](https://github.com/Sonarr/Sonarr/releases)       | 8989
Radarr                 | Optional       | [0.2.0.870](https://github.com/Radarr/Radarr/releases)    | 7878
SickRage               | Optional       | [latest](https://github.com/SickRage/SickRage/releases)       | 8081
CouchPotato            | Optional       | [latest](https://github.com/CouchPotato/CouchPotatoServer/releases)       | 5050
Transmission           | Optional       | [latest](https://transmissionbt.com/download/)       | 9091
rTorrent + ruTorrent   | Optional       | [latest](https://github.com/Novik/ruTorrent/releases)       |
Jackett                | Installed      | [0.8.339](https://github.com/Jackett/Jackett/releases)      | 9117
PlexPy                 | Installed      | [latest](https://github.com/JonnyWong16/plexpy)       | 8181

## Installation

```shell
wget https://raw.githubusercontent.com/Punk--Rock/Seedbox-installer/master/autoinstall.sh

chmod +x autoinstall.sh

./autoinstall.sh
```

## More

If you want the same thing with Docker and Docker Compose you can check [this repository](https://github.com/bilyboy785/seedbox-compose)

## Contact me

[![Twitter](https://cdn1.iconfinder.com/data/icons/logotypes/32/twitter-24.png)](https://twitter.com/Punk__R0ck) [@Punk__R0ck](https://twitter.com/Punk__R0ck)
