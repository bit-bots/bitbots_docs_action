FROM alpine:3.10

RUN apk add python3 lftp openssh sshpass bash libxml2-dev libxslt-dev build-base python3-dev doxygen
RUN pip3 install sphinx sphinx-rtd-theme catkin-pkg exhale

ADD entrypoint.sh /entrypoint.sh

WORKDIR /work
RUN mkdir /root/.ssh && echo 'doku.bit-bots.de,134.100.10.2 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBHJtFlwimENZ6Csn0DK3i2v8BrC9VGoyJ/wiLTRWTBnUWmIs5rdJt+95LyJDb9GxHJnk1i0n7visVX/cLJoAh0Y=' > /root/.ssh/known_hosts

ENTRYPOINT ["/entrypoint.sh"]
