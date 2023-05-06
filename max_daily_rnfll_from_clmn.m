max_daily_rnfll = zeros([121,1]);
for i = 1:121
    arr = data_daily_rnfll_clmn(:,i);
    max1 = max(arr(arr>0));
    max_daily_rnfll(i,1) = max1;
end