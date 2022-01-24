FROM julia:1.7.1

ENV JULIA_DEPOT_PATH /.julia
WORKDIR /app

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install gcc

RUN julia -e "using Pkg; Pkg.add(\"PackageCompiler\");"
ADD . /app
RUN julia create-sysimage.jl
RUN mv DSSysimage.so /sysimage.so

CMD ["julia --sysimage=/sysimage.so"]