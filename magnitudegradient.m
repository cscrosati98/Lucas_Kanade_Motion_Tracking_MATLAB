function [horiz_im, vert_im, mag, grad] = magnitudegradient(image_in, sig)
[g,w]=gaussian(sig);
[gderiv,wp]=gaussian_Deriv(sig);
[height,width]=size(image_in);
image_out_h=convolve(image_in,g');%horiz
horiz_im=convolve(image_out_h,gderiv);%horiz

image_out_v=convolve(image_in,g);%vert
vert_im=convolve(image_out_v,gderiv');%vert
mag=zeros(height, width);
grad=zeros(height, width);
for i=1:height
    for j=1:width
        mag(i,j)=sqrt(vert_im(i,j)*vert_im(i,j)+horiz_im(i,j)*horiz_im(i,j));%assign magintude
        grad(i,j)=atan2(horiz_im(i,j),vert_im(i,j));%assign angle of edges
    end
end

end