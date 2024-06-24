function divergence = ccdfdivlonlat(chix,chiy,lon,lat);

a = 111.2;

if length(size(chix))<3
    disp ['need to finish programing this  code in cdfdivlonlat.m']
    stop
    %chiv = chiy .* cos(lat*pi/180);

    %dchixdlon = ( chix(:,3:end) - chix(:,1:end-2) ) / (lon(3)-lon(1));
    %dchivdlat = ( chiv(3:end,:) - chiv(1:end-2,:) ) / (lat(3)-lat(1));

    %divergence = ((dchixdlon + dchivdlat) / a) ./ cos(lat(2:end-1)*pi/180);

else
    latL = repmat(lat',size(chix,1),1,size(chix,3));
    chiv = chiy .* cos(latL*pi/180);

    dchixdlon0 = ( chix(:,:,3:end) - chix(:,:,1:end-2) ) / (lon(3)-lon(1));
    dchivdlat0 = ( chiv(:,3:end,:) - chiv(:,1:end-2,:) ) / (lat(3)-lat(1));
    field = NaN(size(chix));
    dchixdlon = field; 
    dchivdlat = field;
    
    dchixdlon(:,2:end-1,2:end-1) = dchixdlon0(:,2:end-1,:);
    dchivdlat(:,2:end-1,2:end-1) = dchivdlat0(:,:,2:end-1);
    
    divergence = ((dchixdlon + dchivdlat) / a) ./ cos(latL*pi/180);
end