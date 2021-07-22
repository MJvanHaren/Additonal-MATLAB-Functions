function bodeOpts = DefBodeOpts()
    bodeOpts = bodeoptions;
    bodeOpts.FreqUnits = 'Hz';
    bodeOpts.XLabel.FontSize = 12;
    bodeOpts.YLabel.FontSize = 12;
    bodeOpts.Title.String = '';
    bodeOpts.TickLabel.FontSize = 10;
end