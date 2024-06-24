function averageVar = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, variable)


if length(size(variable))>2
    mulfactor3 = NaN(size(variable)); for i = 1:length(z); mulfactor3(i,:,:) = mulfactor; end
    
    %disp('3d variable')
    variable_M = variable .* mulfactor3;
    
    variable0 = variable_M(:,indLat,indLon);
    factor = mulfactor(indLat,indLon);
    factor1 = nantrapz(lon(indLon),factor,2);
    factor1 = nantrapz(lat(indLat),factor1);
    
    %variable_AV = trapz(lon(indLon),variable0,3);
    %variable_AV = trapz(lat(indLat),variable_AV,2);
    %variable_AV = squeeze(trapz(z,variable_AV/factor1,1));
    %disp(variable_AV)
       
    variable_AV = nantrapz(lon(indLon),variable0,3);
    variable_AV = nantrapz(lat(indLat),variable_AV,2);
    variable_AV = squeeze(nantrapz(z,variable_AV/factor1,1));
else
    %disp('2d variable')
    variable_M = variable .* mulfactor;
    
    variable0 = variable_M(indLat,indLon);
    factor = mulfactor(indLat,indLon);
    factor1 = nantrapz(lon(indLon),factor,2);
    factor1 = nantrapz(lat(indLat),factor1);
    
    variable_AV = nantrapz(lon(indLon),variable0,2);
    variable_AV = nantrapz(lat(indLat),variable_AV,1);
    variable_AV = squeeze(variable_AV/factor1);
end
averageVar = variable_AV;