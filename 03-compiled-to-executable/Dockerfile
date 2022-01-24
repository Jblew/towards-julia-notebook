FROM julia:1.7.1

ENV JULIA_DEPOT_PATH /.julia
WORKDIR /app

RUN julia -e "using Pkg; Pkg.add(\"PackageCompiler\");"
ADD . /app
RUN julia build.jl

CMD ["/app/TowardsNotebookCompiled/bin/TowardsNotebook"]