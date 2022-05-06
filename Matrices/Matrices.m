A = [];

if nargin ~= 2;
    error('Function requires exactly 2 arguments. See Documentation');
end

for k=1:n
    for h=1:m
        if k==1
            A(k,h)=h;
        elseif h==1
            A(k,h)=k;
        else
            A(k,h)=A(k,h-1)+A(k-1,h);
        end
    end
end
disp(A)