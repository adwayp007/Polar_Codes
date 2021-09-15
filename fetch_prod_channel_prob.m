function [prob] = fetch_prod_channel_prob(A,n,y,u)
%%% CALCULATES INDIVIDUAL PRODUCT CHANNEL PROBABILITIES
%%% INPUT: CHANNEL TRANSITION MATRIX A,
%%%        SIZE PARAMETER n

N=2^n;
H=[1 0;1 1];
G_n=H;
for i=1:n-1
    G_n = kron(H,G_n);
end
index = 0:N-1;

bit_rev_index = bitrevorder(index);

G_n_bitrev = zeros(size(G_n));

for i=1:N
    G_n_bitrev(i,:) = G_n(bit_rev_index(1,i)+1,:);
end

%disp(G_n_bitrev);

prob=1;

u_vec = mod(stringtovec(u)*G_n_bitrev,2);
y_vec = stringtovec(y);

for i=1:N
    prob = prob*A(u_vec(1,i)+1,y_vec(1,i)+1);
end



