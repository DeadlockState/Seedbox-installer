# Seedbox installer [![Build Status](https://travis-ci.org/Punk--Rock/Seedbox-installer.svg?branch=master)](https://travis-ci.org/Punk--Rock/Seedbox-installer)

## About

Preparing and installing a fully seedbox server (Plex Media Server + Sonarr/Radarr or SickRage/CouchPotato + Transmission or rTorrent/ruTorrent + Jackett + PlexPy)

![Seedbox](http://i.imgur.com/VhrGlvn.png)

## Compatibility

Tested on 

* [x] Ubuntu 16.04.2 LTS Xenial Xerus and above
* [ ] Debian 8.7.1 Jessie and above

## Services

Service                | Installation   | Port
---------------------- | -------------- | -------
Plex Media Server      | Installed      | 32400
Sonarr                 | Optional       | 8989
Radarr                 | Optional       | 7878
SickRage               | Optional       | 8081
CouchPotato            | Optional       | 5050
Transmission           | Optional       | 9091
rTorrent + ruTorrent   | Optional       | 
Jackett                | Installed      | 9117
PlexPy                 | Installed      | 8181

## Installation

```shell
wget https://raw.githubusercontent.com/Punk--Rock/Seedbox-installer/master/autoinstall.sh

chmod +x autoinstall.sh

./autoinstall.sh
```

## Contact me

[![Twitter](https://cdn1.iconfinder.com/data/icons/logotypes/32/twitter-24.png)](https://twitter.com/Punk__R0ck) [@Punk__R0ck](https://twitter.com/Punk__R0ck)
