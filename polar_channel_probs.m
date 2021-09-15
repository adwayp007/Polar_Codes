function [Z] = polar_channel_probs(A,n,i)

%%% ENCODER. 
%%% INPUT: CHANNEL TRANSITION MATRIX A,
%%%        SIZE PARAMETER n
%%%        INDEX i

N=2^n;
Z = 0;
for y=1:2^N
    y_str=string(dec2bin(y-1,N));
    
    for k=1:2^i
        if(i==0)
            u_i_str = "";
        else
            u_i_str = string(dec2bin(k-1,i));
        end
        sum_0=0;
        sum_1=0;
        for v=1:2^(N-i-1)
            v_str = string(dec2bin(v-1,N-1-i));
            sum_0 = sum_0+fetch_prod_channel_prob(A,n,y_str,u_i_str+"0"+v_str);
            sum_0 = sum_0/(2^(N-1));
            sum_1 = sum_1+fetch_prod_channel_prob(A,n,y_str,u_i_str+"1"+v_str);
            sum_1 = sum_1/(2^(N-1));
        end
        Z = Z+sqrt(sum_0*sum_1);
    end
end
            
end

