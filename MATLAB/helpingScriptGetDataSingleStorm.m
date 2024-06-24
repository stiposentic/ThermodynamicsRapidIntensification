dataReport = load(['REPORT_' reportS '.txt']);
dataReportShips = load(['SHIPS_' reportS '.asc']);

    N = size(dataReport,1);
    day_of_yearReport = datenum([dataReport(:,1:3), zeros(N,1), zeros(N,1), zeros(N,1)]) -...
        datenum([dataReport(:,1), ones(N,1), ones(N,1), zeros(N,1), zeros(N,1), zeros(N,1)]);
    timeReport = day_of_yearReport + dataReport(:,4)/24 + dataReport(:,5)/1440;
    windReport = dataReport(:,8); % in m/s
    pressureReport = dataReport(:,9); % in hPa
    latReport = dataReport(:,6); % in degrees
    lonReport = dataReport(:,7); % in degrees
    
    N = size(dataReportShips,1);
    day_of_yearReport = datenum([dataReportShips(:,1:3), zeros(N,1), zeros(N,1), zeros(N,1)]) -...
        datenum([dataReportShips(:,1), ones(N,1), ones(N,1), zeros(N,1), zeros(N,1), zeros(N,1)]);
    timeReportShear = day_of_yearReport + dataReportShips(:,4)/24;
    % get shear from report
    shipsShear = dataReportShips(:,5); % in kt
    shearHistoric = shipsShear*0 + 5.468*1.943844; % in kt

day_of_yearTransition = datenum(transTime) - datenum([transTime(1) 1 1 0 0 0]);
timeTransition = day_of_yearTransition;

timeR = stormDataIn(indCase,3);

sstR   = stormDataIn(indCase,85);

sfR   = stormDataIn(indCase,9);
iiR   = stormDataIn(indCase,12);
capeR   = stormDataIn(indCase,8);
dcinR   = stormDataIn(indCase,13);
srcmrR   = stormDataIn(indCase,10);
srcentR   = stormDataIn(indCase,15);
mf4kmR   = stormDataIn(indCase,11);
buoymaxR   = stormDataIn(indCase,14);
pv5to7kmR = stormDataIn(indCase,75); % using 5 to 7 km PV!!!!!!
vtend2km = stormDataIn(indCase,36);
stend2km = stormDataIn(indCase,40);
ctend2km = stormDataIn(indCase,44);
ttend2km = stormDataIn(indCase,48);
vtend6km = stormDataIn(indCase,38);
stend6km = stormDataIn(indCase,42);
ctend6km = stormDataIn(indCase,46);
ttend6km = stormDataIn(indCase,50);

pvZ  = profiles(indCase,:,9);
mfZ  = profiles(indCase,:,1);
vtendZ  = profiles(indCase,:,5);
stendZ  = profiles(indCase,:,6);
ttendZ  = profiles(indCase,:,7);