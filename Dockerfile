FROM ghcr.io/ptero-eggs/yolks:wine_latest

LABEL author="struppi" maintainer="https://github.com/struppinet"

# customization
VOLUME ["/home/container/server_files"]

# TODO: location to savegame
RUN mkdir -p "/home/container/.wine/drive_c/users/container/AppData/LocalLow/data/"
VOLUME ["/home/container/.wine/drive_c/users/container/AppData/LocalLow/data/"]

ADD scripts /home/container/scripts
RUN chmod +x /home/container/scripts/*.sh

CMD ["/home/container/scripts/start.sh"]
