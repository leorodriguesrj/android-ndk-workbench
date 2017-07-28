FROM	debian:jessie-slim

RUN	if [ -n "$HTTP_PROXY" ]; then echo "Acquire::http::proxy \"$HTTP_PROXY\";" >> /etc/apt/apt.conf.d/00proxy; fi && \
    if [ -n "$HTTPS_PROXY" ]; then echo "Acquire::https::proxy \"$HTTPS_PROXY\";" >> /etc/apt/apt.conf.d/00proxy; fi && \
    if [ -n "$FTP_PROXY" ]; then echo "Acquire::ftp::proxy \"$FTP_PROXY\";" >> /etc/apt/apt.conf.d/00proxy; fi && \
    apt-get update && \
    apt-get install -y gcc && \
    apt-get install -y g++ && \
    apt-get install -y build-essential && \
    apt-get install -y linux-headers-$(uname -r) && \
    apt-get autoremove && \
    apt-get clean && \
    rm -f /etc/apt/apt.conf.d/00proxy

RUN	if [ -n "$HTTP_PROXY" ]; then echo "Acquire::http::proxy \"$HTTP_PROXY\";" >> /etc/apt/apt.conf.d/00proxy; fi && \
    if [ -n "$HTTPS_PROXY" ]; then echo "Acquire::https::proxy \"$HTTPS_PROXY\";" >> /etc/apt/apt.conf.d/00proxy; fi && \
    if [ -n "$FTP_PROXY" ]; then echo "Acquire::ftp::proxy \"$FTP_PROXY\";" >> /etc/apt/apt.conf.d/00proxy; fi && \
    apt-get update && \
    apt-get install -y cmake && \
    apt-get install -y lldb && \
    apt-get autoremove && \
    apt-get clean && \
    rm -f /etc/apt/apt.conf.d/00proxy

RUN	if [ -n "$HTTP_PROXY" ]; then echo "Acquire::http::proxy \"$HTTP_PROXY\";" >> /etc/apt/apt.conf.d/00proxy; fi && \
    if [ -n "$HTTPS_PROXY" ]; then echo "Acquire::https::proxy \"$HTTPS_PROXY\";" >> /etc/apt/apt.conf.d/00proxy; fi && \
    if [ -n "$FTP_PROXY" ]; then echo "Acquire::ftp::proxy \"$FTP_PROXY\";" >> /etc/apt/apt.conf.d/00proxy; fi && \
    apt-get update && \
    apt-get install -y libsqlite3-dev zlib1g-dev && \
    apt-get install -y libncurses5-dev libgdbm-dev libbz2-dev && \
    apt-get install -y libreadline5-dev libssl-dev libdb-dev && \
    apt-get autoremove && \
    apt-get clean && \
    rm -f /etc/apt/apt.conf.d/00proxy

RUN mkdir /{workbench,ndk}

CMD ["bash"]
