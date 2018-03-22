function [mask, result_img] = backwardWarpImg(src_img, resultToSrc_H,...
    dest_canvas_width_height)
result_img = zeros(dest_canvas_width_height(2), dest_canvas_width_height(1),3);
mask = zeros(dest_canvas_width_height(2), dest_canvas_width_height(1));
for j=1:dest_canvas_width_height(2)
    for i=1:dest_canvas_width_height(1)
        x = resultToSrc_H * [j;i;1];
        x = x / x(3);
        x1 = round(x(1));
        x2 = round(x(2));
        if x2 < size(src_img,1)
            if x1 < size(src_img,2)
                if x1>0
                    if x2>0
            result_img(i,j,:) = src_img(x2, x1,:);
            mask(i,j) = 1;
                    end
                end
            end
        end
    end
end