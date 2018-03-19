function H_3x3 = computeHomography(src_pts_nx2, dest_pts_nx2)
% construct linear system equations 

[rows,cols] = size (src_pts_nx2);

linearSystem = zeros (rows*2 + 1,9);
H = zeros(9,1);
solutions = zeros(rows*2 + 1,1);

% prevent obvious solutions for all 0
linearSystem (rows*2 +1 , 9) = 1;
solutions (rows*2+1,1) = 1;

n = 1;
for k = 1:rows 
   

    xs=src_pts_nx2(k,1);
    ys=src_pts_nx2(k,2);
    xd= dest_pts_nx2(k,1);
    yd= dest_pts_nx2(k,2);
   linearSystem(n,1:3) = [-xs,-ys,-1];
   linearSystem(n,4:6) = 0;
   linearSystem(n,7:9) = [xs*xd,ys*xd,xd];
    
 
   linearSystem(n+1,4:6) = [-xs,-ys,-1];
   linearSystem(n+1,1:3) = 0;
   linearSystem(n+1,7:9) = [xs*yd,ys*yd,yd];
    n = n+2;
end



% solve through least square
trans = transpose(linearSystem);

H = inv(trans*linearSystem)*trans*solutions;

H_3x3 = zeros(3,3);
H = transpose(H);
H_3x3(1,:) = H(1,1:3);
H_3x3(2,:) = H(1,4:6);
H_3x3(3,:) = H(1,7:9);



