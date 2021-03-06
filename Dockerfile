FROM	debian:jessie-slim

RUN if [ -n "$HTTP_PROXY" ]; then echo "Acquire::http::proxy \"$HTTP_PROXY\";" >> /etc/apt/apt.conf.d/00proxy; fi && \
    if [ -n "$HTTPS_PROXY" ]; then echo "Acquire::https::proxy \"$HTTPS_PROXY\";" >> /etc/apt/apt.conf.d/00proxy; fi && \
    if [ -n "$FTP_PROXY" ]; then echo "Acquire::ftp::proxy \"$FTP_PROXY\";" >> /etc/apt/apt.conf.d/00proxy; fi && \
    apt-get update && \
    apt-get install -y vim && \
    apt-get install -y git && \
    apt-get autoremove && \
    apt-get clean && \
    rm -f /etc/apt/apt.conf.d/00proxy

RUN if [ -n "$HTTP_PROXY" ]; then echo "Acquire::http::proxy \"$HTTP_PROXY\";" >> /etc/apt/apt.conf.d/00proxy; fi && \
    if [ -n "$HTTPS_PROXY" ]; then echo "Acquire::https::proxy \"$HTTPS_PROXY\";" >> /etc/apt/apt.conf.d/00proxy; fi && \
    if [ -n "$FTP_PROXY" ]; then echo "Acquire::ftp::proxy \"$FTP_PROXY\";" >> /etc/apt/apt.conf.d/00proxy; fi && \
    apt-get update && \
    apt-get install -y clang && \
    apt-get install -y gcc && \
    apt-get install -y g++ && \
    apt-get install -y linux-headers-$(uname -r) && \
    apt-get autoremove && \
    apt-get clean && \
    rm -f /etc/apt/apt.conf.d/00proxy

RUN if [ -n "$HTTP_PROXY" ]; then echo "Acquire::http::proxy \"$HTTP_PROXY\";" >> /etc/apt/apt.conf.d/00proxy; fi && \
    if [ -n "$HTTPS_PROXY" ]; then echo "Acquire::https::proxy \"$HTTPS_PROXY\";" >> /etc/apt/apt.conf.d/00proxy; fi && \
    if [ -n "$FTP_PROXY" ]; then echo "Acquire::ftp::proxy \"$FTP_PROXY\";" >> /etc/apt/apt.conf.d/00proxy; fi && \
    apt-get update && \
    apt-get install -y cmake && \
    apt-get install -y lldb && \
    apt-get autoremove && \
    apt-get clean && \
    rm -f /etc/apt/apt.conf.d/00proxy

RUN if [ -n "$HTTP_PROXY" ]; then echo "Acquire::http::proxy \"$HTTP_PROXY\";" >> /etc/apt/apt.conf.d/00proxy; fi && \
    if [ -n "$HTTPS_PROXY" ]; then echo "Acquire::https::proxy \"$HTTPS_PROXY\";" >> /etc/apt/apt.conf.d/00proxy; fi && \
    if [ -n "$FTP_PROXY" ]; then echo "Acquire::ftp::proxy \"$FTP_PROXY\";" >> /etc/apt/apt.conf.d/00proxy; fi && \
    apt-get update && \
    apt-get install -y libsqlite3-dev zlib1g-dev \
        libncurses5-dev libgdbm-dev libbz2-dev \
        libreadline-dev libssl-dev libdb-dev \
	libicu-dev pkgconf && \
    apt-get autoremove && \
    apt-get clean && \
    rm -f /etc/apt/apt.conf.d/00proxy

RUN if [ -n "$HTTP_PROXY" ]; then echo "Acquire::http::proxy \"$HTTP_PROXY\";" >> /etc/apt/apt.conf.d/00proxy; fi && \
    if [ -n "$HTTPS_PROXY" ]; then echo "Acquire::https::proxy \"$HTTPS_PROXY\";" >> /etc/apt/apt.conf.d/00proxy; fi && \
    if [ -n "$FTP_PROXY" ]; then echo "Acquire::ftp::proxy \"$FTP_PROXY\";" >> /etc/apt/apt.conf.d/00proxy; fi && \
    apt-get upgrade -y && \
    apt-get autoremove && \
    apt-get clean


RUN if [ -n "$HTTP_PROXY" ]; then echo "Acquire::http::proxy \"$HTTP_PROXY\";" >> /etc/apt/apt.conf.d/00proxy; fi && \
    if [ -n "$HTTPS_PROXY" ]; then echo "Acquire::https::proxy \"$HTTPS_PROXY\";" >> /etc/apt/apt.conf.d/00proxy; fi && \
    if [ -n "$FTP_PROXY" ]; then echo "Acquire::ftp::proxy \"$FTP_PROXY\";" >> /etc/apt/apt.conf.d/00proxy; fi && \
    apt-get install -y curl && \
    echo --insecure > ~/.curlrc && \
    git config --global http.sslVerify "false" && \
    apt-get autoremove && \
    apt-get clean

COPY depot_tools-master.tar.gz /tmp

RUN mkdir /depot_tools && cd /depot_tools && \
    tar -xvf /tmp/depot_tools-master.tar.gz && \
    rm /tmp/depot_tools-master.tar.gz && \
    OLDPATH=$PATH && \
    export PATH="/depot_tools:$PATH" && \
    gclient

ENV NDK_HOME /ndk
ENV WORKBENCH_HOME /workbench
ENV PATH "$PATH:$NDK_HOME/build/tools:/depot_tools"

RUN mkdir /workbench && mkdir /ndk

CMD ["bash"]
