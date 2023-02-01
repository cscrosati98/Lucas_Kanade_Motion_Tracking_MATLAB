function [topfeatures]=lucasKanade(I, J, topfeatures, window)
[Gx, Gy] = getGradient(I, 0.6);%get gradient images for horiz and vert
fpsize=size(topfeatures);
    for fp=1:fpsize
        iter=0; %iteration initialized to zero
        u(1)=0; %displacement vector initialized to zero
        u(2)=0; %displacement vector initialized to zero
        deltau=0; %incremental displacement vector initialized to zero
        [Z]=Compute2x2GradientMatrix(Gx,Gy,topfeatures(fp,1),topfeatures(fp,2),window);
        while(1)%iterations to update deltau
            err=Compute2x1ErrorVector(I,J,Gx,Gy,topfeatures(fp,1),topfeatures(fp,2),window,u);
            deltau=Solve2x2LinearSystem(Z,err);
            %update u
            u(1)=u(1)+deltau(1); %Horizontal
            u(2)=u(2)+deltau(2); %Vertical
            %break while if udelta is small or iter
            %exceeds threshold
            if(iter+1 > 10)
                break;
            end
            if(deltau(1) <=0.2 && deltau(2) <=0.2)
                break;
            end
            iter=iter+1;
        end
        topfeatures(fp,1)=topfeatures(fp,1)+u(1); %add dispalcement
        topfeatures(fp,2)=topfeatures(fp,2)+u(2); %add displacement
    end
end

