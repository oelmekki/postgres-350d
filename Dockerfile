FROM postgres:15.4
MAINTAINER Olivier El Mekki <olivier@el-mekki.com>

RUN apt update && apt install -y build-essential curl postgresql-server-dev-15
RUN curl https://ftp.postgresql.org/pub/source/v15.4/postgresql-15.4.tar.bz2 -o /postgresql-15.4.tar.bz2
RUN cd / && tar xvf postgresql-15.4.tar.bz2
RUN cd /postgresql-15.4/contrib/cube && sed -i 's/#define CUBE_MAX_DIM (100)/#define CUBE_MAX_DIM (350)/' cubedata.h && \
    USE_PGXS=true make && USE_PGXS=true make install
RUN echo -e "\nen_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen
