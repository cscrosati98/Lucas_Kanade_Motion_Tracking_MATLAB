function [err]=Compute2x1ErrorVector(I, J, Gx,Gy,j,i,window, u)
w=floor(window/2);
err=[0,0];
[height, width]=size(Gx);
for offseti=-w:w %sum Gx and Gy over window
    for offsetj=-w:w
        if((i+offseti<=height && j+offsetj<=width && i+offseti>0 && j+offsetj>0 && i+u(2)+offseti<=height && j+u(1)+offsetj<=width && i+u(2)+offseti>0 && j+u(1)+offsetj>0))
            Gx_inter=Interpolate(Gx, i+offseti, j+offsetj);
            Gy_inter=Interpolate(Gy, i+offseti, j+offsetj);
            I_inter=Interpolate(I, i+offseti, j+offsetj);
            J_inter=Interpolate(J, i+u(2)+offseti, j+u(1)+offsetj);
            err(1)=err(1)+Gx_inter*(I_inter - J_inter);
            err(2)=err(2)+Gy_inter*(I_inter - J_inter);
        end
    end
end
end