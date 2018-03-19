function dest_pts_nx2 = applyHomography(H_3x3, src_pts_nx2)

% verification 
[rows,cols] = size(src_pts_nx2);
test = zeros(3,rows);
dest_pts_nx2 = zeros(rows,2);
s = src_pts_nx2;

for i = 1:rows
   test(:,i) = H_3x3 * transpose([s(i,1), s(i,2),1]); 
 test(1,i) = test(1,i) / test(3,i);
  test(2,i) = test(2,i) / test(3,i);
end
tTrans = transpose(test);
dest_pts_nx2(:,:) = tTrans(:,1:2);

