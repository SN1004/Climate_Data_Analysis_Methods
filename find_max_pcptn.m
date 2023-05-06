max_mnth_pcpt = zeros(70,1);
for r = 1:70
    max = row_rnfll_clmn(r,1);
    for c = 1:12
        if max < row_rnfll_clmn(r,c)
            max = row_rnfll_clmn(r,c);
        end
    end
    max_mnth_pcpt(r) = max;
    max = 0;
end