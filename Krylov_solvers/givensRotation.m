function [H, Q] =  givensRotation(n, H, Q, givensjb)
% H = zeros(n+1,n);
% Q = zeros(2*n,1);
if (givensjb==0)
    code = 0;
    for k = 1:n
        for j = 1:k-1
            i = 2*(j-1);
            temp1 = H(j,k);
            temp2 = H(j+1,k);
            c = Q(i+1);
            s = Q(i+2);
            H(j,k) = c*temp1 - s*temp2;
            H(j+1,k) = s*temp1 + c*temp2;
        end
        q_ptr = 2*k;
        temp1 = H(k,k);
        temp2 = H(k+1,k);
        if (temp2==0)
            c = 1;
            s = 0;
        elseif (abs(temp2)>=abs(temp1))
            temp3 = temp1/temp2;
            s = -1/sqrt(1+temp3^2);
            c = -s*temp3;
        else
            temp3 = temp2/temp1;
            c = 1/sqrt(1+temp3^2);
            s = -c*temp3;
        end
        Q(q_ptr) = c;
        Q(q_ptr+1) = s;
        if (H(k,k) == c*temp1 - s*temp2 && H(k,k) == 0)
            code = k+1;
            break;
        end
    end
else
    % n_minus_1 = n-1;
    code = 0;
    for k = 1:n
        i = 2*(k-1);
        temp1 = H(k,n);
        temp2 = H(k+1,n);
        c = Q(i);
        s = Q(i+1);
        H(k,n) = c*temp1 - s*temp2;
        H(k+1,n) = s*temp1 + c*temp2;
    end
    temp1 = H(n,n);
    temp2 = H(n+1,n);
    if (temp2==0)
        c = 1;
        s = 0;
    elseif (abs(temp2)>=abs(temp1))
        temp3 = temp1/temp2;
        s = -1/sqrt(1+temp3^2);
        c = -s*temp3;
    else
        temp3 = temp2/temp1;
        c = 1/sqrt(1+temp3^2);
        s = -c*temp3;
    end
     q_ptr =2*n;
     Q(q_ptr) =c;
     Q(q_ptr+1) =s;
     if (H(k,k) == c*temp1 - s*temp2 && H(k,k) == 0)
         code = n;
     end
end


    
        
       
