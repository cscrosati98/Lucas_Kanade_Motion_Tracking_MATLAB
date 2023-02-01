function [gderiv,w]=gaussian_Deriv(sigma)
    a=round(2.5*sigma - 0.5);
    w=2*a+1;
    sum=0;
    gderiv=zeros(1,w);
    for i=1:w
        gderiv(i)=-1*(i-1-a)*exp((-1*(i-1-a)*(i-1-a))/(2*sigma*sigma));
        sum=sum-i*gderiv(i);
    end    
    gderiv=gderiv/sum;
end