[m,nX]=size(x);
[m,nY]=size(y);
if(nX ~= nY)
    error('input data have different lengths')
end
if (nX < 2)
    error('input data of insufficient length')
end

h=x(2) - x(1);
for i=3:nX
    if (x(i)-x(i-1)) ~= h
        error('x input is not equally spaced');
    end
end

sum = y(1);
for i=2:(nX-2)
    if mod(i,2)==0
        sum = sum +4*y(i);
    else
        sum = sum + 2 *y(i);
    end
end
if mod(nX,2) == 0
    warning('warning: the trapezoidal rule has to be used on the last interval');
    sum =sum + y(nX-1);
    I = (sum*h/3) + ((y(nX) + y(nX-1))*h/2);
else
    sum = sum + 4*y(nX-1) +y(nX);
    I=sum*h/3;
end
disp('integral=');
disp(I);
end