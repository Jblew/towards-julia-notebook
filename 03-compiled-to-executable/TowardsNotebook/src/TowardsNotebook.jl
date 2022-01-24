module TowardsNotebook

@time using Plots, DataFrames, Markdown
export notebook

function notebook()
    pv(fv::Float64, r::Float64, n::Float64) = fv / ((1 + r)^n)

    fv = 1.0
    years = [i for i in 0:20]
    qalyValue = DataFrame(
        :Year => years,
        :Value => [pv(fv, 0.035, Float64(n)) for n in years]
    )
    moneyValue = DataFrame(
        :Year => years,
        :Value => [pv(fv, 0.005, Float64(n)) for n in years]
    )



    @time p = plot(qalyValue.Year, qalyValue.Value, label = "QALY value loss at rate 3.5%/y")
    @time plot!(p, moneyValue.Year, moneyValue.Value, label = "Money value loss at rate 5%/y")

    @time savefig(p, "output.svg")

    md"""
    # QALY vs money discounting
    The below figure shows how not only money but also health outcomes (QALY)
    are expected to devaluate (due to incertanity and innovation)

    ![QALY vs money discounting](./output.svg)
    """
end

function julia_main()::Cint
    notebook()
    return 0 # if things finished successfully
end

end # module
