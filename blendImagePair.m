function out_img = blendImagePair(wrapped_imgs, masks, wrapped_imgd, maskd, mode)
img1 = wrapped_imgs;
mask1= masks;
img2 = wrapped_imgd;
mask2 = maskd;
mask1(mask1 > 0) = 1;
mask2(mask2 > 0) = 1;
if strcmp(mode,'overlay')
   
    w1 = cat(3, ~mask2, ~mask2, ~mask2);
    out_img = im2double(img1) .*im2double(w1)  + im2double(img2);
    
elseif strcmp(mode,'blend')
    w1 = cat(3,mask1,mask1,mask1);
    w2 = cat(3,mask2,mask2,mask2);
    
    out_img = (w2 .* im2double(img2) + w1 .* im2double(img1))./ (w1+w2);

    
else
    disp('wrong mode');
end