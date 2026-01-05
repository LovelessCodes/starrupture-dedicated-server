# Docker for a StarRupture dedicated server

![Static Badge](https://img.shields.io/badge/GitHub-starrupture--dedicated--server-blue?logo=github) [![Docker Hub](https://img.shields.io/badge/Docker_Hub-starrupture--dedicated--server-blue?logo=docker)](https://hub.docker.com/r/struppinet/starrupture-dedicated-server)

## Table of contents
- [Docker Run command](#docker-run)
- [Docker Compose command](#docker-compose)
- [Environment variables server settings](#environment-variables-server-settings)
  
This is a Docker container to help you get started with hosting your own [StarRupture](https://starrupture-game.com/) dedicated server.

## Info

- -------
- THE GAME IS NOT YET RELEASED AND THE SERVER CANT BE DOWNLOADED YET!
- -------
- This image uses the pterodactyl/wine yolk [Ptero-Eggs](https://github.com/ptero-eggs/) as it was the only thing working. Thank you guys for your work!

| Volume   | Path                                                                                             | Description                                                                                                    |
|----------|--------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------|
| savegame | /home/container/.wine/drive_c/users/container/AppData/LocalLow/data | The path where the start-script will store the config and the savegame                                         |
| server   | /home/container/server_files                                                                     | The path where steam will install the starrupture dedicated server (optional to store to avoid re-downloading) |

## Docker Run

```bash
docker run -d \
    --name starrupture \
    -p 7777:7777/tcp \
    -p 7777:7777/udp \    
    -v ./savegame:"/home/container/.wine/drive_c/users/container/AppData/LocalLow/data" \
    -v ./server:"/home/container/server_files" \
    -e SERVER_NAME="Starrupture docker" \
    struppinet/starrupture-dedicated-server:latest
```

## Docker Compose

```yml
services:
  starrupture:
    container_name: starrupture
    image: struppinet/starrupture-dedicated-server:latest
    network_mode: bridge
    environment:
      - SERVER_NAME=Starrupture_docker
    volumes:
      - './savegame:/home/container/.wine/drive_c/users/container/AppData/LocalLow/data:rw'
      - './server:/home/container/server_files:rw'
    ports:
      - '7777:7777/tcp'
      - '7777:7777/udp'
    restart: unless-stopped
```

## Environment variables server settings

You can use these environment variables for your server settings:

| Variable    | Default               | Description                                        |
|-------------|-----------------------|----------------------------------------------------|
| SERVER_NAME | My StarRupture Server | Host name that is displayed in the server list     |
| SERVER_PORT | 7777                  | The port that clients will connect to for gameplay |

## Links
Github [https://github.com/struppinet/starrupture-dedicated-server](https://github.com/struppinet/starrupture-dedicated-server)  
Docker [https://hub.docker.com/r/struppinet/starrupture-dedicated-server](https://hub.docker.com/r/struppinet/starrupture-dedicated-server)
