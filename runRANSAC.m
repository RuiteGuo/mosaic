function [inliers_id, H] = runRANSAC(Xs, Xd, ransac_n, eps)


H = zeros(3,3);
inliers_id = 0;
maxFit = 0;
[n,~] = size(Xs)

for i=1:ransac_n

     permutations = randperm(n);    
    indices = transpose(permutations(1:ransac_n/2));
    src_pts = Xs (indices,:);
    dest_pts = Xd (indices,:);
    H_new = computeHomography(src_pts, dest_pts);
    Xd_new = applyHomography(H_new,Xs);
    dist = sqrt((Xd(:,1) - Xd_new(:,1)).^2 + (Xd(:,2) - Xd_new(:,2)).^2);
    newInliers = find (dist < eps);
    if length(newInliers) > maxFit
        H = H_new;
        inliers_id=newInliers;
        maxFit = length(newInliers);
    end
    
    
end
end