function [L,U] = decomposicaoLU (K)
    [n,c] = size(K);
    L = eye(n,n);
    for j = 1:(n-1)
        pivor = K(j,j);
        for i = j+1:n
            fator = K(i,j)/pivor;
            K(i,:) = K(i,:) - fator*K(j,:);
            L(i,j) = fator;
        end
    end
    U=K
endfunction

function x = sistemaLU (K,b)
    [L U] = decomposicaoLU (K);
    y = tI (L,b);
    x = tS (U,y);
endfunction

