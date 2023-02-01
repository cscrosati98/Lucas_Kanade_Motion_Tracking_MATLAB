function [g,w] = gaussian(sigma)
    a=round(2.5*sigma-0.5);
    w=2*a+1;
    g=1:w;
    sum=0;
    for i=1:w
        g(i)=exp((-1*(i-1-a)*(i-1-a))/(2*sigma*sigma));
        sum=sum+g(i);
    end
    g=g/sum;
end