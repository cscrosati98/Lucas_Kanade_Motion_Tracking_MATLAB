%Section 1
sig=0.6;
op_num='1 - Statue Sequence';
op_num=[op_num newline '2- Flower Garden Sequence' newline];
fprintf(op_num)
window= input('Enter desired window size (11 is recommended): ');
n = input('Enter a number: ');
switch n
    case 1
        fprintf('Select First image in Statue Sequence');
        [FileName,FilePath]=uigetfile('*');
        initial=imread(strcat(FilePath,FileName));
        imshow(initial)
        truesize([500 500])
        %select feature points
        topfeatures = ginput(21);
        %draw feature points
        for fp = 1:length(topfeatures)
            line([(topfeatures(fp,1) + 2) (topfeatures(fp,1) - 2)],[(topfeatures(fp,2) + 2) (topfeatures(fp,2) - 2)],'color','green'); 
            hold on
            line([(topfeatures(fp,1) + 2) (topfeatures(fp,1) - 2)],[(topfeatures(fp,2) - 2) (topfeatures(fp,2) + 2)],'color','green');
            hold on
        end
        [height, width, depth]=size(initial);
        book=zeros(height, width, depth, 31);
        for x=1:31 %find all 31 files and read them into a frame book
            FileName=strcat(FilePath, "img0",string(x+587),".bmp");
            book(:,:,:,x)=imread(FileName);
        end
    case 2
        fprintf('Select First image in Flower Garden Sequence');
        [FileName,FilePath]=uigetfile('*');
        initial=imread(strcat(FilePath,FileName));
        imshow(initial)
        truesize([500 500])
        %select feature points
        topfeatures = ginput(21);
        %draw feature points
        [height, width, depth]=size(initial);
        book=zeros(height, width, depth, 28);
        for x=1:29 %find all 29 files and read them into a frame book
            FileName=strcat(FilePath, "img0",string(x+29),".pgm");
            book(:,:,:,x)=imread(FileName);
        end
    otherwise
        n = input('Enter a number: ');
end
[a,b,c,count]=size(book);
I=zeros(a,b,c);%init current frame
J=zeros(a,b,c);%init next frame
for f=1:count-1
    I=book(:,:,:,f);%current frame
    J=book(:,:,:,f+1);%next frame
    [topfeatures]=lucasKanade(I, J, topfeatures, window);
    imshow(uint8(book(:,:,:,f)))
    title("Movie of Feature Points")
    truesize([500 500])
    for fp = 1:length(topfeatures)
        if(topfeatures(fp,2)>=height || topfeatures(fp,2)<=1 || topfeatures(fp,1)>=width || topfeatures(fp,1)<=1)
            %dont draw if out of bounds
        else %draw cross to denote tracking
        line([(topfeatures(fp,1) + 2) (topfeatures(fp,1) - 2)],[(topfeatures(fp,2) + 2) (topfeatures(fp,2) - 2)],'color','green'); 
        hold on
        line([(topfeatures(fp,1) + 2) (topfeatures(fp,1) - 2)],[(topfeatures(fp,2) - 2) (topfeatures(fp,2) + 2)],'color','green');
        hold on
        end
    end
    pause(0.2);
end