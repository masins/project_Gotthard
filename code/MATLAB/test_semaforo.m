
A = zeros(1,10)
B = zeros(1,10)


for t = 0 : 1 : 400

if (mod(t,4) == 0)
    if A(1,1) == 0
        A(1,1) = 1;
    end

if (mod(t,3)==0)
    for i=1:1:10
        if (A(1,i)==1 && A(1,i+1)==0)
            A(1,i)=0;
            A(1,i+1)=1;
        end
        
        if (B(1,i)==1 && B(1,i+1)==0)
            B(1,i)=0;
            B(1,i+1)=1;
        end
    end

if(mod(t,40) > 0 && mod(t,40) <= 20)
    if(A(1,9) == 1)
        B(1,1)=1;
        A(1, 9) = 0;
    end
end

end


end
end
