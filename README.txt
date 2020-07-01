CHIRP is a free, open-source tool for programming your amateur radio. It supports a large number of manufacturers and models, as well as provides a way to interface with multiple data sources and formats.

This is an unofficial container image for Linux.

Due to the fact that CHIRP is only Python 2.x compatible, it depends on old and unavailable software in modern distros. I built this image to be able to run it in modern Linux distributions.

To run under Ubuntu (it may work in other distributions):

1- Connect radio with USB (be sure a serial USB device exists in /dev/ttyUSB0 and your user have r/w access to it)

2- Launch container with:

$ xhost local:root
$ docker run --rm -v /tmp/.X11-unix:/tmp/.X11-unix --device=/dev/ttyUSB0 -e DISPLAY=$DISPLAY mpaolino/chirp
