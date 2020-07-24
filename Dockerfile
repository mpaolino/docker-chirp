FROM debian:stretch-slim
ARG tarball=chirp-daily-20200718.tar.gz
RUN useradd -md /home/chirp chirp
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y python-serial python-libxml2 python-future python-gtk2 libcanberra-gtk-module wget
WORKDIR /usr/local
RUN wget "https://trac.chirp.danplanet.com/chirp_daily/LATEST/SHA1SUM"
RUN wget "https://trac.chirp.danplanet.com/chirp_daily/LATEST/$tarball"
RUN sha1sum -c --ignore-missing SHA1SUM | grep $tarball | grep OK 
RUN mkdir /usr/local/chirp
RUN tar -C /usr/local/chirp --strip-components 1 -xvzf $tarball
RUN rm $tarball
USER chirp
WORKDIR /home/chirp
ENTRYPOINT /usr/local/chirp/chirpw
