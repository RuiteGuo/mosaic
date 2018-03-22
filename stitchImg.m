function stitched_img = stitchImg(varargin)
result = varargin{1};

for i=2:nargin

    [xs, xd] = genSIFTMatches(result, varargin{i});
   [inliers_id, H] = runRANSAC(xs, xd, 100, 20);
    showCorrespondence(result, varargin{i}, xs(inliers_id, :), xd(inliers_id, :));
    canvasWH = [size(result, 2), size(result, 1)];
    [maskd, ~] = backwardWarpImg(varargin{i}, inv(H), canvasWH);
    masks = ones(size(result,1), size(result,2));
    maskd = maskd(1:canvasWH(2),1:canvasWH(1));
    result = blendImagePair(result, masks, varargin{i}, maskd, 'blend');
    result (isnan(result))=0;
end
stitched_img = result;
imshow(stitched_img);