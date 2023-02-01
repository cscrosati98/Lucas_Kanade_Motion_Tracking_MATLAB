function [Gx, Gy]= getGradient(I, sig)
[g,w]=gaussian(sig);
[gderiv,wp]=gaussian_Deriv(sig);
I_h=convolve(I,g');%horiz
Gx=convolve(I_h,gderiv);%horiz

I_v=convolve(I,g);%vert
Gy=convolve(I_v,gderiv');%vert

end