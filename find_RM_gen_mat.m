function I = find_RM_gen_mat(n, r)
    %% Find generator matrix of Reed-Muller code
    N = 2^n;
    k = 1;

    % Calculate the total number of rows in the generator matrix
    for i = 1:r
        k = k + sum(nchoosek(n, i));
    end

    H = [1 0; 1 1];
    G_n = H;

    % Generate the generator matrix G_n
    for i = 1:n-1
        G_n = kron(H, G_n);
    end

    % Take modulo 2 to get binary values
    G_n = mod(G_n, 2);

    % Sum each row of G_n
    row_sum = sum(G_n, 2);

    % Find the indices of the largest k values in row_sum
    [~, I] = maxk(row_sum, k);

    % Sort the indices
    I = sort(I);
end
