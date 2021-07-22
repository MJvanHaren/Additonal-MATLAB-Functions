function [plotTable] = SetPlotLatexStyle()
    set(groot, 'defaultAxesTickLabelInterpreter', 'latex'); 
    set(groot, 'defaultLegendInterpreter', 'latex'); 
    set(groot, 'DefaultTextInterpreter', 'latex');
    set(groot, 'DefaultAxesFontSize', 12);
    set(groot, 'DefaultFigureRenderer','Painters');
    plotTable = [1 1; %1
                 1 2; %2
                 1 3; %3
                 2 2; %4
                 2 3; %5
                 2 3; %6
                 2 4;
                 2 4;
                 3 3;
                 3 4;
                 3 4;
                 3 4; %12
                 4 4;
                 4 4;
                 4 4;
                 4 4; %16
                 3 6;
                 3 6; %18
                 4 5;
                 4 5  %20
                 ];
end

