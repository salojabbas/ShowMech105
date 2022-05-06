n= length (A);
L = zeros( n, n );
U = A ;
P = eye( n, n );

for i = 1:(n-1)
    [tmp, j] = max( abs( U(i:n, i) ) );
    j = j + (i-1);
    if ( tmp ==0 )
        error( 'the matrix is singular (non-invertible)');
    end
    
    U([i, j], :) = U ([j,i],:);
    P([i,j],:) = P([j,i], :);
    L ([i,j], :) = L ([j,i],:);
    
    for j =(i+1):n
        s = -U(j,i)/U(i,i);
        U(j, :) = U(j, :) + s* U(i,:);
        L(j,i) = -s;
    end
end
L = L + eye( n ,n );    

end