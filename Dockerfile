FROM --platform=linux/amd64 ghcr.io/pelican-eggs/yolks:wine_latest

LABEL author="lovelesscodes" maintainer="https://github.com/lovelesscodes"

# customization
VOLUME ["/home/container/server_files"]

RUN mkdir -p "/home/container/server_files/StarRupture/Saved/SaveGames"
VOLUME ["/home/container/server_files/StarRupture/Saved/SaveGames"]

ADD scripts /home/container/scripts
RUN chmod +x /home/container/scripts/*.sh

CMD ["/home/container/scripts/start.sh"]
