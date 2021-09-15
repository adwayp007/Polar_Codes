function [I] = find_RM_gen_mat(n,r)
    %%For finding generator matrix of Reed-Muller code
    N=2^n;
    k=1;
    for i=1:r
        k=k+sum(nchoosek(n,i));
    end    
    H=[1 0;1 1];
    G_n=H;
    for i=1:n-1
        G_n = kron(H,G_n);
    end
    
    G_n = mod(G_n,2);
    
    list = sum(G_n,2);
    
    [B, I] = maxk(list,k);
    I=sort(I);
end

