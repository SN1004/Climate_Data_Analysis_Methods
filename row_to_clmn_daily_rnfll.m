data_daily_rnfll_clmn = zeros([366,121]);
total_d = 0;
for i = 1:121
    d = 0;
    if rem(i,4) == 0  
        for d = 1:366
            data_daily_rnfll_clmn(d,i) = data_daily_rnfll((d+total_d),1);   
        end
    else 
        for d = 1:365
            data_daily_rnfll_clmn(d,i) = data_daily_rnfll((d+total_d),1);
        end
    end
    total_d = total_d + d;
end