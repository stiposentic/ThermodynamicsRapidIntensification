
if strcmp(var1,'timeR')
    varN = 3;     label1 = 'time (d)';
elseif strcmp(var1,'u')
    varN = 5;     label1 = 'u_s (m s^{-1})';
elseif strcmp(var1,'v')
    varN = 6;     label1 = 'v_s (m s^{-1})';
elseif strcmp(var1,'cape')
    varN = 8;     label1 = 'CAPE (J K^{-1})';
elseif strcmp(var1,'sf')
    varN = 9;     label1 = 'saturation fraction';
elseif strcmp(var1,'srcmr')
    varN = 10;    label1 = 'moist. conv. (mm d^{-1})';
elseif strcmp(var1,'mflux4km')
    varN = 11;    label1 = '4 km mass flux (kg m^{-2} s^{-1})';
elseif strcmp(var1,'ii')
    varN = 12;    label1 = 'instability index (J K^{-1} kg^{-1})';
elseif strcmp(var1,'dcin')
    varN = 13;    label1 = 'DCIN (J K^{-1} kg^{-1})';
elseif strcmp(var1,'buoymax')
    varN = 14;    label1 = 'level of maximum buoyancy (km)';
elseif strcmp(var1,'srcent')
    varN = 15;    label1 = 'entropy divergence (mm d^{-1})';
elseif strcmp(var1,'vtend0to1km')
    varN = 16;    label1 = 'vort. tend. (1 ks^{-2})';
elseif strcmp(var1,'absvort3to5km')
    varN = 17;    label1 = '3-5 km abs. vort. (1 ks^{-1})';
elseif strcmp(var1,'absvort5km')
    varN = 18;    label1 = '5 km abs. vort. (1 ks^{-1})';
elseif strcmp(var1,'vmax0')
    varN = 20;    label1 = 'MSWS (kt)';
elseif strcmp(var1,'vmax6')
    varN = 21;    label1 = 'BT 6 hr vmax (kt)';
elseif strcmp(var1,'vmax12')
    varN = 22;    label1 = 'BT 12 hr vmax (kt)';
elseif strcmp(var1,'vmax24')
    varN = 23;    label1 = 'BT 24 hr vmax (kt)';
elseif strcmp(var1,'dvmax6')
    varN = 25;    label1 = 'BT 6 hr dvmax (kt)';
elseif strcmp(var1,'dvmax12')
    varN = 26;    label1 = 'BT 12 hr dvmax (kt)';
elseif strcmp(var1,'dvmax24')
    varN = 27;    label1 = 'BT 24 hr dvmax (kt)';
elseif strcmp(var1,'absvort2km_AV')
    varN = 28;    label1 = '2 km abs. vort. (1 ks^{-1})';
elseif strcmp(var1,'absvort4km_AV')
    varN = 29;    label1 = '4 km abs. vort. (1 ks^{-1})';
elseif strcmp(var1,'absvort6km_AV')
    varN = 30;    label1 = '6 km abs. vort. (1 ks^{-1})';
elseif strcmp(var1,'absvort8km_AV')
    varN = 31;    label1 = '8 km abs. vort. (1 ks^{-1})';
elseif strcmp(var1,'mflux2km_AV')
    varN = 32;    label1 = '2 km mass flux (kg m^{-2} s^{-1})';
elseif strcmp(var1,'mflux4km_AV')
    varN = 33;    label1 = '4 km mass flux (kg m^{-2} s^{-1})';
elseif strcmp(var1,'mflux6km_AV')
    varN = 34;    label1 = '6 km mass flux (kg m^{-2} s^{-1})';
elseif strcmp(var1,'mflux8km_AV')
    varN = 35;    label1 = '8 km mass flux (kg m^{-2} s^{-1})';
elseif strcmp(var1,'vtend2km_AV')
    varN = 36;    label1 = '2 km vort. tend. (1 ks^{-2})';
elseif strcmp(var1,'vtend4km_AV')
    varN = 37;    label1 = '4 km vort. tend. (1 ks^{-2})';
elseif strcmp(var1,'vtend6km_AV')
    varN = 38;    label1 = '6 km vort. tend. (1 ks^{-2})';
elseif strcmp(var1,'vtend8km_AV')
    varN = 39;    label1 = '8 km vort. tend. (1 ks^{-2})';
elseif strcmp(var1,'stend2km_AV')
    varN = 40;    label1 = '2 km vort. stend. (1 ks^{-2})';
elseif strcmp(var1,'stend4km_AV')
    varN = 41;    label1 = '4 km vort. stend. (1 ks^{-2})';
elseif strcmp(var1,'stend6km_AV')
    varN = 42;    label1 = '6 km vort. stend. (1 ks^{-2})';
elseif strcmp(var1,'stend8km_AV')
    varN = 43;    label1 = '8 km vort. stend. (1 ks^{-2})';
elseif strcmp(var1,'ctend2km_AV')
    varN = 44;    label1 = '2 km vort. ctend. (1 ks^{-2})';
elseif strcmp(var1,'ctend4km_AV')
    varN = 45;    label1 = '4 km vort. ctend. (1 ks^{-2})';
elseif strcmp(var1,'ctend6km_AV')
    varN = 46;    label1 = '6 km vort. ctend. (1 ks^{-2})';
elseif strcmp(var1,'ctend8km_AV')
    varN = 47;    label1 = '8 km vort. ctend. (1 ks^{-2})';
elseif strcmp(var1,'ttend2km_AV')
    varN = 48;    label1 = '2 km vort. ttend. (1 ks^{-2})';
elseif strcmp(var1,'ttend4km_AV')
    varN = 49;    label1 = '4 km vort. ttend. (1 ks^{-2})';
elseif strcmp(var1,'ttend6km_AV')
    varN = 50;    label1 = '6 km vort. ttend. (1 ks^{-2})';
elseif strcmp(var1,'ttend8km_AV')
    varN = 51;    label1 = '8 km vort. ttend. (1 ks^{-2})';
elseif strcmp(var1,'SHIPS_shear')
    varN = 52;    label1 = 'SHIPS shear (kt)';
elseif strcmp(var1,'dabsvort')
    varN = 53;    label1 = '4 to 1 km abs. vort. diff. (1 ks^{-1})';
elseif strcmp(var1,'LEE')
    varN = 54;    label1 = 'LEE (J K^{-1} s^{-1} m^{-2})';
elseif strcmp(var1,'LEE2')
    varN = 55;    label1 = 'LEE2 (J K^{-1} s^{-1} m^{-2})';
elseif strcmp(var1,'LEM')
    varN = 56;    label1 = 'LEM (g s^{-1} m^{-2})';
elseif strcmp(var1,'LEM2')
    varN = 57;    label1 = 'LEM2 (g s^{-1} m^{-2})';
elseif strcmp(var1,'Frs')
    varN = 59;    label1 = 'Frs (g s^{-1} m^{-2})';
elseif strcmp(var1,'Fss')
    varN = 58;    label1 = 'Fss (J K^{-1} s^{-1} m^{-2})';
elseif strcmp(var1,'Frad')
    varN = 60;    label1 = 'Frad (J K^{-1} s^{-1} m^{-2})';
elseif strcmp(var1,'G')
    varN = 61;    label1 = 'G (J K^{-1} s^{-1} m^{-2})';
elseif strcmp(var1,'entTotal')
    varN = 62;    label1 = 'entTotal (J K^{-1} s^{-1} m^{-2})';
elseif strcmp(var1,'rtTotal')
    varN = 63;    label1 = 'rtTotal (g s^{-1} m^{-2})';
elseif strcmp(var1,'BT_pressureCenter')
    varN = 68;    label1 = 'BT pres. (hPa)';
elseif strcmp(var1,'SHIPS_shear ')
    varN = 69;    label1 = 'SHIPS shear (m s^{-1})';
elseif strcmp(var1,'iilo')
    varN = 72;    label1 = 'satent 1-3 km (J K^{-1} kg^{-1})';
elseif strcmp(var1,'iihi')
    varN = 73;    label1 = 'satent 5-7 km (J K^{-1} kg^{-1})';
elseif strcmp(var1,'pv4to6km')
    varN = 74;    label1 = '4-6 km PV (pvu)';
elseif strcmp(var1,'pv5to7km')
    varN = 75;    label1 = '5-7 km PV (pvu)';
elseif strcmp(var1,'pv1to3km')
    varN = 76;    label1 = '1-3 km PV (pvu)';
elseif strcmp(var1,'mfluxlo')
    varN = 77;    label1 = '3-5 km mass flux (kg m^{-2} s^{-1})';
elseif strcmp(var1,'mfluxhi')
    varN = 78;    label1 = '7-9 km mass flux (kg m^{-2} s^{-1})';
elseif strcmp(var1,'mfluxdiff')
    varN = 79;    label1 = 'MFI (kg m^{-2} s^{-1})';
elseif strcmp(var1,'srcmrh')
    varN = 80;    label1 = 'H moist. conv. (W m^{-2})';
elseif strcmp(var1,'srcmrv')
    varN = 81;    label1 = 'V moist. conv. (W m^{-2})';
elseif strcmp(var1,'srcenth')
    varN = 82;    label1 = 'H ent. div. (W m^{-2})';
elseif strcmp(var1,'srcentv')
    varN = 83;    label1 = 'V ent. div (W m^{-2})';
elseif strcmp(var1,'distCenter')
    varN = 84;    label1 = 'distance to center (deg)';    
elseif strcmp(var1,'sst')
    varN = 85;    label1 = 'SST (^oC)';    
elseif strcmp(var1,'rflux')
    varN = 86;    label1 = 'rflux ()';    
elseif strcmp(var1,'year')
    varN = 87;    label1 = 'time (year)';    
elseif strcmp(var1,'vtend5to7km')
    varN = 88;    label1 = '5-7 km vort. tend. (1 ks^{-2})';    
elseif strcmp(var1,'ctend5to7km')
    varN = 89;    label1 = '5-7 km conv. tend. (1 ks^{-2})';    
elseif strcmp(var1,'mfZMAX')
    varN = 91;    label1 = 'height of mass flux max. (km)';    
end
varN1 = varN;
% available: timeR, u, v, cape, sf, srcmr, mflux4km, ii dcin, buoymax
%    ... %   20-23     24-27
%          BT_vmax    BT_dvmax];
% 
%           %     28             29             30             31                   
%            absvort2km_AV absvort4km_AV  absvort6km_AV  absvort8km_AV  ...
%        ... %     32          33            34           35
%              mflux2km_AV  mflux4km_AV  mflux6km_AV  mflux8km_AV ...
%        ... %     36              37             38             39                      
%                 vtend2km_AV  vtend4km_AV  vtend6km_AV  vtend8km_AV  ...
%        ... %     40              41             42             43                      
%                 stend2km_AV  stend4km_AV  stend6km_AV  stend8km_AV  ...
%        ... %     44              45             46             47                      
%                 ctend2km_AV  ctend4km_AV  ctend6km_AV  ctend8km_AV  ...
%        ... %     48              49             50             51      52        
%                 ttend2km_AV  ttend4km_AV  ttend6km_AV  ttend8km_AV  SHIPS_shear];

mean1 = NaN; std1 = NaN;
mean2 = NaN; std2 = NaN;
mean3 = NaN; std3 = NaN;
if strcmp(var2,'timeR')
    varN = 3;        label2 = 'time (d)';
elseif strcmp(var2,'u')
    varN = 5;    label2 = 'u_s (m s^{-1})';
elseif strcmp(var2,'v')
    varN = 6;    label2 = 'v_s (m s^{-1})';
elseif strcmp(var2,'cape')
    varN = 8;    label2 = 'CAPE (J K^{-1})';
    mean1 = 2612; std1 = 2193;
    mean2 = 3137; std2 = 2355; 
    mean3 = 2804; std3 = NaN;
elseif strcmp(var2,'sf')
    varN = 9;    label2 = 'saturation fraction';
    mean1 = 0.892; std1 = 0.031;
    mean2 = 0.768; std2 = 0.04;
    mean3 = 0.562; std3 = 0.11; 
elseif strcmp(var2,'srcmr')
    varN = 10;   label2 = 'moist. conv. (mm d^{-1})';
elseif strcmp(var2,'mflux4km')
    varN = 11;   label2 = '4 km mass flux (kg m^{-2} s^{-1})';
elseif strcmp(var2,'ii')
    varN = 12;   label2 = 'instability index (J K^{-1} kg^{-1})';
    mean1 = 7.73; std1 = 9.86;
    mean2 = 19.7; std2 = 11.23;
    mean3 = 23.77; std3 = 19.7;
elseif strcmp(var2,'dcin')
    varN = 13;   label2 = 'DCIN (J K^{-1} kg^{-1})';
    mean1 = -6.05; std1 = 11.3;
    mean2 = 2.4; std2 = 13.3;
    mean3 = 17.2; std3 = 23.9;
elseif strcmp(var2,'buoymax')
    varN = 14;    label2 = 'level of maximum buoyancy (km)';
elseif strcmp(var2,'srcent')
    varN = 15;    label2 = 'entropy divergence (mm d^{-1})';
elseif strcmp(var2,'vtend0to1km')
    varN = 16;    label2 = 'vort. tend. (1 ks^{-2})';
elseif strcmp(var2,'absvort3to5km')
    varN = 17;    label2 = '3-5 km abs. vort. (1 ks^{-1})';
elseif strcmp(var2,'absvort5km')
    varN = 18;    label2 = '5 km abs. vort. (1 ks^{-1})';
elseif strcmp(var2,'vmax0')
    varN = 20;    label2 = 'MSWS (kt)';
elseif strcmp(var2,'vmax6')
    varN = 21;    label2 = 'BT 6 hr vmax (kt)';
elseif strcmp(var2,'vmax12')
    varN = 22;    label2 = 'BT 12 hr vmax (kt)';
elseif strcmp(var2,'vmax24')
    varN = 23;    label2 = 'BT 24 hr vmax (kt)';
elseif strcmp(var2,'dvmax6')
    varN = 25;    label2 = 'BT 6 hr dvmax (kt)';
elseif strcmp(var2,'dvmax12')
    varN = 26;    label2 = 'BT 12 hr dvmax (kt)';
elseif strcmp(var2,'dvmax24')
    varN = 27;    label2 = 'BT 24 hr dvmax (kt)';
    
elseif strcmp(var2,'absvort2km_AV')
    varN = 28;    label2 = '2 km abs. vort. (1 ks^{-1})';
elseif strcmp(var2,'absvort4km_AV')
    varN = 29;    label2 = '4 km abs. vort. (1 ks^{-1})';
elseif strcmp(var2,'absvort6km_AV')
    varN = 30;    label2 = '6 km abs. vort. (1 ks^{-1})';
elseif strcmp(var2,'absvort8km_AV')
    varN = 31;    label2 = '8 km abs. vort. (1 ks^{-1})';

elseif strcmp(var2,'mflux2km_AV')
    varN = 32;    label2 = '2 km mass flux (kg m^{-2} s^{-1})';
elseif strcmp(var2,'mflux4km_AV')
    varN = 33;    label2 = '4 km mass flux (kg m^{-2} s^{-1})';
elseif strcmp(var2,'mflux6km_AV')
    varN = 34;    label2 = '6 km mass flux (kg m^{-2} s^{-1})';
elseif strcmp(var2,'mflux8km_AV')
    varN = 35;    label2 = '8 km mass flux (kg m^{-2} s^{-1})';

elseif strcmp(var2,'vtend2km_AV')
    varN = 36;    label2 = '2 km vort. tend. (1 ks^{-2})';
elseif strcmp(var2,'vtend4km_AV')
    varN = 37;    label2 = '4 km vort. tend. (1 ks^{-2})';
elseif strcmp(var2,'vtend6km_AV')
    varN = 38;    label2 = '6 km vort. tend. (1 ks^{-2})';
elseif strcmp(var2,'vtend8km_AV')
    varN = 39;    label2 = '8 km vort. tend. (1 ks^{-2})';
    
elseif strcmp(var2,'stend2km_AV')
    varN = 40;    label2 = '2 km vort. stend. (1 ks^{-2})';
elseif strcmp(var2,'stend4km_AV')
    varN = 41;    label2 = '4 km vort. stend. (1 ks^{-2})';
elseif strcmp(var2,'stend6km_AV')
    varN = 42;    label2 = '6 km vort. stend. (1 ks^{-2})';
elseif strcmp(var2,'stend8km_AV')
    varN = 43;    label2 = '8 km vort. stend. (1 ks^{-2})';

elseif strcmp(var2,'ctend2km_AV')
    varN = 44;    label2 = '2 km vort. conv. t. (1 ks^{-2})';
elseif strcmp(var2,'ctend4km_AV')
    varN = 45;    label2 = '4 km vort. conv. t. (1 ks^{-2})';
elseif strcmp(var2,'ctend6km_AV')
    varN = 46;    label2 = '6 km vort. conv. t. (1 ks^{-2})';
elseif strcmp(var2,'ctend8km_AV')
    varN = 47;    label2 = '8 km vort. conv. t. (1 ks^{-2})';

elseif strcmp(var2,'ttend2km_AV')
    varN = 48;    label2 = '2 km vort. tilt. t. (1 ks^{-2})';
elseif strcmp(var2,'ttend4km_AV')
    varN = 49;    label2 = '4 km vort. tilt. t. (1 ks^{-2})';
elseif strcmp(var2,'ttend6km_AV')
    varN = 50;    label2 = '6 km vort. tilt. t. (1 ks^{-2})';
elseif strcmp(var2,'ttend8km_AV')
    varN = 51;    label2 = '8 km vort. tilt. t. (1 ks^{-2})';

elseif strcmp(var2,'SHIPS_shear')
    varN = 52;    label2 = 'SHIPS shear (kt)';
elseif strcmp(var2,'dabsvort')
    varN = 53;    label2 = '4 to 1 km abs. vort. diff. (1 ks^{-1})';
    
elseif strcmp(var2,'LEE')
    varN = 54;    label2 = 'LEE (J K^{-1} s^{-1} m^{-2})';
elseif strcmp(var2,'LEE2')
    varN = 55;    label2 = 'LEE2 (J K^{-1} s^{-1} m^{-2})';
elseif strcmp(var2,'LEM')
    varN = 56;    label2 = 'LEM (g s^{-1} m^{-2})';
elseif strcmp(var2,'LEM2')
    varN = 57;    label2 = 'LEM2 (g s^{-1} m^{-2})';
elseif strcmp(var2,'Frs')
    varN = 59;    label2 = 'Frs (g s^{-1} m^{-2})';
elseif strcmp(var2,'Fss')
    varN = 58;    label2 = 'Fss (J K^{-1} s^{-1} m^{-2})';
elseif strcmp(var2,'Frad')
    varN = 60;    label2 = 'Frad (J K^{-1} s^{-1} m^{-2})';
elseif strcmp(var2,'G')
    varN = 61;    label2 = 'G (J K^{-1} s^{-1} m^{-2})';
elseif strcmp(var2,'entTotal')
    varN = 62;    label2 = 'entTotal (J K^{-1} s^{-1} m^{-2})';
elseif strcmp(var2,'rtTotal')
    varN = 63;    label2 = 'rtTotal (g s^{-1} m^{-2})';
elseif strcmp(var2,'BT_pressureCenter')
    varN = 68;    label2 = 'BT pres. (hPa)';
elseif strcmp(var2,'SHIPS_shear ')
    varN = 69;    label2 = 'SHIPS shear (m s^{-1})';
elseif strcmp(var2,'iilo')
    varN = 72;    label2 = 'satent 1-3 km (J K^{-1} kg^{-1})';
elseif strcmp(var2,'iihi')
    varN = 73;    label2 = 'satent 5-7 km (J K^{-1} kg^{-1})';
elseif strcmp(var2,'pv4to6km')
    varN = 74;    label2 = '4-6 km PV (pvu)';
elseif strcmp(var2,'pv5to7km')
    varN = 75;    label2 = '5-7 km PV (pvu)';
elseif strcmp(var2,'pv1to3km')
    varN = 76;    label2 = '1-3 km PV (pvu)';
elseif strcmp(var2,'mfluxlo')
    varN = 77;    label2 = '3-5 km mass flux (kg m^{-2} s^{-1})';
elseif strcmp(var2,'mfluxhi')
    varN = 78;    label2 = '7-9 km mass flux (kg m^{-2} s^{-1})';
elseif strcmp(var2,'mfluxdiff')
    varN = 79;    label2 = 'MFI (kg m^{-2} s^{-1})';
elseif strcmp(var2,'srcmrh')
    varN = 80;    label2 = 'H moist. conv. (W m^{-2})';
elseif strcmp(var2,'srcmrv')
    varN = 81;    label2 = 'V moist. conv. (W m^{-2})';
elseif strcmp(var2,'srcenth')
    varN = 82;    label2 = 'H ent. div. (W m^{-2})';
elseif strcmp(var2,'srcentv')
    varN = 83;    label2 = 'V ent. div (W m^{-2})';    
elseif strcmp(var2,'distCenter')
    varN = 84;    label2 = 'distance to center (deg)';    
elseif strcmp(var2,'sst')
    varN = 85;    label2 = 'SST (^oC)';    
elseif strcmp(var2,'rflux')
    varN = 86;    label2 = 'surf. r_t flux (W m^{-2})';    
elseif strcmp(var2,'year')
    varN = 87;    label2 = 'time (year)';    
elseif strcmp(var2,'vtend5to7km')
    varN = 88;    label2 = '5-7 km vort. tend. (1 ks^{-2})';    
elseif strcmp(var2,'ctend5to7km')
    varN = 89;    label2 = '5-7 km conv. tend. (1 ks^{-2})';    
elseif strcmp(var2,'mfZMAX')
    varN = 91;    label2 = 'height of mass flux max. (km)';    
end
varN2 = varN;