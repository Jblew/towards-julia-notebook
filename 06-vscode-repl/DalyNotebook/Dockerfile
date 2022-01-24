FROM julia:1.7.1

ENV JULIA_DEPOT_PATH /.julia
WORKDIR /app

RUN apt-get install pandoc

ADD . /app
RUN julia daly-notebook.jl > index.md