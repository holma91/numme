% vvind = 4.75, v = 23.75,  20.0944
% vvind = 5.25, v = 26.25, 22.9324
% vvind = 4.75, v = 26.25, 20.7892
% vvind = 5.25, v = 23.75, 22.2164
% vvind = 5, v = 23.75, 21,1436
% vvind = 5, v = 26.25, 21,8495
% vvind = 5, v = 25, 21,5039
% vvind = 4.75, v = 25, 20.4490
% vvind = 5.25, v = 25, 22.5818

% all possible combinations (vind, hastighet)
combinations = [
  4.75, 23.75;
  5.25, 26.25;
  4.75, 26.25;
  5.25, 23.75;
  5, 23.75;
  5, 26.25;
  5, 25;
  4.75, 25;
  5.25, 25;
];

actual_vinkel = vindkast_c(5, 25, false);
largest_err_vinkel = 0;
smallest_err_vinkel = inf;

for i=1:size(combinations, 1)
    err_vinkel = vindkast_c(combinations(i, 1), combinations(i, 2), false);
    if err_vinkel < smallest_err_vinkel
        smallest_err_vinkel = err_vinkel;
    end
    if err_vinkel > largest_err_vinkel
        largest_err_vinkel = err_vinkel;
    end
end

disp(["largest err vinkel:" largest_err_vinkel]);
disp(["smallest err vinkel:" smallest_err_vinkel]);
disp(["actual vinkel:" actual_vinkel]);

if abs(smallest_err_vinkel - actual_vinkel) > abs(largest_err_vinkel - actual_vinkel)
    err = abs(smallest_err_vinkel - actual_vinkel);
else
    err = abs(largest_err_vinkel - actual_vinkel);
end
disp(["err:" err]);

avvikelse = (err/actual_vinkel);
disp(["avvikelse:" avvikelse]); %cirka 6.64%

