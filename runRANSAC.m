function [inliers_id, H] =  runRANSAC(Xs, Xd, ransac_n, eps)

[n, ~] = size(Xs);
inliers_id = [];

for iter = 1:ransac_n
    
    % compute the homography
    permutations = randperm(n);
    indices = permutations(1:ceil(n/5));
    src_pts = Xs(indices, :);
    dest_pts = Xd(indices, :);
    new_H = computeHomography(src_pts, dest_pts);
    
    % compute the inliers
    new_inliers = [];
    Xt = applyHomography(new_H, Xs);
    for k = 1:n
        if norm(Xt(k,:)-Xd(k,:)) < eps
            new_inliers = [new_inliers, k];
        end
    end
    
    % compare the results
    if length(new_inliers) > length(inliers_id)
        H = new_H;
        inliers_id = new_inliers;
    end
end