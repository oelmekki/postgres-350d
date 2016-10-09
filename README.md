# pg350d

Docker build of postgresql-9.6 changing the dimension limit for the cube extension, raising it to 350.

This is needed to be able to work with words embedding with postgres.

You can easily generate a build for your own need in term of dimensions by editing this dockerfile.
