FROM docker.io/library/julia-envbaker-env

WORKDIR /app/src
ADD . /app/src
RUN julia --sysimage=/sysimage.so run.jl