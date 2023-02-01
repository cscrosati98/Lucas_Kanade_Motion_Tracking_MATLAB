function [Z]=Compute2x2GradientMatrix(Gx,Gy,j,i,window)
ixx=0;
iyy=0;
ixy=0;
w=floor(window/2);
[height, width]=size(Gx);
for offseti=-w:w %sum Gx and Gy over window
    for offsetj=-w:w
        if(i+offseti<=height && j+offsetj<=width && i+offseti>0 && j+offsetj>0)
            Gx_inter=Interpolate(Gx, i+offseti, j+offsetj);
            Gy_inter=Interpolate(Gy, i+offseti, j+offsetj);
            ixx=ixx+(Gx_inter*Gx_inter);
            iyy=iyy+(Gy_inter*Gy_inter);
            ixy=ixy+(Gx_inter*Gy_inter);
        end
    end
end
Z=[ixx, ixy;ixy, iyy];
end