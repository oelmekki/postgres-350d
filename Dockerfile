FROM postgres:9.6
MAINTAINER Olivier El Mekki <olivier@el-mekki.com>

RUN apt-get update && apt-get install -y build-essential curl postgresql-server-dev-9.6
RUN curl https://ftp.postgresql.org/pub/source/v9.6.0/postgresql-9.6.0.tar.bz2 -o /postgresql-9.6.0.tar.bz2
RUN cd / && tar xvf postgresql-9.6.0.tar.bz2
RUN cd /postgresql-9.6.0/contrib/cube && sed -i 's/#define CUBE_MAX_DIM (100)/#define CUBE_MAX_DIM (350)/' cubedata.h && \
    USE_PGXS=true make && USE_PGXS=true make install
