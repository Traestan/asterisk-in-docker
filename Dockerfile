# Contain
#  - Asterisk 16.0.0
#  - Lua
#  - LuaRocks
#  - g729

FROM ubuntu:14.04.4

RUN apt-get check && \
    apt-get update && \
    apt-get install -y \ 
        build-essential zip unzip libreadline-dev curl libncurses-dev mc aptitude \
        tcsh scons libpcre++-dev libboost-dev libboost-all-dev libreadline-dev \
        libboost-program-options-dev libboost-thread-dev libboost-filesystem-dev \
        libboost-date-time-dev gcc g++ git make libmongo-client-dev \
        dh-autoreconf lame sox libzmq3-dev libzmqpp-dev libtiff-tools perl5 && \
    apt-get clean
  
## Asterisk

RUN curl -sf \
        -o /tmp/asterisk.tar.gz \
        -L http://downloads.asterisk.org/pub/telephony/asterisk/releases/asterisk-16.0.0.tar.gz && \
    mkdir /tmp/asterisk && \
    tar -xzf /tmp/asterisk.tar.gz -C /tmp/asterisk --strip-components=1 && \
    cd /tmp/asterisk && \
    contrib/scripts/install_prereq install
