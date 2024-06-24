function [dx_dlon, dx_dlat] = ccdfgradlonlat(chi,lon,lat);

a = 111.2;

if length(size(chi))<3
    dchidlon0 = ( chi(3:end,:) - chi(1:end-2,:) ) / (lon(3)-lon(1));
    dchidlat0 = ( chi(:,3:end) - chi(:,1:end-2) ) / (lat(3)-lat(1));
    
    dchidlon = NaN(size(chi));
    dchidlat = NaN(size(chi));
    dchidlon(:,2:end-1) = dchidlon0;
    dchidlat(2:end-1,:) = dchidlat0;

    latL = repmat(lat',1,size(chi,2));
    gradx = (dchidlon / a) ./ cos(latL*pi/180);
    grady = (dchidlat / a);
        
    dx_dlon = gradx;
    dx_dlat = grady;
    
else
    dchidlon0 = ( chi(:,:,3:end) - chi(:,:,1:end-2) ) / (lon(3)-lon(1));
    dchidlat0 = ( chi(:,3:end,:) - chi(:,1:end-2,:) ) / (lat(3)-lat(1));
    
    dchidlon = NaN(size(chi));
    dchidlat = NaN(size(chi));
    dchidlon(:,:,2:end-1) = dchidlon0;
    dchidlat(:,2:end-1,:) = dchidlat0;
    
    latL = repmat(lat',size(chi,1),1,size(chi,3));
    gradx = (dchidlon / a) ./ cos(latL*pi/180);
    grady = (dchidlat / a);
        
    dx_dlon = gradx;
    dx_dlat = grady;

end