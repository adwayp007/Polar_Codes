function list = master_polar(A, n)
%% Master function for the polar encoder
%% Input: Channel transition matrix A, size parameter n

N = 2^n;
list = zeros(N, 1);

for i = 1:N
    list(i) = polar_channel_probs(A, n, i - 1);
    disp(list(i));
end

end
