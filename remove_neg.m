altered_r_data_rnfll = row_data_rnfll;
for i = 1:840
    if row_data_rnfll(1,i) < 0
        altered_r_data_rnfll(1,i) =0;
    end
end