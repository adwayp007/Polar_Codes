function l = likelihood_cal(A, y, u_prev)
%% Likelihood calculator for successive cancellation decoder
%% Input: Channel transition matrix A, output y, previous decoded bits u_prev

    N = length(y);
    i = length(u_prev); % Length can be even or odd
    
    if N == 2
        y_1 = y(1);
        y_2 = y(2);
        
        a = A(1, y_1 + 1);
        b = A(2, y_1 + 1);
        c = A(1, y_2 + 1);
        d = A(2, y_2 + 1);
        
        if i == 0
            l = (a * c + b * d) / (b * c + a * d);
        else
            l = (a / b)^(1 - 2 * u_prev(i)) * (c / d);
        end
    else
        y_1 = y(1:N/2);
        y_2 = y(N/2+1:N);
        
        if mod(i, 2) == 0
            if i == 0
                u_odd = [];
                u_even = [];
            else
                u_odd = u_prev(1:2:i-1);
                u_even = u_prev(2:2:i);
            end
            
            l = (likelihood_cal(A, y_1, mod(u_odd + u_even, 2)) * likelihood_cal(A, y_2, u_even) + 1) / ...
                (likelihood_cal(A, y_1, mod(u_odd + u_even, 2)) + likelihood_cal(A, y_2, u_even));
        else
            u_odd = u_prev(1:2:i-2);
            u_even = u_prev(2:2:i-1);
            
            l = (likelihood_cal(A, y_1, mod(u_odd + u_even, 2))^(1 - 2 * u_prev(i))) * likelihood_cal(A, y_2, u_even);
        end
    end
end
