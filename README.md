[CHIRP](https://chirp.danplanet.com/projects/chirp/wiki/Home) is a free, open-source tool for programming your amateur radio. It supports a large number of manufacturers and models, as well as provides a way to interface with multiple data sources and formats.

This is an unofficial container image for Linux.

Due to the fact that CHIRP is only Python 2.x compatible, it depends on old and unavailable software in modern distros like Ubuntu 20.x (Focal). 
I built this image to be able to run it for my particular case and there is nor promise of future updates.

Running the image under Ubuntu (it should work in other distributions)
----------------------------------------------------------------------

1. Connect radio with USB (be sure a serial USB device exists in /dev/ttyUSB0 and your user have r/w access to it)
2. Launch container with:

```
$ xhost local:root
$ docker run --rm -v /tmp/.X11-unix:/tmp/.X11-unix --device=/dev/ttyUSB0 -e DISPLAY=$DISPLAY mpaolino/chirp
```

CHIRP runs inside the container with its own unprivileged user "chirp", you can mount any local directoy inside the container to be able to save and load configurations to the radio:

```
$ docker run --rm -v $HOME/my-chirp-directory:/home/chirp/configs -v /tmp/.X11-unix:/tmp/.X11-unix --device=/dev/ttyUSB0 -e DISPLAY=$DISPLAY mpaolino/chirp
```

Building your own image with this Dockerfile
--------------------------------------------

Edit the Dockerfile to use a different source tarball which will be [pulled from CHIRP website](https://trac.chirp.danplanet.com/chirp_daily/LATEST/) during the build process,
or pass it the name of the tarball as argument with docker build:

$ docker build -t chirp --build-arg=tarball=chirp-daily-20200718.tar.gz .
