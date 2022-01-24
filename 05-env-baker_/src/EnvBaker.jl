# This is the precompilation package
import Plots, CSV, StatsPlots, Markdown, DataFrames, Query, ColorSchemes, StatsBase, Random, Distributions

p = Plots.plot()
fname = "$(tempname()).png"
Plots.savefig(p, fname)

try
    CSV.File("a")
catch
end

ColorSchemes.acton.colors

DataFrames.DataFrame()

dist = Distributions.Gamma(2)
p = StatsPlots.scatter(dist, leg = false)

StatsBase.AnalyticWeights([0.2, 0.1, 0.3])

Markdown.md"a"

nothing