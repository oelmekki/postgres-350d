# pg350d

Docker build of postgresql-15.3 changing the dimension limit for the cube
extension, raising it to 350.

This is needed to be able to work with words embedding or other machine
learning related vectors with postgres.

> Note: since pg350d was released, there has been some efforts to support
> machine learning friendly vectors in [pgvector](https://github.com/pgvector/pgvector),
> which supports up to 16k dimensions.

You can easily generate a build for your own need in term of dimensions by
editing this dockerfile.

## What is the problem again?

The cube extension, which you'll use to perform operations on vectors, has
a hard limit of 100 dimensions per vector.

## Is it safe?

Patching the hardcoded limit is [the recommended way in postgres
doc](https://www.postgresql.org/docs/current/cube.html#id-1.11.7.20.9).

I've been using it for a few years in production, and didn't encounter any
problem.

## How to raise postgresql's cube extension dimensions limit?

Even if you're not familiar with docker, reading the Dockerfile from this repos
should be easy enough to teach you how to do it yourself. Spoiler:

* sources are in the `contrib/cube/` directory from postgres sources
* limit is in `contrib/cube/cubedata.h`
* make and make install should be ran with the `USE_PGXS=true` env variable

