function [matrix] = impulseResponseMatrix(syst,N)
    sys = ss(syst);
    matrix = zeros(N);
    vec = dimpulse(sys.A,sys.B,sys.C,sys.D,1,N);
    for i = 1:N
        matrix(i:end,i) = vec(1:end-i+1,:);
    end
end

