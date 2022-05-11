

% results from a) (x, y, z)
point1 = [18.6425, 6.4954, 0.0032]; % point before z = 0
point2 = [18.6519, 6.5047, -0.0132]; % point after z = 0

z = 0;

x = point1(1) + (z-point1(3)) * (point2(1) - point1(1))/(point2(3) - point1(3));
y = point1(2) + (z-point1(3)) * (point2(2) - point1(2))/(point2(3) - point1(3));

nedslagsplats = [x, y, z];

disp(nedslagsplats);
