%PLOTTRIALDATA   Plot trial during simulation/experiment.
nrInputs = size(history.f,2);
nrOutputs = size(history.e,2);
%% Initialization
if ~exist('PlotInit','var')
    itplot = figure('NumberTitle','off','Name','Trial data','Units','Normalized','Position',[0.25, 0.1, 0.5, 0.8]);
    
    %% Feedforward.
    ax(1) = subplot(4,1,1);
    hold on;
    
    pl_fprev = plot(t,NaN(N,nrInputs),'--');
    pl_f = plot(t,NaN(N,nrInputs));
    
%     hL = legend('Previous iteration x','Current iteration x','Previous iteration y','Current iteration y');    
%     newPosition = [0.83 0.9 0.17 0.1];
%     newUnits = 'normalized';
%     set(hL,'Position', newPosition,'Units', newUnits);
    xlim([0,t(end)]);
    xlabel('t $[s]$');
    ylabel('f $[V]$');
    
    % Title.
    title(ax(1),sprintf('Trial Number %d', N_trial));
    
    %% Control input.
    ax(2) = subplot(4,1,2);
    xlim([0,t(end)]);
    hold on;
    
    pl_uprev = plot(t,NaN(N,nrInputs),'--');
    pl_u = plot(t,NaN(N,nrInputs));
    
    
    xlabel('t $[s]$');
    ylabel('u $[N]$');
    
    %% Error.
    ax(3) = subplot(4,1,3);
    hold on;
    
    pl_eprev = plot(t,NaN(N,nrOutputs),'--');
    pl_e = plot(t,NaN(N,nrOutputs));
    xlim([0,t(end)]);
    xlabel('t $[s]$');
    ylabel('e $[m]$');
    
    %% Error norm.
    ax(4) = subplot(4,1,4);
    hold on;
    
    pl_eNorm = semilogy(0:N_trial-1,NaN(nrOutputs,N_trial),'--x');

    set(ax(4),'XTick',0:N_trial-1);
    xlabel('Trial \#');
    ylabel('$\|e\|_2 [m^2]$');
    if N_trial > 1
        xlim([0,N_trial-1]);
    end
    
    % Link time axes.
    linkaxes(ax(1:3),'x');
    
    % Set init done flag.
    PlotInit = 1;
    
else
    %% Update figure
    
    % Update title.
    title(ax(1),sprintf('Trial %d/%d',trial,N_trial));
    
    
    for i = 1:nrInputs
        % Feedforward.
        set(pl_fprev(i),'YData',get(pl_f(i),'YData'));
        set(pl_f(i),'YData',history.f(:,i,trial));
        % Control input.
        set(pl_uprev(i),'YData',get(pl_u(i),'YData'));
        set(pl_u(i),'YData',history.u(:,i,trial));
    end
    
    for i = 1:nrOutputs
        % Error.
        set(pl_eprev(i),'YData',get(pl_e(i),'YData'));
        set(pl_e(i),'YData',history.e(:,i,trial));
        % Error norm.
        set(pl_eNorm(i),'YData',history.eNorm(i,:));
    end

    
    
end

% Flush drawing.
drawnow;