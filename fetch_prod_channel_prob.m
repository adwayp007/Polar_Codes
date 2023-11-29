function prob = fetch_prod_channel_prob(A, n, y, u)
%% Calculate individual product channel probabilities
%% Input: Channel transition matrix A, size parameter n

N = 2^n;
H = [1 0; 1 1];
G_n = H;

% Generate the product matrix G_n
for i = 1:n-1
    G_n = kron(H, G_n);
end

% Generate the bit-reversed index
index = 0:N-1;
bit_rev_index = bitrevorder(index);

% Initialize the bit-reversed product matrix G_n_bitrev
G_n_bitrev = zeros(size(G_n));

% Rearrange G_n according to the bit-reversed index
for i = 1:N
    G_n_bitrev(i, :) = G_n(bit_rev_index(i) + 1, :);
end

% Initialize probability
prob = 1;

% Convert input and output sequences to vectors
u_vec = mod(stringtovec(u) * G_n_bitrev, 2);
y_vec = stringtovec(y);

% Calculate the individual product channel probabilities
for i = 1:N
    prob = prob * A(u_vec(i) + 1, y_vec(i) + 1);
end
end
