sst = ncread('HadISST_sst.nc','sst');
lat = ncread('HadISST_sst.nc','latitude'); 
lon = ncread('HadISST_sst.nc','longitude');
t = ncread('HadISST_sst.nc','time');
%%
lat = double(lat);
lon = double(lon);
t = double(t);
%%
whos

datestr(t([1 end])) % give time start and end 
% for this its for 153 years
% checking the date of the data 
% this show from year 0000 it is because data may not have proper dating so
% the starting year is year given from where we downloaded data from.

mean(diff(t))
%%
sst(sst<0) = 0;
%%
sst_ds = deseason(sst,t);
sst_ds_dt = detrend3(sst_ds);
%% 
clf % clears the previous figure
imagescn(lon,lat,eof(sst_ds_dt,1)') 
colorbar; 
cmocean('balance','pivot') 
title 'eof first mode'
%% Variance by that eof
sst_anom_var = var(sst_ds_dt,[],3);
%%
imagescn(lon,lat,sst_anom_var'); 
colorbar
title('variance of temperature') 
colormap(jet) % jet is inexcusable except when recreating old plots
clim([0 1])
%% calculating 6 eofs
[eof_maps,pc,expv] = eof(sst_ds_dt,6);
%%
whos eof_maps pc expv
%%
clf % clears the previous figure
eof_end = 3;
for i = 1:eof_end % we can change eof_end to 1 so i = 1:1 to plot for first eof only
    h(i) = subplot(eof_end,2,2*i-1);
    imagescn(lon,lat,eof_maps(:,:,i)')
    axis off
    cmocean('bal','pivot') 
    axis image
    
    % Plot the time series of the first mode: 
    subplot(eof_end,2,2*i)
    plot(t,pc(i,:))
    axis tight
    box off
    datetick
end
sgtitle(['The first ' num2str(i) ' principal components'])
%%
clf
expv
plot(expv) % percentage variance exlpained by corresponding modes