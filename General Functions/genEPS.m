function genEPS(name)
    SetPlotLatexStyle();
    ax = gcf;
    exportgraphics(ax,name)
end