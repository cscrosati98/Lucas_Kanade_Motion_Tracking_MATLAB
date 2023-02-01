function image_out=convolve(image_in, kernel)%add w and h as param
    kernel=flip(kernel,1);
    kernel=flip(kernel,2);
    [height,width]=size(image_in);
   image_out=zeros(height,width);
    [k_height,k_width]=size(kernel);
    for i=1:height
        for j=1:width
            sum=0;
            for k=1:k_height
                for m=1:k_width
                    offi=-1*floor(k_height/2)+ k-1;
                    offj=-1*floor(k_width/2)+ m-1;
                    if((i+offi<=height) && (j+offj <= width) && (i+offi>=1) && (j+offj>=1 ))
                        sum=sum+image_in(i+offi, j+offj)*kernel(k,m);%convolution at index
                    else
                        sum=sum+0;
                    end
                end
            end
            image_out(i,j)=sum;
        end
    end
end