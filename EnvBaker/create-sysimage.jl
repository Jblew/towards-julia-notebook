import PackageCompiler, Pkg
Pkg.activate(".")
Pkg.instantiate()
Pkg.precompile()


PackageCompiler.create_sysimage(
    ["Plots", "CSV", "StatsPlots", "Markdown", "DataFrames", "Query", "ColorSchemes", "StatsBase", "Random", "Distributions"];
    sysimage_path = "DSSysimage.so",
    precompile_execution_file = "src/EnvBaker.jl"
)
