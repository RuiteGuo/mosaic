function result_img = ...
    showCorrespondence(orig_img, warped_img, src_pts_nx2, dest_pts_nx2)
f1 = figure;
[~,N,~] = size(orig_img)
[n,~] = size(src_pts_nx2)

collage = [orig_img,warped_img];
imshow(collage);

for i = 1:n
    line([src_pts_nx2(i,1),N+dest_pts_nx2(i,1)],[src_pts_nx2(i,2),dest_pts_nx2(i,2)],'LineWidth',1.5,'Color',[1,0,0]);
    
end

result_img = f1;