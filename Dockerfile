FROM ubuntu:18.04

# Install toolchain depencies
RUN apt-get update && apt-get -y install gcc git wget make libncurses-dev flex bison gperf python python-pip python-setuptools python-serial python-cryptography python-future python-pyparsing

RUN apt-get clean autoclean && apt-get autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log}/

# Download toolchain
RUN mkdir -p /opt/esp && cd /opt/esp && wget -q https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz
RUN cd /opt/esp && tar -xzf xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz

RUN cd / && git clone -b 'v1.4.6' https://github.com/aws/amazon-freertos.git

ENV PATH /opt/esp/xtensa-esp32-elf/bin:$PATH
