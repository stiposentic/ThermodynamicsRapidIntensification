


% definition  of DEVELOPING switch:
% -1 decayng
% 0  neutral, inflection point
% 1 developing

% definition of INTERIOR switch:
% 1  convection far from edges
% 0  convection on the edge of the 3dvar domain

% if JURACIC is equal to 1 average the way they
% did in Juracic and Raymond 2016 over a 4x4 degree box

% avBox variable has: lonC, latC, CONV
% where lonC and latC are centers of averaging boxes (dd parameter sets
% the windth: 2*dd), anc CONV parameter tells is it is:
% (1) convective (mflux4km>0), (-1) strati (mflux4km<0)

if strcmp(storm_name,'alex1')
    lonC = -91.5; latC = 20.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-89 22 1; -92 24 1; -92 19 1; -94.25 23.5 -1]; end
    avBoxS = [-94.25 23.5 -1];
    if JURACIC==1; lonC = -91.5; latC = 20.5; dd = 2; end
    tTH = [2010 6 30 0 0];
    DEVELOPING = 1;
    INTERIOR = 0;
    campaign = 'HRD';
elseif strcmp(storm_name,'alex2')
    lonC = -93; latC = 22.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-93 27.5 1; -93 23 1; -89 26 1; ...
            -90.5 28 -1; -90 22.5 -1 ];end
    if JURACIC==1; lonC = -94.5; latC = 22.5; dd = 2; end
    avBoxS = [-90.5 28 -1];
    tTH = [2010 6 30 0 0];
    DEVELOPING = 1;
    INTERIOR = 0;
    campaign = 'HRD';
elseif strcmp(storm_name,'fiona1') && year==2010
    lonC = -47.5; latC = 16; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-47.5 16 1; -44.5 13 1;...
            -44 15.5 -1; -47.5 13.5 -1];end
    if JURACIC==1; lonC = 0; latC = 0; dd = 2; end
    avBoxS = [-44 15.5 -1];
    tTH = [year month day hour minute 0];  %%%%%%%%%%%%%%%%%%%%%%%%%%%% put same time as flight    DEVELOPING = 1;
    DEVELOPING = 0;
    INTERIOR = 1;
    campaign = 'PREDICT';
elseif strcmp(storm_name,'fiona2') && year==2010
    lonC = -55.5; latC = 18; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-55.5 18.25 1; -52.5 14 1; ...
            -56 15.75 -1; -53 12 -1]; end
    avBoxS = [-56 15.75 -1];
    if JURACIC==1; lonC = 0; latC = 0; dd = 2; end
    tTH = [year month day hour minute 0];  %%%%%%%%%%%%%%%%%%%%%%%%%%%% put same time as flight    DEVELOPING = 1;
    DEVELOPING = 1;
    INTERIOR = 0;
elseif strcmp(storm_name,'gaston1')
    lonC = -39.5; latC = 14.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-39.5 14.5 1];end
    avBoxS = [NaN NaN -1];
    if JURACIC==1; lonC = 0; latC = 0; dd = 2; end
    tTH = [year month day hour minute 0];  %%%%%%%%%%%%%%%%%%%%%%%%%%%% put same time as flight    DEVELOPING = 1;
    if indcludeGaston ==1;     tTH = [2010 9 9 0 0 0]; end
    DEVELOPING = 0;
    INTERIOR = 1;
elseif strcmp(storm_name,'gaston2')
    lonC = -43; latC = 16; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-43 16 1; -39 16 -1];end
    avBoxS = [-39 16 -1];
    if JURACIC==1; lonC = 0; latC = 0; dd = 2; end
    tTH = [year month day hour minute 0];  %%%%%%%%%%%%%%%%%%%%%%%%%%%% put same time as flight    DEVELOPING = 1;
    if indcludeGaston ==1;     tTH = [2010 9 9 0 0 0]; end
    DEVELOPING = 0;
    INTERIOR = 1;
elseif strcmp(storm_name,'gaston3')
    lonC = -48; latC = 17; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-47.5 17 1; -48.5 15 1; -51.5 17.5 1;...
            -49.75 17 -1; -53 17.5 1];end
    avBoxS = [-49.75 17 -1];
    if JURACIC==1; lonC = 0; latC = 0; dd = 2; end
    tTH = [year month day hour minute 0];  %%%%%%%%%%%%%%%%%%%%%%%%%%%% put same time as flight    DEVELOPING = 1;
    if indcludeGaston ==1;     tTH = [2010 9 9 0 0 0]; end
    DEVELOPING = 0;
    INTERIOR = 0;
elseif strcmp(storm_name,'gaston4a')
    lonC = -57; latC = 17; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-57 17 1; -59 17 -1; -58.25 20 -1];end
    avBoxS = [-59 17 -1];
    if JURACIC==1; lonC = 0; latC = 0; dd = 2; end
    tTH = [year month day hour minute 0];  %%%%%%%%%%%%%%%%%%%%%%%%%%%% put same time as flight    DEVELOPING = 1;
    if indcludeGaston ==1;     tTH = [2010 9 9 0 0 0]; end
    DEVELOPING = 0;
    INTERIOR = 0;
elseif strcmp(storm_name,'gaston4')
    lonC = -55.5; latC = 16.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-55.5 16.5 1; -53.5 19.5 -1];end
    avBoxS = [-53.5 19.5 -1];
    if JURACIC==1; lonC = 0; latC = 0; dd = 2; end
    tTH = [year month day hour minute 0];  %%%%%%%%%%%%%%%%%%%%%%%%%%%% put same time as flight    DEVELOPING = 1;
    if indcludeGaston ==1;     tTH = [2010 9 9 0 0 0]; end
    DEVELOPING = 0;
    INTERIOR = 1;
elseif strcmp(storm_name,'gaston5a')
    lonC = -64; latC = 16.25; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-64 16 1; -66.75 17.5 -1];end
    avBoxS = [-66.75 17.5 -1];
    if JURACIC==1; lonC = 0; latC = 0; dd = 2; end
    tTH = [year month day hour minute 0];  %%%%%%%%%%%%%%%%%%%%%%%%%%%% put same time as flight    DEVELOPING = 1;
    if indcludeGaston ==1;     tTH = [2010 9 9 0 0 0]; end
    DEVELOPING = 0;
    INTERIOR = 0;
elseif strcmp(storm_name,'gaston5')
    lonC = -62.5; latC = 17.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-62.5 17.5 1; -66.5 17 1; -64.25 18 -1];end
    avBoxS = [-64.25 18 -1];
    if JURACIC==1; lonC = 0; latC = 0; dd = 2; end
    tTH = [year month day hour minute 0];  %%%%%%%%%%%%%%%%%%%%%%%%%%%% put same time as flight    DEVELOPING = 1;
    if indcludeGaston ==1;     tTH = [2010 9 9 0 0 0]; end
    DEVELOPING = 0;
    INTERIOR = 1;
elseif strcmp(storm_name,'karl1')
    lonC = -60.5; latC = 14; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-60.5 14.5 1; -60.5 12.5 -1];end
    avBoxS = [-60.5 12.5 -1];
    if JURACIC==1; lonC = -73; latC = 16.5; dd = 2; end
    tTH = [2010 9 16 18 0];
    DEVELOPING = -9;
    INTERIOR = 0;
elseif strcmp(storm_name,'karl2')
    lonC = -60; latC = 14.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-60 14.5 1; -60.5 12.5 -1; -57.5 13.75 -1];end
    avBoxS = [-60.5 12.5 -1];
    if JURACIC==1; lonC = -73; latC = 16.5; dd = 2; end
    tTH = [2010 9 16 18 0];
    DEVELOPING = -9;
    INTERIOR = 0;
    campaign = 'HRD';
elseif strcmp(storm_name,'karl3')
    lonC = -63.5; latC = 16.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-61 16 -1]; end
    avBoxS = [-61 16 -1];
    if JURACIC==1; lonC = -84.5; latC = 18.5; dd = 2; end
    tTH = [2010 9 16 18 0];
    DEVELOPING = -9;
    INTERIOR = 0;
    campaign = 'HRD';
elseif strcmp(storm_name,'karl4')
    lonC = -70; latC = 16; %dd = 1;
    % not correct:
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-70 16 1; -66 16.5 1; -67 18 -1; -67.5 14.5 -1]; end
    avBoxS = [-67 18 -1];
    if JURACIC==1; lonC = -94; latC = 20; dd = 2; end
    tTH = [2010 9 16 18 0];
    DEVELOPING = -9;
    INTERIOR = 0;
    campaign = 'HRD';
elseif strcmp(storm_name,'karl4a')
    lonC = -69.5; latC = 14; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-69.75 13.5 1; -70.25 15.75 -1; -73 17 -1]; end
    avBoxS = [-70.25 15.75 -1];
    if JURACIC==1; lonC = -73; latC = 16.5; dd = 2; end
    tTH = [2010 9 16 18 0];
    DEVELOPING = -9;
    INTERIOR = 0;
    campaign = 'HRD';
elseif strcmp(storm_name,'karl4b')
    lonC = -73; latC = 16; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-74.5 15 -1; -72 15.5 1]; end
    avBoxS = [-74.5 15 -1];
    if JURACIC==1; lonC = -73; latC = 16.5; dd = 2; end
    tTH = [2010 9 16 18 0];
    DEVELOPING = -9;
    INTERIOR = 0;
    campaign = 'HRD';
elseif strcmp(storm_name,'karl5a')
    lonC = -77.5; latC = 15.25; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-77.5 15.25 1; -77.5 19 -1]; end
    avBoxS = [-77.5 19 -1];
    if JURACIC==1; lonC = -73; latC = 16.5; dd = 2; end
    tTH = [2010 9 16 18 0];
    DEVELOPING = 0;
    INTERIOR = 0;
    campaign = 'HRD';
elseif strcmp(storm_name,'karl5b')
    lonC = -79.5; latC = 17.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-79.5 17.5 1; -80 15.5 -1]; end
    avBoxS = [-80 15.5 -1];
    if JURACIC==1; lonC = -73; latC = 16.5; dd = 2; end
    tTH = [2010 9 16 18 0];
    DEVELOPING = 0;
    INTERIOR = 0;
    campaign = 'HRD';
elseif strcmp(storm_name,'karl5')
    lonC = -77; latC = 15.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-77 15.5 1; -74 15.5 -1]; end
    avBoxS = [-74 15.5 -1];
    if JURACIC==1; lonC = -73; latC = 16.5; dd = 2; end
    tTH = [2010 9 16 18 0];
    DEVELOPING = -9;
    INTERIOR = 0;
    campaign = 'HRD';
elseif strcmp(storm_name,'karl6')
    lonC = -84; latC = 18; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-85 19 1; -82 19.5 -1]; end
    avBoxS = [-82 19.5 -1];
    if JURACIC==1; lonC = -84.5; latC = 18.5; dd = 2; end
    tTH = [2010 9 16 18 0];
    DEVELOPING = 1;
    INTERIOR = 0;
    campaign = 'HRD';
elseif strcmp(storm_name,'karl6a')
    lonC = -85.5; latC = 17.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-85.5 17.5 1; -82.25 18.5 1; -82.75 21 -1]; end
    avBoxS = [-82.75 21 -1];
    if JURACIC==1; lonC = -84.5; latC = 18.5; dd = 2; end
    tTH = [2010 9 16 18 0];
    DEVELOPING = 1;
    INTERIOR = 0;
    campaign = 'HRD';
elseif strcmp(storm_name,'karl7')
    lonC = -94.5; latC = 20.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-94.5 20.5 1; -91.5 23 1]; end
    avBoxS = [-92 21 -1];
    if JURACIC==1; lonC = -94; latC = 20; dd = 2; end
    tTH = [2010 9 16 18 0];
    DEVELOPING = 1;
    INTERIOR = 1;
    campaign = 'HRD';
elseif strcmp(storm_name,'matthew1') && year==2010 %%%%%%%%%%%%%%%%% never made hurricane strength
    lonC = -53.5; latC = 12; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-53.5 12 1; -56.5 11 -1]; end
    avBoxS = [-56.5 11 -1];
    if JURACIC==1; lonC = -77; latC = 14; dd = 2; end
    tTH = [year month day hour minute 0];  %%%%%%%%%%%%%%%%%%%%%%%%%%%% put same time as flight    DEVELOPING = 1;
    %tTH = [2010 9 26 18 0];
    DEVELOPING = -9;
    INTERIOR = 0;
    campaign = 'PREDICT';
elseif strcmp(storm_name,'matthew2')
    lonC = -57.25; latC = 12.25; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-57.25 12.25 1; -60 11.5 -1]; end
    avBoxS = [-60 11.5 -1];
    if JURACIC==1; lonC = -77; latC = 14; dd = 2; end
    tTH = [year month day hour minute 0];  %%%%%%%%%%%%%%%%%%%%%%%%%%%% put same time as flight    DEVELOPING = 1;
    %tTH = [2010 9 26 18 0];
    DEVELOPING = -9;
    INTERIOR = 0;
    campaign = 'PREDICT';
elseif strcmp(storm_name,'matthew2a')
    lonC = -65; latC = 15; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-65 15.5 1; -66 14 -1]; end
    avBoxS = [-66 14 -1];
    if JURACIC==1; lonC = -77; latC = 14; dd = 2; end
    tTH = [year month day hour minute 0];  %%%%%%%%%%%%%%%%%%%%%%%%%%%% put same time as flight    DEVELOPING = 1;
    %tTH = [2010 9 26 18 0];
    DEVELOPING = -9;
    INTERIOR = 0;
    campaign = 'GRIP';
elseif strcmp(storm_name,'matthew3')
    lonC = -69; latC = 15.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-68.5 15.5 1; -71 13.5 -1]; end
    avBoxS = [-71 13.5 -1];
    if JURACIC==1; lonC = -77; latC = 14; dd = 2; end
    tTH = [year month day hour minute 0];  %%%%%%%%%%%%%%%%%%%%%%%%%%%% put same time as flight    DEVELOPING = 1;
    %tTH = [2010 9 26 18 0];
    DEVELOPING = -9;
    INTERIOR = 0;
    campaign = 'PREDICT';
elseif strcmp(storm_name,'matthew3a')
    lonC = -69; latC = 14; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-69 14 1; -71.75 14 -1]; end
    avBoxS = [-71.75 14 -1];
    if JURACIC==1; lonC = -77; latC = 14; dd = 2; end
    tTH = [year month day hour minute 0];  %%%%%%%%%%%%%%%%%%%%%%%%%%%% put same time as flight    DEVELOPING = 1;
    %tTH = [2010 9 26 18 0];
    DEVELOPING = -9;
    INTERIOR = 1;
    campaign = 'GRIP';
elseif strcmp(storm_name,'matthew4')
    lonC = -82; latC = 17; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-82 17 1; -79 13.5 1; -82 14 -1]; end
    avBoxS = [-82 14 -1];
    if JURACIC==1; lonC = -77; latC = 14; dd = 2; end
    tTH = [year month day hour minute 0];  %%%%%%%%%%%%%%%%%%%%%%%%%%%% put same time as flight    DEVELOPING = 1;
    %tTH = [2010 9 26 18 0];
    DEVELOPING = 1;
    INTERIOR = 0;
    campaign = 'PREDICT';
elseif strcmp(storm_name,'matthew4a')
    lonC = -76.75; latC = 14.25; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-76.75 14.25 1; -78.5 13 -1; -75 15 -1]; end
    avBoxS = [-75 15 -1];
    if JURACIC==1; lonC = -77; latC = 14; dd = 2; end
    tTH = [year month day hour minute 0];  %%%%%%%%%%%%%%%%%%%%%%%%%%%% put same time as flight    DEVELOPING = 1;
    %tTH = [2010 9 26 18 0];
    DEVELOPING = 0;
    INTERIOR = 1;
    campaign = 'GRIP';
elseif strcmp(storm_name,'nicole1')  && year==2010
    lonC = -83; latC = 17.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-83 17.5 1; -81 17.5 -1; -83.5 20 -1]; end
    avBoxS = [-81 17.5 -1];
    if JURACIC==1; lonC = -77; latC = 14; dd = 2; end
    tTH = [year month day hour minute 0];  %%%%%%%%%%%%%%%%%%%%%%%%%%%% put same time as flight    DEVELOPING = 1;
    DEVELOPING = -9;
    INTERIOR = 1;
    campaign = 'PREDICT';
elseif strcmp(storm_name,'nicole2')  && year==2010
    lonC = -86; latC = 17; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-86 17 1; -80.5 18 1]; end
    avBoxS = [NaN NaN -1];
    if JURACIC==1; lonC = -77; latC = 14; dd = 2; end
    tTH = [year month day hour minute 0];  %%%%%%%%%%%%%%%%%%%%%%%%%%%% put same time as flight    DEVELOPING = 1;
    DEVELOPING = 0;
    INTERIOR = 0;
    campaign = 'PREDICT';
elseif strcmp(storm_name,'PGI027-1')
    lonC = -66; latC = 15; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-66 15 1; -68.5 14.25 -1]; end
    avBoxS = [-68.5 14.25 -1];
    if JURACIC==1; lonC = -77; latC = 14; dd = 2; end
    tTH = [year month day hour minute 0];  %%%%%%%%%%%%%%%%%%%%%%%%%%%% put same time as flight    DEVELOPING = 1;
    DEVELOPING = -9;
    INTERIOR = 1;
    campaign = 'PREDICT';
elseif strcmp(storm_name,'PGI027-2')
    lonC = -75; latC = 17; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-75 17 1; -79 17 -1]; end
    avBoxS = [-79 17 -1];
    if JURACIC==1; lonC = -77; latC = 14; dd = 2; end
    tTH = [year month day hour minute 0];  %%%%%%%%%%%%%%%%%%%%%%%%%%%% put same time as flight    DEVELOPING = 1;
    DEVELOPING = -9;
    INTERIOR = 1;
    campaign = 'PREDICT';
elseif strcmp(storm_name,'PGI030-1')
    lonC = -47; latC = 19; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-47 19 1; -50 21 -1]; end
    avBoxS = [-50 21 -1];
    if JURACIC==1; lonC = -77; latC = 14; dd = 2; end
    tTH = [year month day hour minute 0];  %%%%%%%%%%%%%%%%%%%%%%%%%%%% put same time as flight    DEVELOPING = 1;
    DEVELOPING = 9;
    INTERIOR = 1;
    campaign = 'PREDICT';
elseif strcmp(storm_name,'PGI030-2')
    lonC = -65; latC = 20; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-65 20 1; -64.5 22 -1]; end
    avBoxS = [-64.5 22 -1];
    if JURACIC==1; lonC = -77; latC = 14; dd = 2; end
    tTH = [year month day hour minute 0];  %%%%%%%%%%%%%%%%%%%%%%%%%%%% put same time as flight    DEVELOPING = 1;
    DEVELOPING = -9;
    INTERIOR = 0;
    campaign = 'PREDICT';
elseif strcmp(storm_name,'PGI048-050')
    lonC = -53; latC = 11.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-53.25 11.5 1; -54.5 14.25 -1]; end
    avBoxS = [-54.5 14.25 -1];
    if JURACIC==1; lonC = -77; latC = 14; dd = 2; end
    tTH = [year month day hour minute 0];  %%%%%%%%%%%%%%%%%%%%%%%%%%%% put same time as flight    DEVELOPING = 1;
    DEVELOPING = -9;
    INTERIOR = 1;
    campaign = 'PREDICT';
elseif strcmp(storm_name,'gabrielle1')
    lonC = -45; latC = 14.75; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-45 14.75 1; ...
            -49 14.5 -1; -42 14.75 -1]; end
    avBoxS = [-42 14.75 -1];
    if JURACIC==1; lonC = -46; latC = 15; dd = 2; end
    tTH = [2013 9 13 12 0 ];
    DEVELOPING = -9;
    INTERIOR = 1;
    campaign = 'HS3';
elseif strcmp(storm_name,'gabrielle2')
    lonC = -65.25; latC = 20; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-64 20 1; -66 18.5 -1]; end
    avBoxS = [-66 18.5 -1];
    if JURACIC==1; lonC = -66; latC = 17.5; dd = 2; end
    tTH = [2013 9 13 12 0 ];
    DEVELOPING = -1;
    INTERIOR = 1;
    campaign = 'HS3';
elseif strcmp(storm_name,'gabrielle3')
    lonC = -66; latC = 22.75; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-66 22.75 1]; end
    avBoxS = [-65 20.5 -1];
    if JURACIC==1; lonC = -68; latC = 23; dd = 2; end
    tTH = [2013 9 13 12 0 ];
    DEVELOPING = 0;
    INTERIOR = 1;
    campaign = 'HS3';
elseif strcmp(storm_name,'humberto1')
    lonC = -41.5; latC = 28; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-41.5 28 1; -41.75 32 1; -46 29.75 -1]; end
    avBoxS = [-46 29.75 -1];
    if JURACIC==1; lonC = -43; latC = 27.5; dd = 2; end
    tTH = [2013 9 11 12 0];
    DEVELOPING = 0;
    INTERIOR = 1;
    campaign = 'HS3';
elseif strcmp(storm_name,'I95L')
    lonC = -93.25; latC = 20.25; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-93.25 20.25 1; -95 22.75 -1]; end
    avBoxS = [-95 22.75 -1];
    if JURACIC==1; lonC = -95; latC = 21; dd = 2; end
    tTH = [year month day hour minute 0];
    DEVELOPING = -9;
    INTERIOR = 1;
    campaign = 'HS3';
elseif strcmp(storm_name,'cristobal1')
    lonC = -72; latC = 31; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-72 31 1; -68 34 1; -70.5 29 -1]; end
    avBoxS = [-70.5 29 -1];
    if JURACIC==1; lonC = -71.5; latC = 30; dd = 2; end
    tTH = [2014 8 26 0 0];
    DEVELOPING = 0;
    INTERIOR = 1;
    campaign = 'HS3';
elseif strcmp(storm_name,'edouard1')
    lonC = -41.5; latC = 18.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-41.5 18.5 1]; end
    avBoxS = [-39.5 18.5 -1];
    if JURACIC==1; lonC = -42.5; latC = 18; dd = 2; end
    tTH = [2014 9 14 12 0];
    DEVELOPING = 1;
    INTERIOR = 1;
    campaign = 'HS3';
elseif strcmp(storm_name,'edouard2')
    lonC = -52; latC = 25; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-52 25 1]; end
    avBoxS = [NaN NaN -1];
    %    avBox = [-52 25 1; -51.5 29 -1]; removed stratiform case becaseu it had anomlaous low sat frac
    if JURACIC==1; lonC = -53; latC = 25.5; dd = 2; end
    tTH = [2014 9 14 12 0];
    DEVELOPING = 1;
    INTERIOR = 1;
    campaign = 'HS3';
elseif strcmp(storm_name,'edouard3')
    lonC = -57; latC = 32.75; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-57 32.75 1; -57 35 -1; -54.5 32 -1; -58.5 29.5 -1; ]; end
    avBoxS = [-57 35 -1];
    if JURACIC==1; lonC = -57; latC = 33; dd = 2; end
    tTH = [2014 9 14 12 0];
    DEVELOPING = -1;
    INTERIOR = 1;
    campaign = 'HS3';
elseif strcmp(storm_name,'edouard4')
    lonC = -38.25; latC = 39.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-38.25 39.5 1; -36.5 41.75 1; -41.5 39 -1; -35 38 -1; -40 42.5 -1]; end
    avBoxS = [-41.5 39 -1];
    if JURACIC==1; lonC = -40; latC = 39.5; dd = 2; end
    tTH = [2014 9 14 12 0];
    DEVELOPING = -1;
    INTERIOR = 1;
    campaign = 'HS3';
elseif strcmp(storm_name,'I90L')
    lonC = -26.5; latC = 13.75; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-26.5 13.75 1; -29.5 12 -1; -28.5 16.5 -1]; end
    avBoxS = [NaN NaN -1];
    if JURACIC==1; lonC = -28; latC = 15; dd = 2; end
    tTH = [year month day hour minute 0];
    DEVELOPING = -9;
    INTERIOR = 1;
    campaign = 'HS3';
elseif strcmp(storm_name,'delta1')
    lonC = -85; latC = 19; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-85 19 1; -85 17 -1]; end
    avBoxS = [-85 17 -1];
    if JURACIC==1; lonC = -84.5; latC = 19.5; dd = 2; end
    tTH = [2020 10 6 0 0];
    DEVELOPING = -1;
    INTERIOR = 1;
    campaign = 'TCRI';
elseif strcmp(storm_name,'delta2')
    lonC = -86.5; latC = 21.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-86.5 21.5 1]; end
    avBoxS = [NaN NaN -1];
    avBoxS = [-88.5 21.5 -1];
    if JURACIC==1; lonC = -87; latC = 21; dd = 2; end
    tTH = [2020 10 6 0 0];
    DEVELOPING = -1;
    INTERIOR = 1;
    campaign = 'TCRI';
elseif strcmp(storm_name,'delta3')
    lonC = -89.5; latC = 22.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-89.5 22.5 1; -93 25 -1]; end
    avBoxS = [-93 25 -1];
    if JURACIC==1; lonC = -90; latC = 23; dd = 2; end
    tTH = [2020 10 6 0 0];
    DEVELOPING = 1;
    INTERIOR =0;
    campaign = 'TCRI';
elseif strcmp(storm_name,'delta4')
    lonC = -92; latC = 23.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-92 23.5 1; -92 26.5 -1]; end
    avBoxS = [-92 26.5 -1];
    if JURACIC==1; lonC = -92.5; latC = 24; dd = 2; end
    tTH = [2020 10 6 0 0];
    DEVELOPING = 1;
    campaign = 'TCRI';
elseif strcmp(storm_name,'eta1')
    lonC = -83.5; latC = 18.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-83.5 18.5 1; -85 23.5 -1; -87 24 -1]; end
    avBoxS = [-85 23.5 -1];
    if JURACIC==1; lonC = -83; latC = 19; dd = 2; end
    tTH = [2020 11 11 12 0];
    DEVELOPING = 1;
    INTERIOR = 1;
    campaign = 'TCRI';
elseif strcmp(storm_name,'eta3')
    lonC = -86; latC = 26.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-86 26.5 1]; end
    avBoxS = [NaN NaN -1];
    if JURACIC==1; lonC = -85; latC = 24; dd = 2; end
    tTH = [2020 11 11 12 0];
    DEVELOPING = 1;
    INTERIOR = 1;
    campaign = 'TCRI';
elseif strcmp(storm_name,'laura5')
    lonC = -85.5; latC = 22.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-85.5 22.5 1; -89 23.5 -1]; end
    avBoxS = [-89 23.5 -1];
    if JURACIC==1; lonC = -86; latC = 24; dd = 2; end
    tTH = [2020 8 25 12 0 ];
    DEVELOPING = 1;
    INTERIOR = 1;
    campaign = 'TCRI';
elseif strcmp(storm_name,'laura6')
    lonC = -87; latC = 23.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-87 23 1; -90.5 24.5 -1; -87.5 26.5 -1]; end
    avBoxS = [-90.5 24.5 -1];
    if JURACIC==1; lonC = -89; latC = 24.5; dd = 2; end
    tTH = [2020 8 25 12 0 ];
    DEVELOPING = 1;
    INTERIOR = 0;
    campaign = 'TCRI';
elseif strcmp(storm_name,'marco2')
    lonC = -86; latC = 23.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-86 23.5 1; -89 24 -1; -85 26 -1]; end
    avBoxS = [-89 24 -1];
    if JURACIC==1; lonC = -87; latC = 24; dd = 2; end
    tTH = [2020 8 23 12 0];
    DEVELOPING = -1;
    INTERIOR = 1;
    campaign = 'TCRI';
elseif strcmp(storm_name,'sally1')
    lonC = -84.5; latC = 27.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-84.5 27.5 1; -87 29 -1; -88 27 -1]; end
    avBoxS = [-87 29 -1];
    if JURACIC==1; lonC = -86; latC = 27.5; dd = 2; end
    tTH = [2020 9 14 12 0];
    DEVELOPING = 0;
    INTERIOR = 1;
    campaign = 'TCRI';
elseif strcmp(storm_name,'sally2')
    lonC = -85.5; latC = 28; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-85.5 28 1; -88.5 28.5 -1; -89.5 27.25 -1]; end
    avBoxS = [-88.5 28.5 -1];
    if JURACIC==1; lonC = -87; latC = 28.5; dd = 2; end
    tTH = [2020 9 14 12 0];
    DEVELOPING = 1;
    INTERIOR = 0;
    campaign = 'TCRI';
elseif strcmp(storm_name,'sally3')
    lonC = -86; latC = 28.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-86 28.5 1; -87.5 25.75 -1]; end
    avBoxS = [-87.5 25.75 -1];
    if JURACIC==1; lonC = -87; latC = 27; dd = 2; end
    tTH = [2020 9 14 12 0];
    DEVELOPING = 0;
    INTERIOR = 0;
    campaign = 'TCRI';
elseif strcmp(storm_name,'zeta1')
    lonC = -85; latC = 18; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-85 18 1; -82.75 17.25 1; -82.5 20.25 -1]; end
    avBoxS = [-82.5 20.25 -1];
    if JURACIC==1; lonC = -82; latC = 19; dd = 2; end
    tTH = [2020 10 26 6 0 ];
    DEVELOPING = 1;
    INTERIOR = 1;
    campaign = 'TCRI';
elseif strcmp(storm_name,'zeta2')
    lonC = -85; latC = 17.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-85 17.5 1; -85 21 -1]; end
    avBoxS = [-85 21 -1];
    if JURACIC==1; lonC = -84.5; latC = 19; dd = 2; end
    tTH = [2020 10 26 6 0 ];
    DEVELOPING = 1;
    campaign = 'TCRI';
elseif strcmp(storm_name,'zeta3')
    lonC = -86; latC = 19; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-85.5 20.75 -1; -84 19 -1]; end
    avBoxS = [-85.5 20.75 -1];
    if JURACIC==1; lonC = -86; latC = 21; dd = 2; end
    tTH = [2020 10 26 6 0];
    DEVELOPING = -1;
    campaign = 'TCRI';
elseif strcmp(storm_name,'grace1')
    lonC = -61.25; latC = 17; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-61.25 17 1; -60 14 1]; end
    avBoxS = [-60 14 -1];
    if JURACIC==1; lonC = -61; latC = 17; dd = 2; end
    tTH = [2021 8 18 12 0];
    DEVELOPING = 0;
    campaign = 'TCRI';
elseif strcmp(storm_name,'grace2')
    lonC = -67; latC = 15.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-67 16 1; -64.5 19.5 -1]; end
    avBoxS = [-64.5 19.5 -1];
    if JURACIC==1; lonC = -66; latC = 17.5; dd = 2; end
    tTH = [2021 8 18 12 0];
    DEVELOPING = 0;
    campaign = 'TCRI';
elseif strcmp(storm_name,'grace3')
    lonC = -83; latC = 19.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-83 19.25 1; -85.5 20 -1]; end
    avBoxS = [-85.5 20 -1];
    if JURACIC==1; lonC = -84.5; latC = 20; dd = 2; end
    tTH = [2021 8 18 12 0];
    DEVELOPING = 0;
    campaign = 'TCRI';
elseif strcmp(storm_name,'henri1')
    lonC = -72.5; latC = 29; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-72.5 29 1; -70 27.5 -1]; end
    avBoxS = [-70 27.5 -1];
    if JURACIC==1; lonC = -72; latC = 29.5; dd = 2; end
    tTH = [2021 8 21 12 0];
    DEVELOPING = 0;
    campaign = 'TCRI';
elseif strcmp(storm_name,'henri2')
    lonC = -73.5; latC = 29.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-73.75 29.5 1; -71 31 -1]; end
    avBoxS = [-71 31 -1];
    if JURACIC==1; lonC = -73; latC = 30; dd = 2; end
    tTH = [2021 8 21 12 0];
    DEVELOPING = 1;
    campaign = 'TCRI';
elseif strcmp(storm_name,'henri3')
    lonC = -74.25; latC = 30.25; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-74.25 30.25 1; -72 31 -1]; end
    avBoxS = [-72 31 -1];
    if JURACIC==1; lonC = -73.5; latC = 31; dd = 2; end
    tTH = [2021 8 21 12 0];
    DEVELOPING = 0;
    campaign = 'TCRI';
elseif strcmp(storm_name,'henri4')
    lonC = -72.5; latC = 32.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-72.5 32.5 1; -70 33 -1]; end
    avBoxS = [-70 33 -1];
    if JURACIC==1; lonC = -72.5; latC = 34; dd = 2; end
    tTH = [2021 8 21 12 0];
    DEVELOPING = 0;
    campaign = 'TCRI';
elseif strcmp(storm_name,'ida1')
    lonC = -80; latC = 20; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-80 20 1; -82.25 22.25 -1; -76.5 25.5 -1]; end
    avBoxS = [-83 19 -1];
    if JURACIC==1; lonC = -82; latC = 21; dd = 2; end
    tTH = [2021 8 27 18 0 ];
    DEVELOPING = 1;
    campaign = 'TCRI';
elseif strcmp(storm_name,'ida2')
    lonC = -83; latC = 22; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-83 22 1; -86 25 1; -86 22 -1]; end
    avBoxS = [-86 22 -1];
    if JURACIC==1; lonC = -84; latC = 22; dd = 2; end
    tTH = [2021 8 27 18 0 ];
    DEVELOPING = 0;
    campaign = 'TCRI';
elseif strcmp(storm_name,'ida3')
    lonC = -85; latC = 24.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-85 25 1; -85 27 -1; -89 24 -1]; end
    avBoxS = [-89 24 -1];
    if JURACIC==1; lonC = -83; latC = 25; dd = 2; end
    tTH = [2021 8 27 18 0 ];
    DEVELOPING = 1;
    campaign = 'TCRI';
elseif strcmp(storm_name,'larry3')
    lonC = -55.5; latC = 24.25; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-55.5 24.25 1; -58 26 -1]; end
    avBoxS = [-58 26 -1];
    if JURACIC==1; lonC = -56; latC = 25.5; dd = 2; end
    tTH = [2021 9 2 6 0];
    DEVELOPING = 0;
    campaign = 'TCRI';
elseif strcmp(storm_name,'sam1')
    lonC = -48; latC = 13; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-48 13 1; -47 15 -1]; end
    avBoxS = [ -47 15 -1];
    if JURACIC==1; lonC = -48.5; latC = 13; dd = 2; end
    tTH = [2021 9 24 6 0];
    DEVELOPING = 0;
    campaign = 'TCRI';
elseif strcmp(storm_name,'sam2')
    lonC = -49.75; latC = 14; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-49.75 14 1; -49.75 17 -1]; end
    avBoxS = [-49.75 17 -1];
    if JURACIC==1; lonC = -51; latC = 14; dd = 2; end
    tTH = [2021 9 24 6 0];
    DEVELOPING = -1;
    campaign = 'TCRI';
elseif strcmp(storm_name,'sam3')
    lonC = -51; latC = 16; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-51 16 1; -53 14 -1; -55 17 -1; -52 19 -1]; end
    avBoxS = [-53 14 -1];
    if JURACIC==1; lonC = -53; latC = 16; dd = 2; end
    tTH = [2021 9 24 6 0];
    DEVELOPING = 1;
    campaign = 'TCRI';
elseif strcmp(storm_name,'earl1')
    lonC = -44; latC = 16; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-44 16 1; -46.5 14 1; -44 13 -1; -47 16.5 -1]; end
    avBoxS = [-47 16.5 -1];
    if JURACIC==1; lonC = -45; latC = 15; dd = 2; end
    tTH = [2022 9 6 18 0];
    DEVELOPING = -9;
    campaign = 'TCRI';
elseif strcmp(storm_name,'earl2')
    lonC = -48.5; latC = 15; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-48.5 15 1; -50.5 17.5 -1]; end
    avBoxS = [-50.5 17.5 -1];
    if JURACIC==1; lonC = -54; latC = 17; dd = 2; end
    tTH = [2022 9 6 18 0];
    DEVELOPING = -9;
    campaign = 'TCRI';
elseif strcmp(storm_name,'earl3')
    lonC = -59.5; latC = 17; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-59.5 17 1; -58.5 18 1]; end
    avBoxS = [NaN NaN -1];
    if JURACIC==1; lonC = -59; latC = 18; dd = 2; end
    tTH = [2022 9 6 18 0];
    DEVELOPING = -9;
    campaign = 'TCRI';
elseif strcmp(storm_name,'ian2')
    lonC = -78.5; latC = 14.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-78.5 14.5 1; -78 17 1; -81.5 14 -1]; end
    avBoxS = [-81.5 14 -1];
    if JURACIC==1; lonC = -79; latC = 14.5; dd = 2; end
    tTH = [2022 9 26 6 0];
    DEVELOPING = 0;
    campaign = 'TCRI';
elseif strcmp(storm_name,'ian3')
    lonC = -81; latC = 17.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-81 17.5 1; -78.5 15 -1]; end
    avBoxS = [-78.5 15 -1];
    if JURACIC==1; lonC = -81; latC = 16; dd = 2; end
    tTH = [2022 9 26 6 0];
    DEVELOPING = 1;
    campaign = 'TCRI';
elseif strcmp(storm_name,'ian4')
    lonC = -82; latC = 18.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-82 18.5 1; -85 18.5 -1; -79 16.5 -1]; end
    avBoxS = [-79 16.5 -1];
    if JURACIC==1; lonC = -82; latC = 17.5; dd = 2; end
    tTH = [2022 9 26 6 0];
    DEVELOPING = 1;
    campaign = 'TCRI';
elseif strcmp(storm_name,'ian5')
    lonC = -82.5; latC = 20.5; %dd = 1;
    %lonC = -82; latC = 20.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-82 20.75 1; -82.75 18 -1; -85 21.5 -1]; end
    avBoxS = [-84.5 21.5 -1];
    if JURACIC==1; lonC = -83.5; latC = 20; dd = 2; end
    tTH = [2022 9 26 6 0];
    DEVELOPING = 1;
    campaign = 'TCRI';
elseif strcmp(storm_name,'ian6')
    lonC = -84.25; latC = 21.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-84.25 21.5 1; -82 21 -1]; end
    avBoxS = [-82 21 -1];
    if JURACIC==1; lonC = -84; latC = 22; dd = 2; end
    tTH = [2022 9 26 6 0];
    DEVELOPING = 0;
    campaign = 'TCRI';
elseif strcmp(storm_name,'ITOFS_East')
    lonC = -36; latC = 11.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-36 11.25 1; -36 13.75 -1]; end
    avBoxS = [-36 13.75 -1];
    if JURACIC==1; lonC = -35; latC = 12; dd = 2; end
    tTH = [year month day hour minute 0];  %%%%%%%%%%%%%%%%%%%%%%%%%%%% put same time as flight
    DEVELOPING = -9;
    campaign = 'TCRI';
elseif strcmp(storm_name,'nicole2') && year==2022
    lonC = -72; latC = 28; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-72 28.5 1; -75.25 28.25  -1]; end
    avBoxS = [ -75.25 28.25 -1];
    if JURACIC==1; lonC = -74; latC = 27.5; dd = 2; end
    tTH = [2022 11 9 23 0 ];
    DEVELOPING = 1;
    campaign = 'TCRI';
    
    
    
elseif strcmp(storm_name,'nicole3') && year==2022
    lonC = -75.5; latC = 27; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-75.5 27.5 1; -77.5 23.5 -1]; end
    avBoxS = [-77.5 23.5 -1];
    if JURACIC==1; lonC = -76.5; latC = 26; dd = 2; end
    tTH = [2022 11 9 23 0 ];
    DEVELOPING = 1;
    campaign = 'TCRI';
elseif strcmp(storm_name,'franklin0')
    lonC = -70; latC = 14.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-70 15 1; -72 16 -1]; end
    avBoxS = [-72 16 -1];
    if JURACIC==1; lonC = -70.5; latC = 15.5; dd = 2; end
    tTH = [2023 08 26 15 00];
    DEVELOPING = 0;
    campaign = 'HRD';
elseif strcmp(storm_name,'franklin1')
    lonC = -67; latC = 24; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-67 24 1]; end
    avBoxS = [NaN NaN -1];
    if JURACIC==1; lonC = -67; latC = 23.25; dd = 2; end
    tTH = [2023 08 26 15 0];
    DEVELOPING = 1;
    campaign = 'HRD';
elseif strcmp(storm_name,'idalia3')
    lonC = -85.5; latC = 20; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-85.5 20 1; -83.5 21.5 -1]; end
    avBoxS = [-83.5 21.5 -1];
    if JURACIC==1; lonC = -85; latC = 21; dd = 2; end
    tTH = [2023 08 29 09 0];
    DEVELOPING = 1;
    campaign = 'HRD';
elseif strcmp(storm_name,'lee02')
    lonC = -62.5; latC = 23; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-62.5 23 1; -61.5 21 -1; -65.5 24 -1]; end
    avBoxS = [-61.5 21 -1];
    if JURACIC==1; lonC = -63.5; latC = 23; dd = 2; end
    tTH = [2023 09 06 21 0];
    DEVELOPING = 0;
    campaign = 'HRD';
elseif strcmp(storm_name,'lee04')
    lonC = -64.5; latC = 24; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-64.5 24 1; -65 27 -1]; end
    avBoxS = [-65 27 -1];
    if JURACIC==1; lonC = -65.5; latC = 24.5; dd = 2; end
    tTH = [2023 09 06 21 0];
    DEVELOPING = 0;
    campaign = 'HRD';
elseif strcmp(storm_name,'lee05')
    lonC = -66.5; latC = 25; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-66.5 25 1; -69 26 -1]; end
    avBoxS = [-69 26 -1];
    if JURACIC==1; lonC = -66.5; latC = 25; dd = 2; end
    tTH = [2023 09 06 21 0];
    DEVELOPING = 0;
    campaign = 'HRD';
elseif strcmp(storm_name,'lee06')
    lonC = -66.5; latC = 25.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-66.5 25.5 1; -70 26 -1]; end
    avBoxS = [-70 26 -1];
    if JURACIC==1; lonC = -67; latC = 25.5; dd = 2; end
    tTH = [2023 09 06 21 0];
    DEVELOPING = 0;
    campaign = 'HRD';
elseif strcmp(storm_name,'lee07')
    lonC = -67.25; latC = 26.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-67.25 26.5 1]; end
    avBoxS = [-65 26 -1];
    if JURACIC==1; lonC = -67.5; latC = 27.5; dd = 2; end
    tTH = [2023 09 06 21 0];
    DEVELOPING = -1;
    campaign = 'HRD';
elseif strcmp(storm_name,'lee08')
    lonC = -68; latC = 32; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-68 32 1; -66.5 29 1]; end
    avBoxS = [NaN NaN -1];
    if JURACIC==1; lonC = -68; latC = 29.5; dd = 2; end
    tTH = [2023 09 06 21 0];
    DEVELOPING = -1;
    campaign = 'HRD';
elseif strcmp(storm_name,'lee09')
    lonC = -68.5; latC = 31.5; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-68.5 31.5 1; -68.5 29 -1; -71 32 -1]; end
    avBoxS = [-68.5 29 -1];
    if JURACIC==1; lonC = -68; latC = 31.75; dd = 2; end
    tTH = [2023 09 06 21 0];
    DEVELOPING = -1;
    campaign = 'HRD';
elseif strcmp(storm_name,'lee10')
    lonC = -68.5; latC = 37; %dd = 1;
    if SINGLE_AVERAGE == 1; avBox = [lonC latC 1]; else
        avBox = [-68.5 37 1; -65 33 -1; -70 34 -1]; end
    avBoxS = [-65 33 -1];
    if JURACIC==1; lonC = -67.25; latC = 34.75; dd = 2; end
    tTH = [2023 09 06 21 0];
    DEVELOPING = -1;
    campaign = 'HRD';
end

if STRATI_SINGLE_AVERAGE ==1
    disp('stratiform region average')
    avBox = avBoxS;
end


% datevec for case
d = [year month day hour minute 0];
% day of year calculation
day_of_year = datenum([d(1:3), 0, 0, 0]) - datenum([d(1), 1, zeros(1, 4)]);
% fractional case day of year
time = day_of_year + hour/24 + minute/1440;
timeRounded = round(time*4)/4;    % round to the nearest 0.25

% day of year for the transition from storm to hurricane
day_of_yearTH = datenum([tTH(1:3), 0, 0, 0]) - datenum([tTH(1), 1, zeros(1, 4)]);
% fractional transition day of year
timeTH = day_of_yearTH + tTH(4)/24 + tTH(4)/1440;

% time relativee to transition
timeR = time - timeTH;
if tTH(1) == year && tTH(2) == month && tTH(3) == day && tTH(4) == hour && tTH(5) == minute
    timeR = NaN;
end

% get name without numbers:
yearStr = num2str(year);
%%%%%  get the NHC report and wind speed at time of flight, also wind speed
%%%%%  at 6 hr, 12 hr and 24 hr from time
numberLocation = find(double(storm_name) < 64);
if strcmp(storm_name,'ITOFS_East')
    stormName0 = storm_name;
else
    stormName0 = storm_name(1:numberLocation(1)-1);
end
nameOut = upper(stormName0);
reportName = ['REPORT_' yearStr(3:4) '_' nameOut '.txt'];
% check if file exists, otherwise, make NaNs
if isfile(reportName)
    dataReport = load(reportName);
    N = size(dataReport,1);
    day_of_yearReport = datenum([dataReport(:,1:3), zeros(N,1), zeros(N,1), zeros(N,1)]) -...
        datenum([dataReport(:,1), ones(N,1), zeros(N,1), zeros(N,1), zeros(N,1), zeros(N,1)]);
    timeReport = day_of_yearReport + dataReport(:,4)/24 + dataReport(:,5)/1440;
    % get wind from report
    if year==2023
        windReport = dataReport(:,8)*0.5144444; % kt to m/s
    else
        windReport = dataReport(:,8); % in m/s
    end
    pressureReport = dataReport(:,9); % in hPa
    latReport = dataReport(:,6); % in degrees
    lonReport = dataReport(:,7); % in degrees
    lat00 = interp1(timeReport,latReport,time);
    lon00 = interp1(timeReport,lonReport,time);
    pressure00 = interp1(timeReport,pressureReport,time);
    wind00 = interp1(timeReport,windReport,time);
    wind06 = interp1(timeReport,windReport,time+0.25);
    wind12 = interp1(timeReport,windReport,time+0.5);
    wind24 = interp1(timeReport,windReport,time+1);
    BT_lonCenter = lon00;
    BT_latCenter = lat00;
    BT_pressureCenter = pressure00;
    BT_vmax = [wind00 wind06 wind12 wind24] * 1.943844;  % m/s converted to knots
    BT_dvmax = [wind00-wind00 wind06-wind00 wind12-wind00 wind24-wind00] * 1.943844; % m/s converted to knots relative to flight
else
    BT_vmax = [NaN NaN NaN NaN];
    BT_dvmax = [NaN NaN NaN NaN];
    BT_lonCenter = NaN;
    BT_latCenter = NaN;
    BT_pressureCenter = NaN;
end
% get SHEAR from SHIPS data
%nameOut = same as for REPORT ;
reportName = ['SHIPS_' yearStr(3:4) '_' nameOut '.asc'];
if isfile(reportName)
    dataReport = load(reportName);
    N = size(dataReport,1);
    day_of_yearReport = datenum([dataReport(:,1:3), zeros(N,1), zeros(N,1), zeros(N,1)]) -...
        datenum([dataReport(:,1), ones(N,1), zeros(N,1), zeros(N,1), zeros(N,1), zeros(N,1)]);
    timeReport = day_of_yearReport + dataReport(:,4)/24;
    % get shear from report
    shipsShear = dataReport(:,5); % in kt
    shear00 = interp1(timeReport,shipsShear,time);
    SHIPS_shear = shear00;  % units: knots
else
    SHIPS_shear = NaN;
end

% get location of vortex center via absvorticity
[row, col] = find(squeeze(absvort(11,:,:))==max(max(squeeze(absvort(11,:,:)))),3);
VORT_lonCenter = lon(col);
VORT_latCenter = lat(row);

%disp([BT_lonCenter BT_latCenter])
%disp([VORT_lonCenter VORT_latCenter])

if SINGLE_AVERAGE ~= 1
    if isnan(BT_lonCenter) || isnan(BT_latCenter)
        avBox = [avBox; VORT_lonCenter VORT_latCenter 13];
    else
        avBox = [avBox; BT_lonCenter BT_latCenter 12; VORT_lonCenter VORT_latCenter 13];
    end
end
% distance of convective regon to center of circulation
distanceCenter = sqrt( (VORT_lonCenter-lonC)^2 + (VORT_latCenter-latC)^2 );

rhoR = (pres*100) ./ (287*(temp +273.14));
TREF = 300;
a = 111.2; % degree  in kilometers
L = 2.5e6;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% get srcmr and other gms fields
entz1 = (ent(3:end,:,:) - ent(1:end-2,:,:)) / (z(3)-z(1));
mrz1 = (mr(3:end,:,:) - mr(1:end-2,:,:)) / (z(3)-z(1));
entz = NaN(size(ent));  mrz = NaN(size(ent));
entz(2:end-1,:,:) = entz1;
mrz(2:end-1,:,:) = mrz1;
[entx, enty] = cdfgradlonlat(ent,lon,lat);
[mrx, mry] = cdfgradlonlat(mr,lon,lat);
srcent_h0 = (u .* entx + v .* enty) * TREF .* rhoR;
srcent_v0 = (w .* entz) * TREF .* rhoR;
srcmr_h0 = (u .* mrx + v .* mry) * -0.001 * L .* rhoR;
srcmr_v0 = (w .* mrz) * -0.001 * L .* rhoR;
srcent_h = trapz(z,srcent_h0,1);
srcent_v = trapz(z(2:end-1),srcent_v0(2:end-1,:,:),1);
srcmr_h = trapz(z,srcmr_h0,1);
srcmr_v = trapz(z(2:end-1),srcmr_v0(2:end-1,:,:),1);
srcent = squeeze(srcent_h + srcent_v);
srcmr = squeeze(srcmr_h + srcmr_v);
srcmr3D = srcmr_v0;
srcmr3D = loadvar( [num2str(year) '_' storm_name '.srcmr3D.nc'],'srcmr3D');
srcent3D = loadvar( [num2str(year) '_' storm_name '.srcmr3D.nc'],'srcent3D');
srcmr = loadvar( [num2str(year) '_' storm_name '.srcmr.nc'],'srcmr');
srcmrh = loadvar( [num2str(year) '_' storm_name '.srcmr.nc'],'srcmrh');
srcmrv = loadvar( [num2str(year) '_' storm_name '.srcmr.nc'],'srcmrv');
srcent = loadvar( [num2str(year) '_' storm_name '.srcmr.nc'],'srcent');
srcenth = loadvar( [num2str(year) '_' storm_name '.srcmr.nc'],'srcenth');
srcentv = loadvar( [num2str(year) '_' storm_name '.srcmr.nc'],'srcentv');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% compute field  fr LEM, LEE, and others Frs, Frr, radcool, G

mulfactor = fss * 0 + 6371^2  * cos(lat*pi/180) * (0.5*pi/180).^2;
rhoRu = rhoR .* mr .* u;
rhoRv = rhoR .* mr .* v;
[drhoRu_dlon, drhoRu_dlat] = cdfgradlonlat(rhoRu,lon,lat);
[drhoRv_dlon, drhoRv_dlat] = cdfgradlonlat(rhoRv,lon,lat);
LEM  = (drhoRu_dlon + drhoRv_dlat) * (-1);

if isnan(avBox(1)) || isnan(avBox(2))
    return;
end

for nn = 1:size(avBox,1)
    
    lonC = avBox(nn,1);
    latC = avBox(nn,2);
    stratConv = avBox(nn,3);
    
    if stratConv < 2
        dd = 1.0;
    elseif stratConv >10
        dd = 2.0;
    end
    
    lon1 = lonC-dd;
    lon2 = lonC+dd;
    lat1 = latC-dd;
    lat2 = latC+dd;
    indLon = lon >= lon1 & lon <= lon2;
    indLat = lat >= lat1 & lat <= lat2;
    
    indLonS = lon >= avBoxS(1)-dd & lon <= avBoxS(1)+dd;
    indLatS = lat >= avBoxS(2)-dd & lat <= avBoxS(2)+dd;
    
    
    
    %get s0 for the region of interest
    s0 = nanmean(ent(:,indLat,indLon),[1 2 3]);
    entpert = ent - s0;
    rhoSu = rhoR .* entpert .* u;
    rhoSv = rhoR .* entpert .* v;
    [drhoSu_dlon, drhoSu_dlat] = cdfgradlonlat(rhoSu,lon,lat);
    [drhoSv_dlon, drhoSv_dlat] = cdfgradlonlat(rhoSv,lon,lat);
    LEE = (drhoSu_dlon + drhoSv_dlat) * (-1);
    
    % second way to compute LEM and LEE
    latentdiv = cdfdivlonlat(rhoSu,rhoSv,lon,lat);
    latmrdiv  = cdfdivlonlat(rhoRu,rhoRv,lon,lat);
    LEE2 = -1 * latentdiv;
    LEM2 = -1 * latmrdiv;
    
    % %debug plot
    % figure
    % subplot(2,2,1)
    % contourf(lon,lat,squeeze(LEM(1,:,:))); colorbar
    % title('LEM')
    % subplot(2,2,2)
    % contourf(lon,lat,squeeze(LEE(1,:,:))); colorbar
    % title('LEE')
    % subplot(2,2,3)
    % contourf(lon,lat,squeeze(LEM2(1,:,:))); colorbar
    % title('LEM2')
    % subplot(2,2,4)
    % contourf(lon,lat,squeeze(LEE2(1,:,:))); colorbar
    % title('LEE2')
    % stop
    
    %figure
    %contourf(lon,lat,frs); colorbar;
    %stop
    
    
    % go over the averaging Boxes for each case, separately
    
    
    % get averages over the above, case, area
    LEE_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, LEE);
    LEM_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, LEM);
    LEE2_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, LEE2);
    LEM2_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, LEM2);
    Fss_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, fss);
    Frs_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, frs);
    
    hvLEE = LEE(indLat,indLon);
    hvLEM = LEM(indLat,indLon);
    hvLEE2 = LEE2(indLat,indLon);
    hvLEM2 = LEM2(indLat,indLon);
    hvFss = fss(indLat,indLon);
    hvFrs = frs(indLat,indLon);
    
    satent_AV = nanmean(satent(:,indLat,indLon),[2,3]);
    ent_AV = nanmean(ent(:,indLat,indLon),[2,3]);
    %figure
    %plot(satent_AV,z,'k.')
    %stop
    buoymax_AV = z(find(satent_AV==min(satent_AV)));
    
    satent1to3km = nanmean(satent(7:15,:,:),1);
    satent5to7km = nanmean(satent(27:35,:,:),1);
    
    iilo_AV = nanmean(satent(7:15,indLat,indLon),[1 2 3]);
    iihi_AV = nanmean(satent(27:35,indLat,indLon),[1 2 3]);
    
    sst_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, sst);
    sf_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, sfrac);
    ii_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, ii);
    dcin_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, dcin);
    sst_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, sst);
    cape_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, -cape);
    mfluxlo_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, mfluxlo);
    mfluxhi_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, mfluxhi);
    mfluxdif_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, mfluxdif);
    rflux_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, rflux);
    maxsurfabsvort_AV = max(max(squeeze(absvort(1,:,:))));
    absvort2km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze(absvort(11,:,:)));
    absvort4km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze(absvort(19,:,:)));
    absvort5km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze(absvort(26,:,:)));
    absvort6km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze(absvort(31,:,:)));
    absvort8km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze(absvort(41,:,:)));
    mflux2km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze(mflux(11,:,:)));
    mflux4km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze(mflux(19,:,:)));
    mflux6km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze(mflux(31,:,:)));
    mflux8km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze(mflux(41,:,:)));
    
    %moist_conv, dcin,cape, sst, pv6km mf4km, mfluxdiff vtend2km
    hvSF = sfrac(indLat,indLon);
    hvII = ii(indLat,indLon);
    hvSST = sst(indLat,indLon);
    hvDcin = dcin(indLat,indLon);
    hvCAPE = -1*cape(indLat,indLon);
    hvMfluxdif = mfluxdif(indLat,indLon);
    hvMflux2km = mflux(11,indLat,indLon);
    hvMflux4km = mflux(19,indLat,indLon);
    hvMflux6km = mflux(31,indLat,indLon);
    hvMflux8km = mflux(41,indLat,indLon);
    mflux2km = squeeze(mflux(11,:,:));
    mflux4km = squeeze(mflux(19,:,:));
    mflux6km = squeeze(mflux(31,:,:));
    mflux8km = squeeze(mflux(41,:,:));
    
    srcmr_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, srcmr);
    srcent_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, srcent);
    srcmrh_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, srcmrh);
    srcenth_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, srcenth);
    srcmrv_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, srcmrv);
    srcentv_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, srcentv);
    hvSrcmr = srcmr(indLat,indLon);
    hvSrcent = srcent(indLat,indLon);
    
    vtend0to1km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze( nanmean(vtend(1:6,:,:),1) ));
    absvort3to5km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze( nanmean(absvort(16:26,:,:),1) ));
    absvort0to2km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze( nanmean(absvort(1:11,:,:),1) ));
    
    pv4to6km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze( nanmean(PV(21:31,:,:),1) ));
    pv5to7km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze( nanmean(PV(26:36,:,:),1) ));
    pv1to3km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze( nanmean(PV(6:16,:,:),1) ));


    PV2km = squeeze(PV(11,:,:));
    PV4km = squeeze(PV(19,:,:));
    PV6km = squeeze(PV(31,:,:));
    PV8km = squeeze(PV(41,:,:));
    hvPV2km = PV(11,indLat,indLon);
    hvPV4km = PV(19,indLat,indLon);
    hvPV6km = PV(31,indLat,indLon);
    hvPV8km = PV(41,indLat,indLon);
    
    vtend2km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze(vtend(11,:,:)));
    vtend4km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze(vtend(19,:,:)));
    vtend6km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze(vtend(31,:,:)));
    vtend8km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze(vtend(41,:,:)));
    vtend5to7km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze( nanmean(vtend(27:36,:,:),1)  ) );

    vtend2km = vtend(11,:,:);
    vtend4km = vtend(19,:,:);
    vtend6km = vtend(31,:,:);
    vtend8km = vtend(41,:,:);
    hvVtend2km = vtend(11,indLat,indLon);
    hvVtend4km = vtend(19,indLat,indLon);
    hvVtend6km = vtend(31,indLat,indLon);
    hvVtend8km = vtend(41,indLat,indLon);

    stend2km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze(stend(11,:,:)));
    stend4km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze(stend(19,:,:)));
    stend6km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze(stend(31,:,:)));
    stend8km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze(stend(41,:,:)));
    
    ctend2km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze(ctend(11,:,:)));
    ctend4km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze(ctend(19,:,:)));
    ctend6km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze(ctend(31,:,:)));
    ctend8km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze(ctend(41,:,:)));
    ctend5to7km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze( nanmean(ctend(27:36,:,:),1)  ) );
    
    ttend2km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze(ttend(11,:,:)));
    ttend4km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze(ttend(19,:,:)));
    ttend6km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze(ttend(31,:,:)));
    ttend8km_AV = getAverageMultifactor(indLat, indLon, lon, lat, z, mulfactor, squeeze(ttend(41,:,:)));
    
    
    
    field = mflux;   mfluxProf = nanmean(field(:,indLat,indLon),[2 3]);
    maxMF = max(mfluxProf);
    mfZMAX = z(mfluxProf==maxMF);
    
    field = ent;     entProf = nanmean(field(:,indLat,indLon),[2 3]);
    field = satent;  satentProf = nanmean(field(:,indLat,indLon),[2 3]);
    field = absvort; absvortProf = nanmean(field(:,indLat,indLon),[2 3]);
    field = vtend;   vtendProf = nanmean(field(:,indLat,indLon),[2 3]);
    field = stend;   stendProf = nanmean(field(:,indLat,indLon),[2 3]);
    field = ttend;   ttendProf = nanmean(field(:,indLat,indLon),[2 3]);
    field = ctend;   ctendProf = nanmean(field(:,indLat,indLon),[2 3]);
    
    field = PV;   PVProf = nanmean(field(:,indLat,indLon),[2 3]);
    field = srcmr3D;   srcmrProf = nanmean(field(:,indLat,indLon),[2 3]);
    field = srcent3D;   srcentProf = nanmean(field(:,indLat,indLon),[2 3]);
    
    field = mr;   mrProf = nanmean(field(:,indLat,indLon),[2 3]);
    field = satmr;   satmrProf = nanmean(field(:,indLat,indLon),[2 3]);
    
    field = LEM;   lemProf = nanmean(field(:,indLat,indLon),[2 3]);
    field = LEE;   leeProf = nanmean(field(:,indLat,indLon),[2 3]);
    
    iiAV = nanmean(ii(indLat,indLon),[1 2]);
    sfAV = nanmean(sfrac(indLat,indLon),[1 2]);
    dcinAV = nanmean(dcin(indLat,indLon),[1 2]);
    sstAV = nanmean(sst(indLat,indLon),[1 2]);
    % 1    2      3    4     5  6
    tbl = [tbl; time timeTH timeR t_ks u3 v3 ...
        ...    % 7     8     9    10
        sfAV iiAV dcinAV sstAV ...
        ... %     11     12     13     14      15      16       17     18    19          20          21
        LEE_AV LEE2_AV LEM_AV LEM2_AV Fss_AV Frs_AV  0        0   0    0   DEVELOPING ...
        ... %     22     23    24      25      26         27         28            29           30
        sf_AV ii_AV dcin_AV sst_AV mfluxlo_AV mfluxhi_AV  mfluxdif_AV absvort2km_AV absvort4km_AV ...
        ... %     31              32             33             34          35           36
        absvort6km_AV  absvort8km_AV  mflux2km_AV  mflux4km_AV  mflux6km_AV  mflux8km_AV ...
        ... %     37              38             39             40
        vtend2km_AV  vtend4km_AV  vtend6km_AV  vtend8km_AV  ...
        ... %     41              42             43             44
        stend2km_AV  stend4km_AV  stend6km_AV  stend8km_AV  ...
        ... %     45              46             47             48
        ctend2km_AV  ctend4km_AV  ctend6km_AV  ctend8km_AV  ...
        ... %     49              50             51             52
        ttend2km_AV  ttend4km_AV  ttend6km_AV  ttend8km_AV  ...
        ... %       53                      54
        buoymax_AV     srcmr_AV*86400/2500000   ];

        dataHovCONV = [dataHovCONV; ...
    hvSF(:) ...
    hvII(:) ...
    hvSST(:) ...
    hvDcin(:) ...
    hvCAPE(:) ...
    hvMfluxdif(:) ...
    hvMflux4km(:) ...
    hvSrcmr(:) ...
    hvSrcent(:) ...
    hvPV2km(:) ...
    hvPV4km(:) ...
    hvPV6km(:) ...
    hvPV8km(:) ...
    hvVtend2km(:) ...
    hvVtend4km(:) ...
    hvVtend6km(:) ...
    hvVtend8km(:) ...
    hvMflux2km(:) ...
    hvMflux6km(:) ...
    hvMflux8km(:) ];


    dataHovALL = [dataHovALL; ...
    sfrac(:) ...
    ii(:) ...
    sst(:) ...
    dcin(:) ...
    -cape(:) ...
    mfluxdif(:) ...
    mflux4km(:) ...
    srcmr(:) ...
    srcent(:) ...
    PV2km(:) ...
    PV4km(:) ...
    PV6km(:) ...
    PV8km(:) ...
    vtend2km(:) ...
    vtend4km(:) ...
    vtend6km(:) ...
    vtend8km(:) ...
    mflux2km(:) ...
    mflux6km(:) ...
    mflux8km(:) ];
    
    
    stormData = [stormData; ...
        ... % 1 2       3     4   5  6      7
        time timeTH timeR t_ks u3 v3 DEVELOPING ...
        ... % 8      9       10                     11        12     13       14            15
        cape_AV sf_AV srcmr_AV*86400/2500000 mflux4km_AV ii_AV dcin_AV buoymax_AV -srcent_AV*86400/2500000 ...
        ... %      16            17              18            19
        vtend0to1km_AV absvort3to5km_AV absvort5km_AV maxsurfabsvort_AV ...
        ... %   20-23     24-27
        BT_vmax    BT_dvmax ...
        ... %     28             29             30             31
        absvort2km_AV absvort4km_AV  absvort6km_AV  absvort8km_AV ...
        ... %     32          33            34           35
        mflux2km_AV  mflux4km_AV  mflux6km_AV  mflux8km_AV ...
        ... %     36              37             38             39
        vtend2km_AV  vtend4km_AV  vtend6km_AV  vtend8km_AV  ...
        ... %     40              41             42             43
        stend2km_AV  stend4km_AV  stend6km_AV  stend8km_AV  ...
        ... %     44              45             46             47
        ctend2km_AV  ctend4km_AV  ctend6km_AV  ctend8km_AV  ...
        ... %     48              49             50             51      52
        ttend2km_AV  ttend4km_AV  ttend6km_AV  ttend8km_AV  SHIPS_shear ...
        ... %      53
        absvort3to5km_AV-absvort0to2km_AV ...
        ... %       54      55      56     57     58     59       60     61    62          63
        LEE_AV LEE2_AV LEM_AV LEM2_AV Fss_AV Frs_AV       0        0      0     0   ...
        ... %       64          65         66            67            68             69
        stratConv    nn     BT_lonCenter  BT_latCenter BT_pressureCenter  SHIPS_shear ...
        ... %       70               71             72        73       74         75          76
        VORT_lonCenter  VORT_latCenter   iilo_AV  iihi_AV pv4to6km_AV pv5to7km_AV pv1to3km_AV ...
        ... %       77         78         79              80                   81
        mfluxlo_AV mfluxhi_AV  mfluxdif_AV  srcmrh_AV*86400/2500000  srcmrv_AV*86400/2500000  ...
        ... %    82                     83                             84       85     86      87
        -srcenth_AV*86400/2500000   -srcentv_AV*86400/2500000  distanceCenter sst_AV rflux_AV year ...
        ... %    88         89          90-no P3 swaths   91
        vtend5to7km_AV ctend5to7km_AV   0               mfZMAX   ];
    
    if PLOT_INDIVIDUAL == 0
        fprintf('%i %s %i %i %i \t %5.2f %5.2f %5.2f %5.2f %5.2f %5.2f %5.2f %i \n', COUNTER, storm_name, year, month, day,...
              cape_AV, sf_AV, -srcmr_AV*86400/2500000, mflux4km_AV, ii_AV, dcin_AV, timeR, nn);
    end
    stormNames{COUNTER} = storm_name;
    
    profiles(COUNTER,:,1) = mfluxProf;
    profiles(COUNTER,:,2) = entProf;
    profiles(COUNTER,:,3) = satentProf;
    profiles(COUNTER,:,4) = absvortProf;
    profiles(COUNTER,:,5) = vtendProf;
    profiles(COUNTER,:,6) = stendProf;
    profiles(COUNTER,:,7) = ttendProf;
    profiles(COUNTER,:,8) = ctendProf;
    profiles(COUNTER,:,9) = PVProf;
    profiles(COUNTER,:,10) = lemProf;
    profiles(COUNTER,:,11) = leeProf;
    profiles(COUNTER,:,12) = mrProf;
    profiles(COUNTER,:,13) = satmrProf;
    profiles(COUNTER,:,14) = srcmrProf;
    profiles(COUNTER,:,15) = srcentProf;
    
    COUNTER = COUNTER + 1;
    
end








%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if PLOT_INDIVIDUAL == 1
    
    
    figure('visible','off')
    set(gcf,'Position',[70 50 1600 700])
    
    tiledlayout(2,6)
    
    ax = nexttile;
    contourf(lon,lat,squeeze(mflux(21,:,:))); colorbar; hold on;
    caxis([-0.1 0.2])
    plot(lonm,latm,'k-'); plot(lonm,latm,'r.','markersize',19)
    plotBoxesAvBox
    %plot(BT_lonCenter,BT_latCenter,'rpentagram','markerfacecolor','r','markersize',21)
    %plot(VORT_lonCenter,VORT_latCenter,'bpentagram','markerfacecolor','b','markersize',21)
    xlabel('longitude (deg)'); ylabel('latitude (deg)')
    title('3dvar mass flux at 4 km ')
    set(gca,'fontsize',14)
    
    ax = nexttile;
    contourf(lon,lat,ii); colorbar; hold on;
    %caxis([-0.1 0.2])
    plot(lonm,latm,'k-'); plot(lonm,latm,'r.','markersize',19)
    plotBoxesAvBox
    plot(BT_lonCenter,BT_latCenter,'rpentagram','markerfacecolor','r','markersize',21)
    plot(VORT_lonCenter,VORT_latCenter,'bpentagram','markerfacecolor','b','markersize',21)
    xlabel('longitude (deg)'); ylabel('latitude (deg)')
    title('instability index (J/K/kg)')
    set(gca,'fontsize',14)
    
    ax = nexttile;
    contourf(lon,lat,sfrac); colorbar; hold on;
    %caxis([-0.1 0.2])
    plot(lonm,latm,'k-'); plot(lonm,latm,'r.','markersize',19)
    plotBoxesAvBox
    plot(BT_lonCenter,BT_latCenter,'rpentagram','markerfacecolor','r','markersize',21)
    plot(VORT_lonCenter,VORT_latCenter,'bpentagram','markerfacecolor','b','markersize',21)
    xlabel('longitude (deg)'); ylabel('latitude (deg)')
    title('saturation fraction')
    set(gca,'fontsize',14)
    
    ax = nexttile;
    contourf(lon,lat,squeeze(absvort(11,:,:))); colorbar; hold on;
    quiver(lon(1:4:end),lat(1:4:end),squeeze(u(11,1:4:end,1:4:end)),squeeze(v(11,1:4:end,1:4:end)),2,'ColorMode','manual','Color','k')
    %caxis([-0.1 0.2])
    plot(lonm,latm,'k-'); plot(lonm,latm,'r.','markersize',19)
    plotBoxesAvBox
    plot(BT_lonCenter,BT_latCenter,'rpentagram','markerfacecolor','r','markersize',21)
    plot(VORT_lonCenter,VORT_latCenter,'bpentagram','markerfacecolor','b','markersize',21)
    xlabel('longitude (deg)'); ylabel('latitude (deg)')
    title('2 km abs. vort. (1/ks)')
    set(gca,'fontsize',14)
    
    ax = nexttile;
    contourf(lon,lat,squeeze(div(11,:,:))); colorbar; hold on;
    %caxis([-0.1 0.2])
    plot(lonm,latm,'k-'); plot(lonm,latm,'r.','markersize',19)
    plotBoxesAvBox
    plot(BT_lonCenter,BT_latCenter,'rpentagram','markerfacecolor','r','markersize',21)
    plot(VORT_lonCenter,VORT_latCenter,'bpentagram','markerfacecolor','b','markersize',21)
    xlabel('longitude (deg)'); ylabel('latitude (deg)')
    title('divergence (1/s)')
    set(gca,'fontsize',14)
    
    ax = nexttile;
    field = mflux;
    fieldAV = nanmean(field(:,indLat,indLon),[2 3]);
    plot(fieldAV,z,'k','linewidth',2); hold on;
    plot(fieldAV*0,z,'k--','linewidth',1); hold on;
    xlabel('mass flux (kg/m^2/s)'); ylabel('height (km)')
    set(gca,'fontsize',14)
    %xlim([-0.1 0.1])
    ylim([0 16])
    
    ax = nexttile;
    field = ent; fieldAV = nanmean(field(:,indLat,indLon),[2 3]);
    plot(fieldAV,z,'k','linewidth',2); hold on;
    field = satent; fieldAV = nanmean(field(:,indLat,indLon),[2 3]);
    plot(fieldAV,z,'r','linewidth',2); hold on;
    %legend('t','s','t','c','location','ne')
    xlabel('entropy (J/K/kg)'); ylabel('height (km)')
    set(gca,'fontsize',14)
    %xlim([-0.05 0.4])
    ylim([0 16])
    
    ax = nexttile;
    field = absvort;
    fieldAV = nanmean(field(:,indLat,indLon),[2 3]);
    plot(fieldAV,z,'k','linewidth',2); hold on;
    plot(fieldAV*0,z,'k--','linewidth',1); hold on;
    xlabel('abs. vort. (1/ks)'); ylabel('height (km)')
    title(['II =' num2str(ii_AV)])
    set(gca,'fontsize',14)
    %xlim([-0.05 0.4])
    ylim([0 16])
    
    ax = nexttile;
    field = PV;
    fieldAV = nanmean(field(:,indLat,indLon),[2 3]);
    plot(fieldAV,z,'k','linewidth',2); hold on;
    plot(fieldAV*0,z,'k--','linewidth',1); hold on;
    xlabel('PV (pvu)'); ylabel('height (km)')
    set(gca,'fontsize',14)
    xlim([-0.1 2])
    ylim([0 16])
    
    
    ax = nexttile;
    field = vtend; fieldAV = nanmean(field(:,indLat,indLon),[2 3]);
    plot(fieldAV,z,'k','linewidth',2); hold on;
    field = stend; fieldAV = nanmean(field(:,indLat,indLon),[2 3]);
    plot(fieldAV,z,'r','linewidth',2); hold on;
    field = ttend; fieldAV = nanmean(field(:,indLat,indLon),[2 3]);
    plot(fieldAV,z,'b','linewidth',2); hold on;
    field = ctend; fieldAV = nanmean(field(:,indLat,indLon),[2 3]);
    plot(fieldAV,z,'m','linewidth',2); hold on;
    plot(fieldAV*0,z,'k--','linewidth',1); hold on;
    legend('t','s','t','c','location','ne')
    xlabel('vort. tend. (1/ks^2)'); ylabel('height (km)')
    set(gca,'fontsize',14)
    %xlim([-0.05 0.4])
    ylim([0 16])
    
    sgtitle( [upper(storm_name) '; entBudget = ' num2str(entTotal_AV)] ,'fontsize',16,'fontweight','bold')
    
    print('-dpng',['PROFVAR3D_' num2str(year)  '_' storm_name '.png'])
    
    close
end




