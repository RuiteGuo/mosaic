

[img1,map,a] = imread('portrait_small.png');
img2 = imread('Osaka.png');
img3 = imread('portrait_transformed.png');
[s,d] = ginputImage(img1,img2);
H = computeHomography(s,d);

% verification 
test = zeros(3,4);

for i = 1:4
   test(:,i) = H * transpose([s(i,1), s(i,2),1]); 
 test(1,i) = test(1,i) / test(3,i);
  test(2,i) = test(2,i) / test(3,i);
    
end

%imshow(img1);
%s = zeros(8,2);
%s = ginput(8);
%test2 = applyHomography(H,s);

%showCorrespondence(img1,img3,s,test2);





function [src_nx2, des_nx2] = ginputImage(img1,img2)
imshow(img1);
[x,y] = ginput(4);
imshow(img2);
[x1,y1]= ginput(4);
src_nx2 = [x,y];
des_nx2 = [x1,y1];
end


