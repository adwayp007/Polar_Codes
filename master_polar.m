function [list] = master_polar(A,n)

%%% THE MASTER FUNCTION FOR THE POLAR ENCODER
%%% INPUT: CHANNEL TRANSITION MATRIX A
%%%        SIZE PARAMETER n

N = 2^n;

list = zeros(N,1);

for i=1:N
    
    list(i,1) = polar_channel_probs(A,n,i-1);
    disp(list(i,1));
end

end

