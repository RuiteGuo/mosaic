function result_img = ...
    showCorrespondence(orig_img, warped_img, src_pts_nx2, dest_pts_nx2)
f1 = figure;
[a,b,c] = size(orig_img)
[rows,cols] = size(src_pts_nx2)

collage = [orig_img,warped_img];
imshow(collage);

for i = 1:rows
    line([src_pts_nx2(i,1),b+dest_pts_nx2(i,1)],[src_pts_nx2(i,2),dest_pts_nx2(i,2)],'LineWidth',2,'Color',[1,0,0]);
    
end

saveas(f1,'correspondanceresultaaa.png');
result_img = imread('correspondanceresultaaa.png');