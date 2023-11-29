function u_hat = polar_scd_decoder(A, y)
%% Polar decoder using successive cancellation decoding
%% Input: Channel transition matrix A, output Y

    N = length(y);
    u_hat = zeros(1, N);

    for i = 1:N
        if i == 1
            lr = likelihood_cal(A, y, []);
        else
            lr = likelihood_cal(A, y, u_hat(1, 1:i-1));
        end

        if lr < 1
            u_hat(1, i) = 1;
        end
    end

end
