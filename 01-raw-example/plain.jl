@time using Plots, DataFrames, Markdown

md"""
# Plain notebook
"""

zad5_skrocenie_zycia = 20
zad5_obnizenie_jakosci = 0.5
zad5_okres_chorowania = 16

rectangle(x, y, w, h) = Shape(x .+ [0, w, w, 0], y .+ [0, 0, h, h])

function plotDALY(;
    skrocenie_zycia,
    czas_choroby,
    obnizenie_jakosci,
    plot_choroba = true,
    plot_pyll = false,
    plot_yld = false,
    legend = :topright,
    srednia_dlugosc_zycia = 78.58,
    labels = true
)
    wiek_smierci = srednia_dlugosc_zycia - skrocenie_zycia
    wiek_zachorowania = wiek_smierci - czas_choroby
    jakoscZyciaZdrowego = DataFrame(
        :Year => [0, srednia_dlugosc_zycia, srednia_dlugosc_zycia * 1.1],
        :Quality => [1.0, 0.0, 0.0],
    )
    jakoscZyciaChorego = DataFrame(
        :Year => [0, wiek_zachorowania, wiek_smierci],
        :Quality => [1.0, 1.0 - obnizenie_jakosci, 0.0],
    )


    p = plot(
        jakoscZyciaZdrowego.Year, jakoscZyciaZdrowego.Quality,
        label = labels ? "Życie zdrowego człowieka" : "",
        xlabel = labels ? "Lata życia" : "", ylabel = labels ? "Jakość życia [%]" : "",
        seriestype = :steppost, linewidth = 3, linecolor = :green,
        fill = (0, 0.5, :green), legend = legend,
    )
    if plot_choroba
        plot!(p,
            jakoscZyciaChorego.Year, jakoscZyciaChorego.Quality,
            label = "Życie chorego człowieka",
            seriestype = :steppost, linewidth = 3, linecolor = :red,
            fill = (0, 0.99, :darkred),
        )

        plot!(p,
            [25, jakoscZyciaChorego.Year[2]], [0.9, jakoscZyciaChorego.Quality[2]], arrow = (:closed, 2.0), color = :white, label = nothing,
            ann = [(25, 0.9, text("Zachorowanie", 8, :white))]
        )
        plot!(p,
            [62, wiek_smierci], [0.2, 0.0], arrow = (:closed, 2.0), color = :white, label = nothing,
            ann = [(62, 0.2, text("Śmierć", 8, :white))]
        )
    end

    if plot_pyll
        plot!(p,
            rectangle(wiek_smierci, 0, skrocenie_zycia, 1.0),
            color = :black, opacity = 0.9, label = "PYLL",
            ann = labels ? [(wiek_smierci + skrocenie_zycia / 2, 0.5, text("PYLL", 8, :white))] : []
        )
    end

    if plot_yld
        plot!(p,
            rectangle(wiek_zachorowania, 1.0 - obnizenie_jakosci, czas_choroby, obnizenie_jakosci),
            color = :black, opacity = 0.8, label = "YLD",
            ann = labels ? [(wiek_zachorowania + czas_choroby / 2, 1.0 - obnizenie_jakosci / 2, text("YLD", 8, :white))] : []
        )
    end

    p
end

plot_daly_choroba = plotDALY(
    skrocenie_zycia = zad5_skrocenie_zycia,
    obnizenie_jakosci = zad5_obnizenie_jakosci,
    czas_choroby = zad5_okres_chorowania,
)

savefig(plot_daly_choroba, "output.svg")