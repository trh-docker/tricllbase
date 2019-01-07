FROM quay.io/spivegin/tlmbasedebian

RUN mkdir /opt/compose
ENV DOCKERCOMPOSE=1.23.2 \
    DOCKER=18.09.0~3-0 
ADD https://download.docker.com/linux/debian/dists/stretch/pool/stable/amd64/docker-ce-cli_${DOCKER}~debian-stretch_amd64.deb /opt/tmp/docker-ce-cli.deb
ADD https://github.com/docker/compose/releases/download/${DOCKERCOMPOSE}/docker-compose-Linux-x86_64 /opt/docker/docker-compose
RUN apt-get update && apt-get install -y libltdl7 git &&\
    dpkg -i /opt/tmp/docker-ce-cli.deb &&\
    chmod +x /opt/docker/docker-compose && ln -s /opt/docker/docker-compose /bin/docker-compose &&\
    apt-get autoremove && apt-get autoclean &&\
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*