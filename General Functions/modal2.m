function [r,am,bm,cm] = modal2(a,b,c)
    [v,an] = eig(a);
    bn = inv(v)*b;
    cn = c*v;
    
    i = find(imag(diag(an))');
    index = i(1:2:length(i));
    j = sqrt(-1);
    t = eye(length(an));
    
    if isempty(index)
        am=an;bm=bn;cm=cn;
    else
        for i = 1:index
            t(i:i+1,i:i+1) = [j 1;-j 1];
        end
        am = real(inv(t)*an*t);
        bm = real(inv(t)*bn);
        cm = real(cn*t);
        
        r = v*t;
    end
end

