FROM postgres:15.3
MAINTAINER Olivier El Mekki <olivier@el-mekki.com>

RUN apt update && apt install -y build-essential curl postgresql-server-dev-15
RUN curl https://ftp.postgresql.org/pub/source/v15.3/postgresql-15.3.tar.bz2 -o /postgresql-15.3.tar.bz2
RUN cd / && tar xvf postgresql-15.3.tar.bz2
RUN cd /postgresql-15.3/contrib/cube && sed -i 's/#define CUBE_MAX_DIM (100)/#define CUBE_MAX_DIM (350)/' cubedata.h && \
    USE_PGXS=true make && USE_PGXS=true make install
