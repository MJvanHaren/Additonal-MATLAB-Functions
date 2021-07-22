function coolbode(varargin)
    % G = system (ss,transfer function,...)
    % arg = either empty (normal bode) or 'mag'
    % win = frequency grid in
    G = varargin{1};
    both = true;
    win = logspace(0,3,2000)*2*pi;
    if nargin == 2
        arg = varargin{2};
        if strcmp(arg,'mag')
            both = false;
        else
            disp('Only magnitude bode are supported (''mag''), plotting default magnitude&phase bode')
        end
    elseif nargin == 3
        arg = varargin{2};
        if strcmp(arg,'mag')
            both = false;
        else
            disp('Only magnitude bode are supported (''mag''), plotting default magnitude&phase bode')
        end
        win = varargin{3}*2*pi;
    elseif nargin > 4
        error('Please specify a maximum of 3 inputs');
    end
    
    [mag,phase,wout] = bode(G,win);
    wout = wout/2/pi;
    if both
        subplot(2,1,1);
    end
    semilogx(wout,20*log10(squeeze(mag)),'Linewidth',1.5);
    xlabel('Frequency [Hz]');
    ylabel('Magnitude [dB]');
%     grid on; 
    hold on;
    xlim([min(wout) max(wout)]);
    if both
        subplot(2,1,2);
        semilogx(wout,squeeze(phase),'Linewidth',1.5);
        xlabel('Frequency [Hz]')
        ylabel('Phase [deg]');
%         grid on; 
        hold on;
        xlim([min(wout) max(wout)]);
    end
end

