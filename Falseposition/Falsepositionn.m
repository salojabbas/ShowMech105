extremexr = 100000;
smallnum = 1e-15;
iter=1;
if nargin<3
    error('minimum of 3 arguments')
end
es=.000001
maxit=200
if es ==0
    es=.000001;
end
if maxit==0
    maxit=200;
end

if func(xl)*func(xu)>0;
    error ('Input something else')
end

while (es>smallnum && iter<maxit)
    xr=xu-(func(xu)*(xl-xu)/(func(xl)-func(xu)));
    
    test = func(xl)*func(xr)
    if test<0
        xu=xr;
    elseif test>0
        xl=xr;
    else
        fprintf('%Found the Root',xr);
        break
    end
    es=abs((extremexr-xr)/(extremexr));
    extremexr=xr;
    iter=iter+1;
end
fprintf('The root is %f \n',xr)
fprintf('number of iterations %f \n', iter)
fprintf('error %f \n', es)
root=xr;
fx=func(root);
ea=es;
iter=iter;

end