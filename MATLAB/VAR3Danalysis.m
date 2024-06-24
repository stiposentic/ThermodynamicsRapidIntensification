clear all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PARAMETERS FOR SCRIPT
PLOT_INDIVIDUAL = 0; % option: 0, 1 (general plot) 
PLOT_ALL_PROFILES = 0;
JURACIC = 0;
SINGLE_AVERAGE = 1;
indcludeGaston = 1;
% do calculations and plots for stratiform data
STRATI_SINGLE_AVERAGE = 0;

% averaging  half size (box is 2*dd by 2*dd):
dd = 1.0;

SAVE_FIGURES = 0; % 0-do not save figures

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

percentageHISTOGRAM = [];

if STRATI_SINGLE_AVERAGE == 1
    infix = 'STRATI_';
else
    infix = '';
end

if JURACIC == 1
    prefix = 'JUR_';
else
    prefix = '';
end

% define four basic colors for the scatterplots, here:
blackS = [0 0 0]; 
blueS = [0 0.4470 0.7410];
orangeS = [0.9290 0.6940 0.1250];
redS = [0.8500 0.3250 0.0980];


data = readcell('getParameters.asc','FileType','text');
disp('STORM cape_AV sf_AV srcmr_AV mflux4km_AV ii_AV dcin_AV buoy_max' )

% load TC-DROPS data here 
%load('E:\RESEARCH\TC-DROPS\TCRI_TC_DROPS.mat')
% available fields: 
%    'TCRI_TC_DROPS.mat','sfTC','iiTC','dcinTC','sstTC','capeTC','hfluxTC','rfluxTC',...
%    'FssTC', 'FrsTC','indG4',...
%    'stormNameTC', 'flight_id', 'aircraft_type', 'yearTC', 'monthTC',...
%    'dayTC', 'hourTC', 'minuteTC', 'latitude_initial', 'longitude_initial',...
%    'genesis_prob','str_uwind','str_vwind',...
%    'vmax_change_p12','vmax_change_p24',...
%    'vmax_change_m12','vmax_change_m24',...
%    'vmax_change_within6','vmax_change_within12','vmax_change_within24');

stormNames = cell(241,1);
stormData = [];
tbl = [];
stormDataTC = [];
histData = [];
dataHovALL = [];
dataHovCONV = [];

COUNTER = 1;
profiles = NaN(412,81,11);

% latex table
fidL = fopen('casesLatexTable.asc','w');
fprintf(fidL,"Case & 3DVar & SF--II Regime & Campaign & Date &  $t_{ref}$ [Z] & (Lon, Lat) [deg] & $v_p$ [m/s] \\\\ \n");

fid = fopen('casesTCRI.asc','w');
fprintf(fid,"%% storm speed deduced from best tracks data: u_storm(m/s) v_storm(m/s)\n");
fprintf(fid,"%% referencetime for the 3DVar in kiloseconds of current day: ref_time(ks)\n");
fprintf(fid,"%% extent of 3DVar domain in deg: lon1 lon2 lat1 lat2\n");
fprintf(fid,"%% location of convection: lonConvection latConvection\n");
fprintf(fid,"%% instability index and saturation fraction are averaged over a 2 by 2 deg box: ii sf\n");
fprintf(fid,"%% N name  year mm dd hh min  u_storm(m/s) v_storm(m/s) ref_time(ks) lon1 lon2 lat1 lat2 lonConvection latConvection ii(J/K/kg) sf\n");

dataConvStrat = [];

dataModeratePrecipMask = [];
dataModeratePrecipMaskIISF = [];
dataModeratePrecipMergedMask = [];
dataModeratePrecipMergedMaskIISF = [];
dataMergeDeep = [];
dataMergeModerate = [];
dataMergeShallow = [];
dataMergeStratiform = [];
dataMergeIntermed = [];
dataMergeIISF = [];
for i = 1:size(data,1)
%for i = 65 % grace 2 
%for i = 55 % laura 5
%for i = 82 % ian 3
%for i = 83 % ian 4
%for i = 84 % ian 5
%for i = 85 % ian 6
%for i = 49:size(data,1) % delta 1 and onward, from 2020
%for i = 64:size(data,1) % grace1 1 and onward, from 2021
    
    % get case information
    storm_name = data{i,1};
    year = data{i,2};
    month = data{i,3};
    day = data{i,4};
    hour = data{i,5};
    minute = data{i,6};
    u3 = data{i,7};
    v3 = data{i,8};
    t_ks =  data{i,9};
    lon1 =  data{i,10};
    lon2 =  data{i,11};
    lat1 =  data{i,12};
    lat2 =  data{i,13};
    %disp(storm_name)
    
    
    % get data for case
    file = [num2str(year) '_' storm_name '.nc'];
    lon = loadvar(file,'lon');
    lat = loadvar(file,'lat');
    lonm = loadvar(file,'lon.m');
    latm = loadvar(file,'lat.m');
    z = loadvar(file,'z');
    mask = loadvar(file,'mask');
    u = loadvar(file,'u');
    v = loadvar(file,'v');
    w = loadvar(file,'w');
    relvort = loadvar(file,'relvort');
    absvort = loadvar(file,'absvort');
    div = loadvar(file,'div');
    mflux = loadvar(file,'mflux');
    pres = loadvar(file,'pres');
    temp = loadvar(file,'temp');
    mr = loadvar(file,'mr');
    satmr = loadvar(file,'satmr');
    ent = loadvar(file,'ent');
    satent = loadvar(file,'satent');
    sfrac = loadvar(file,'sfrac');
    ii = loadvar(file,'ii');
    dcin = loadvar(file,'dcin');
    sst = loadvar(file,'sst');
    cape = loadvar( [num2str(year) '_' storm_name '.cape.nc'],'cape');
    mfluxlo = loadvar(file,'mfluxlo');
    mfluxhi = loadvar(file,'mfluxhi');
    mfluxdif = loadvar(file,'mfluxdif');
    hflux = loadvar(file,'hflux');
    rflux = loadvar(file,'rflux');
    entflux = loadvar(file,'entflux');
    numH = loadvar(file,'numH');
    numV = loadvar(file,'numV');
    denV = loadvar(file,'denV');
    fss = loadvar(file,'Fss');
    frs = loadvar(file,'Frs');
    %empM = squeeze(nanmean(nanmean(temp,2),3)); dtemp = temp - tempM;
    %mrM = squeeze(nanmean(nanmean(mr,2),3)); dmr = mr - mrM;
    
    vtend = loadvar([file(1:end-3) '.vort.nc'],'vorttend');
    ttend = loadvar([file(1:end-3) '.vort.nc'],'ttend');
    ctend = loadvar([file(1:end-3) '.vort.nc'],'ctend');
    stend = loadvar([file(1:end-3) '.vort.nc'],'stend');        
    PV = loadvar([file(1:end-3) '.pv.nc'],'pv');        

    sst(sst<0) = NaN;
    
    % analyse and average data and produce table stormData
    VAR3DanalysisCases
    
   
    fprintf(fid,"%3i %s %4i %2i %2i %2i %2i %5.2f %5.2f %4.2f %5.2f %5.2f %5.2f %5.2f %5.2f %5.2f %5.2f %5.2f\n", ...
                  i, storm_name, year, month, day, hour, minute, u3, v3, ...
                  t_ks, lon1, lon2, lat1, lat2, lonC, latC, ii_AV, sf_AV);

    stormN = storm_name;
    newName0 = replace(stormN,stormN(1),upper(stormN(1)));
    indnum = find(newName0<58, 1);
     newName = [newName0(1:indnum-1) ' ' newName0(indnum:end)];
     %%%%%%fprintf(fidL,"Case & 3DVar & SF--II Regime & Campaign & Date &  $t_{ref}$ [Z]  & (Lon,Lat)[deg] & $v_p$ [m/s] \\\\")
     fprintf(fidL,"%3i  &   %s &   %s     & %4i/%02i/%02i & %02i:%02i & (%5.2f, %5.2f)  & (%4.1f, %4.1f) \\\\ \n", ...
                      i, newName, campaign, year, month, day, hour, minute, lonC, latC, u3, v3 );

end
fclose(fid)
fclose(fidL)





% Exclude none
stormDataIn = stormData; 
stormNamesIn = stormNames;

% Select convective cases only
indConvective = stormDataIn(:,64) > 1;  % select convective cases 
indStratiform = stormDataIn(:,64) < -0.5;  % select stratiform cases

% for stratifrom calulation make indStrati positive
indStratiform = indStratiform * 0;

indJuracic13 = stormDataIn(:,64) > 12;  % select stratiform cases
indJuracic10 = stormDataIn(:,64) > 10;  % select stratiform cases
indJuracic = stormDataIn(:,64) > 10;  % select stratiform cases
%stormDataIn = stormData(~indStratiform,:); 
%stormNamesIn = stormNames(~indStratiform);

TITLE = '';

% find data that is above this linear function in (ii,sf) space
x1 = 0.0; y1 = 0.65; x2 = 50.0; y2 = 0.95;
offset1 = 0;  [indAfter1, xout1, fout1] = findIndicesLine(x1,y1,x2,y2,stormDataIn,offset1);
offset2 = +0.12; [indAfter2, xout2, fout2] = findIndicesLine(x1,y1,x2,y2,stormDataIn,offset2); 
offset3 = +0.25; [indAfter3, xout3, fout3] = findIndicesLine(x1,y1,x2,y2,stormDataIn,offset3); 
indAfterH = indAfter1;
indAfterM2 = indAfter2 & ~indAfter1;
indAfterM1 = indAfter3 & ~indAfter2;
indAfterL = ~indAfter3;
prefix = 'COLORS_SFII_';

REGIME = indAfterL*4 + indAfterM1*3 + indAfterM2*2 + indAfterH*1;

% intensifying cases and RI cases
indI = stormDataIn(:,27)>=20; % I cases
indRI = stormDataIn(:,27)>=30; % RI cases


% final figure parameters:
fontSizeEPS = 10;
markerStarSize = 10;
infix = '';

figure
set(gcf,'Position',[30 50 400 300])
var1 = 'ii'; var2 = 'sf';  plotFigureFinalEPS;  plot([0 0],[0.66 0.97],'k--'); xlim([-9 43]); ylim([0.66 0.97]);
print('-dpng', ['FIGURE_' infix 'SFII_scatterPREZ_02.png'])
print('-depsc',['FIGURE_' infix 'SFII_scatterPREZ_02.eps'])


figure
set(gcf,'Position',[70 50 650 250])
t = tiledlayout(1,2,'TileSpacing','Compact','Padding','Compact');
nexttile; var1 = 'pv5to7km'; var2 = 'ii';  plotFigureFinalEPS; plot([0 5],[0 0],'k--'); ylim([-9 43]); xlim([0 5]);   
nexttile; var1 = 'ii'; var2 = 'sf';  plotFigureFinalEPS; plot([0 0],[0.66 0.97],'k--'); xlim([-9 43]); ylim([0.66 0.97]); ylabel('saturation fraction')
print('-dpng', ['FIGURE_' infix 'SFII_scatterPREZ_10.png'])
print('-depsc',['FIGURE_' infix 'SFII_scatterPREZ_10.eps'])

figure
set(gcf,'Position',[70 50 350 250])
t = tiledlayout(1,1,'TileSpacing','Compact','Padding','Compact');
nexttile; var1 = 'pv5to7km'; var2 = 'ii';  plotFigureFinalEPS; plot([0 5],[0 0],'k--'); ylim([-9 43]); xlim([0 5]);   
print('-dpng', ['FIGURE_GRL_scatterPV.png'])
print('-depsc',['FIGURE_GRL_scatterPV.eps'])

figure
set(gcf,'Position',[70 50 650 250])
t = tiledlayout(1,2,'TileSpacing','Compact','Padding','Compact');
nexttile; var1 = 'ii'; var2 = 'sf';  plotFigureFinalEPS; plot([0 0],[0.66 0.97],'k--'); xlim([-9 43]); ylim([0.66 0.97]); ylabel('saturation fraction'); text(15,0.93,'a)','fontsize',12)
nexttile; var1 = 'srcmr'; var2 = 'sf';  plotFigureFinalEPS; plot([0 0],[0.66 0.97],'k--'); ylim([0.66 0.97]); xlim([-50 350]); text(20,0.93,'b)','fontsize',12)
print('-dpng', ['FIGURE_GRL_scatterSFII.png'])
print('-depsc',['FIGURE_GRL_scatterSFII.eps'])

figure
set(gcf,'Position',[70 50 650 250])
t = tiledlayout(1,2,'TileSpacing','Compact','Padding','Compact');
nexttile; var1 = 'SHIPS_shear'; var2 = 'ii';  plotFigureFinalEPS; xlim([0 30]); ylim([-9 43]); plot([0 30],[0 0],'k--'); plot([10.63 10.63],[-8 43],'b--','linewidth',2); text(13,37,'a)','fontsize',12)
nexttile; var1 = 'sst'; var2 = 'ii';  plotFigureFinalEPS; xlim([23 30.5]); ylim([-9 43]); plot([23 30.5],[0 0],'k--'); text(23.5,37,'b)','fontsize',12)
print('-dpng', ['FIGURE_' infix 'SFII_scatterPREZ_11.png'])
print('-depsc',['FIGURE_' infix 'SFII_scatterPREZ_11.eps'])
print('-dpng', ['FIGURE_GRL_scatterEnvironment.png'])
print('-depsc',['FIGURE_GRL_scatterEnvironment.eps'])


%
% plot profiles for two regions of SF--II relationship
indS1 = stormDataIn(:,9) >= 0.85 & stormDataIn(:,9) <= 0.91 & stormDataIn(:,12) >= 5 & stormDataIn(:,12) <= 12;
indS2 = stormDataIn(:,9) <= 0.8 & stormDataIn(:,12) >= 20 ;

figure
set(gcf,'Position',[600 50 700 350])
t = tiledlayout(1,4,'TileSpacing','Compact','Padding','Compact');
% PV
f1 = mean(profiles(indS1,:,9),1);   f2 = mean(profiles(indS2,:,9),1);
nexttile; plot(f2,z,'k','linewidth',3); hold on; plot(f1,z,'r','linewidth',3);
    ylabel('z (km)'); xlabel('PV (pvu)');  xlim([0 2.2]); set(gca,'fontsize',fontSizeEPS); text(0.25,15,'a)','fontsize',12)
% sat ent
f1 = mean(profiles(indS1,:,3),1);   f2 = mean(profiles(indS2,:,3),1);
nexttile; plot(f2,z,'k','linewidth',3); hold on; plot(f1,z,'r','linewidth',3);
    ylabel(''); xlabel('sat. ent. (J K^{-1} kg^{-1})'); xlim([200 320]); set(gca,'fontsize',fontSizeEPS); text(213,15,'b)','fontsize',12)
    %legend([num2str(mean(stormData(indS2,12)),'%4.2f')], ...
    %           [num2str(mean(stormData(indS1,12)),'%4.2f')], 'location','southeast');
% mflux
f1 = mean(profiles(indS1,:,1),1);   f2 = mean(profiles(indS2,:,1),1);
nexttile; plot(f2,z,'k','linewidth',3); hold on; plot(f1,z,'r','linewidth',3);
    ylabel(''); xlabel('mass flux (kg m^{-2} s^{-1})'); xlim([0 0.15]); set(gca,'fontsize',fontSizeEPS); text(0.03,15,'c)','fontsize',12)
%     mfi1 = mean(f1(36:46))-mean(f1(16:26));
%     mfi2 = mean(f2(36:46))-mean(f2(16:26));
%     disp(['Regime 1 MFI: ' num2str(mfi1)])
%     disp(['Regime 2 MFI: ' num2str(mfi2)])
%     legend([num2str(mfi1,'%4.2f')], ...
%                [num2str(mfi2,'%4.2f')],'location','northeast');
%     text(0.1,10,{'mass flux','index'})
% ent
f1 = mean(profiles(indS1,:,2),1);   f2 = mean(profiles(indS2,:,2),1);
nexttile; plot(f2,z,'k','linewidth',3); hold on; plot(f1,z,'r','linewidth',3);
ylabel(''); xlabel('ent. (J K^{-1} kg^{-1})'); xlim([200 320]); set(gca,'fontsize',fontSizeEPS); text(213,15,'d)','fontsize',12)
    %legend( [num2str(mean(stormData(indS2,9)),'%4.2f')], ...
    %           [num2str(mean(stormData(indS1,9)),'%4.2f')], 'location','southeast');
print('-dpng', ['FIGURE_GRL_profiles.png'])
print('-depsc',['FIGURE_GRL_profiles.eps'])


figure
set(gcf,'Position',[70 50 650 500])
t = tiledlayout(2,2,'TileSpacing','Compact','Padding','Compact');
nexttile; var1 = 'pv5to7km'; var2 = 'ii';  plotFigureFinalEPS; plot([0 5],[0 0],'k--'); ylim([-9 43]); xlim([0 5]);   text(1.1,37,'a)','fontsize',12)
nexttile; var1 = 'ii'; var2 = 'sf';  plotFigureFinalEPS; plot([0 0],[0.66 0.97],'k--'); xlim([-9 43]); ylim([0.66 0.97]); ylabel('saturation fraction'); text(12,0.94,'b)','fontsize',12)
nexttile; var1 = 'SHIPS_shear'; var2 = 'ii';  plotFigureFinalEPS; xlim([0 30]); ylim([-9 43]); plot([0 30],[0 0],'k--'); plot([10.63 10.63],[-8 43],'b--','linewidth',2); text(14,37,'c)','fontsize',12)
nexttile; var1 = 'sst'; var2 = 'ii';  plotFigureFinalEPS; xlim([23 30.5]); ylim([-9 43]); plot([23 30.5],[0 0],'k--'); text(24,37,'d)','fontsize',12)
%nexttile; var1 = 'ii'; var2 = 'buoymax';  plotFigureFinalEPS; plot([0 0],[2 9],'k--'); xlim([-9 43]); ylim([2 9]);    
print('-dpng', ['FIGURE_GRL_scatter.png'])
print('-depsc',['FIGURE_GRL_scatter.eps'])
    
figure
set(gcf,'Position',[70 50 650 500])
t = tiledlayout(2,2,'TileSpacing','Compact','Padding','Compact');
nexttile; var1 = 'pv5to7km'; var2 = 'ii';  plotFigureFinalEPS; plot([0 5],[0 0],'k--'); ylim([-9 43]); xlim([0 5]);   text(1.1,37,'a)','fontsize',12)
nexttile; var1 = 'ii'; var2 = 'mflux4km';  plotFigureFinalEPS; plot([0 0],[-0.03 0.31],'k--');  plot([-9 43],[0 0],'k--'); ylim([-0.03 0.31]); xlim([-9 43]); text(20,0.27,'b)','fontsize',12)
nexttile; var1 = 'ii'; var2 = 'mfluxdiff';  plotFigureFinalEPS; plot([0 0],[-0.16 0.05],'k--'); plot([-9 43],[0 0],'k--'); xlim([-9 43]); ylim([-0.16 0.05]); text(-6,0.03,'c)','fontsize',12)
nexttile; var1 = 'srcmr'; var2 = 'sf';  plotFigureFinalEPS; plot([0 0],[0.66 0.97],'k--'); ylim([0.66 0.97]); xlim([-50 350]); text(20,0.93,'d)','fontsize',12)
print('-dpng', ['FIGURE_GRL_scatter2.png'])
print('-depsc',['FIGURE_GRL_scatter2.eps'])
    

% Ian case
indCase = 81:85; nameT = 'Ian (2022)'; nameF = 'ian2022'; 
reportS = '22_IAN'; xlimS = [-1 1.25]; transTime = [2022 9 26 6 0 0];
mfLmax = 0.15; pvLmax = 2.5;
% GET ALL DATA FOR PLOT
helpingScriptGetDataSingleStorm

fontS = 10;
figure
set(gcf,'Position',[60 250 700 600])
t = tiledlayout(4,2,'TileSpacing','Compact','Padding','Compact');
nexttile(1)
    plot(timeR, sstR,'k.-','linewidth',2,'markersize',13); hold on;
    ylabel({'SST (^oC)'})
    text(-.8,29.7,'a)','fontsize',12)
    plot([0 0],[27 32],'k--','linewidth',2)
    xlim(xlimS)
    text(-.3,29.7,'TS','fontsize',12)
    text(.1,29.7,'H','fontsize',12)
    set(gca,'fontsize',fontS)
    ylim([27.8 30.2])
    %text(-.8,29,{'TROPICAL', 'STORM'},'fontsize',13)
    %text(.1,29,'HURRICANE','fontsize',13)
    yyaxis right
    plot(timeReportShear-timeTransition, shipsShear,'b','linewidth',2); hold on;
    plot(timeReportShear-timeTransition, shearHistoric,'b--','linewidth',2); hold on;
    ylim([0 20])
    title(nameT)
    ylabel({'SHIPS', 'shear (kt)'})
    set(gca,'fontsize',fontS,'ycolor','b')
nexttile(3)
    plot(timeReport-timeTransition, windReport*1.943844,'k','linewidth',2); hold on;
    %plot(timeReportShear-timeTransition, shipsShear,'b','linewidth',2); hold on;
    %plot(timeReportShear-timeTransition, shearHistoric,'b--','linewidth',2); hold on;
    plot([0 0],[0 150],'k--','linewidth',2)
    ylim([0 150])
    text(-.8,110,'c)','fontsize',12)
    ylabel({'MSWS (kt)'},'interpreter','tex')
    %xlabel('time (d)')
    set(gca,'Layer', 'Top')
    %ylim([0 80])
    yyaxis right
    plot(timeReport-timeTransition, pressureReport,'r','linewidth',2);
    ylim([930 1015])
    ylabel('pressure (mb)')
    set(gca,'fontsize',10,'ycolor','r')
    xlim(xlimS)
nexttile(5)
    plot([-2 7],[-2 7]*0,'k--','linewidth',1); hold on;
    plot(timeR, iiR,'k.-','linewidth',2,'markersize',13); hold on;
    plot(timeR, dcinR,'b.-','linewidth',2,'markersize',13); hold on;
    ylim([-13 43])
    ylabel({'\color{blue}DCIN, \color{black}instability', 'index (J K^{-1} kg^{-1})'})
    text(-.8,37,'e)','fontsize',12)
    yyaxis right
    plot(timeR, sfR,'r.-','linewidth',2,'markersize',13); hold on;
    set(gca,'fontsize',10,'ycolor','r')
    ylabel('saturation fraction')
    %xlabel('time (d)')
    plot([0 0],[0.66 0.97],'k--','linewidth',2)
    ylim([0.66 0.97])
    xlim(xlimS)
nexttile(7)
    plot(timeR, pv5to7kmR,'k.-','linewidth',2,'markersize',13); hold on;
    plot(timeR, buoymaxR,'b.-','linewidth',2,'markersize',13); hold on;
    ylim([0 6.1])
    ylabel({'5-7 km PV (pvu)','\color{blue}ZMAX (km)'})
    text(-.8,5.5,'g)','fontsize',12)
    yyaxis right
    plot(timeR, mf4kmR,'r.-','linewidth',2,'markersize',13); hold on;
    set(gca,'fontsize',10,'ycolor','r')
    ylabel({'4 km mass', 'flux (kg m^{-2} s^{-1})'})
    xlabel('time (d)')
    plot([0 0],[-0.03 0.31],'k--','linewidth',2)
    ylim([-0.03 0.31])
    xlim(xlimS)

indCase = 5:11; nameT = 'Gaston (2010)'; nameF = 'gaston2010';
reportS = '10_GASTON'; xlimS = [-7 -0.5]; transTime = [2010 9 9 0 0 0];
mfLmax = 0.15; pvLmax = 2.5;
% GET ALL DATA FOR PLOT
helpingScriptGetDataSingleStorm

timeR = timeR+6.281;

nexttile(2)
    plot(timeR, sstR,'k.-','linewidth',2,'markersize',13); hold on;
    ylabel({'SST (^oC)'})
    text(.2,29.8,'b)','fontsize',12)
    xlim([-0.3 6])
    set(gca,'fontsize',fontS)
    ylim([27.8 30.2])
    yyaxis right
    plot(timeReportShear-timeTransition+6.281, shipsShear,'b','linewidth',2); hold on;
    plot(timeReportShear-timeTransition+6.281, shearHistoric,'b--','linewidth',2); hold on;
    ylim([0 20])
    title(nameT)
    ylabel({'SHIPS', 'shear (kt)'})
    set(gca,'fontsize',fontS,'ycolor','b')
nexttile(4)
    plot(timeReport-timeTransition+6.281, windReport*1.943844,'k','linewidth',2); hold on;
    %plot(timeReportShear-timeTransition+6.281, shipsShear,'b','linewidth',2); hold on;
    %plot(timeReportShear-timeTransition+6.281, shearHistoric,'b--','linewidth',2); hold on;
    ylim([0 150])
    text(.5,120,'d)','fontsize',12)
    ylabel({'MSWS (kt)'},'interpreter','tex')
    %xlabel('time (d)')
    set(gca,'Layer', 'Top')
    %ylim([0 80])
    yyaxis right
    plot(timeReport-timeTransition+6.281, pressureReport,'r','linewidth',2);
    ylim([930 1015])
    ylabel('pressure (mb)')
    set(gca,'fontsize',10,'ycolor','r')
    xlim([-0.3 6])
nexttile(6)
    plot([-2 7],[-2 7]*0,'k--','linewidth',1); hold on;
    plot(timeR, iiR,'k.-','linewidth',2,'markersize',13); hold on;
    plot(timeR, dcinR,'b.-','linewidth',2,'markersize',13); hold on;
    ylim([-13 43])
    ylabel({'\color{blue}DCIN, \color{black}instability', 'index (J K^{-1} kg^{-1})'})
    text(.5,37,'f)','fontsize',12)
    yyaxis right
    plot(timeR, sfR,'r.-','linewidth',2,'markersize',13); hold on;
    set(gca,'fontsize',10,'ycolor','r')
    ylabel('saturation fraction')
    %xlabel('time (d)')
    ylim([0.66 0.97])
    xlim([-0.3 6])
nexttile(8)
    plot(timeR, pv5to7kmR,'k.-','linewidth',2,'markersize',13); hold on;
    plot(timeR, buoymaxR,'b.-','linewidth',2,'markersize',13); hold on;
    ylim([0 6.1])
    ylabel({'5-7 km PV (pvu)','\color{blue}ZMAX (km)'})
    text(.5,5.5,'h)','fontsize',12)
    yyaxis right
    plot(timeR, mf4kmR,'r.-','linewidth',2,'markersize',13); hold on;
    set(gca,'fontsize',10,'ycolor','r')
    ylabel({'4 km mass', 'flux (kg m^{-2} s^{-1})'})
    xlabel('time (d)')
    ylim([-0.03 0.31])
    xlim([-0.3 6])

if SAVE_FIGURES ==1
    print('-dpng', ['FIGURE_SFII_profiles_IanGastonUPDATED.png'])
    print('-depsc',['FIGURE_SFII_profiles_IanGastonUPDATED.eps'])
end


    

%  GRL paper figure

% Ian case
indCase = 81:85; nameT = 'Ian (2022)'; nameF = 'ian2022'; 
reportS = '22_IAN'; xlimS = [-1 1.25]; transTime = [2022 9 26 6 0 0];
mfLmax = 0.15; pvLmax = 2.5;
% GET ALL DATA FOR PLOT
helpingScriptGetDataSingleStorm

fontS = 10;
markerS = 15;
figure
set(gcf,'Position',[60 50 700 600])
t = tiledlayout(4,2,'TileSpacing','Compact','Padding','Compact');
nexttile(1)
    plot(timeReport-timeTransition, windReport*1.943844,'r','linewidth',2); hold on;
    %plot(timeReportShear-timeTransition, shipsShear,'b','linewidth',2); hold on;
    %plot(timeReportShear-timeTransition, shearHistoric,'b--','linewidth',2); hold on;
    plot([0 0],[0 150],'k--','linewidth',2)
    ylim([0 150])
    text(-.8,110,'a)','fontsize',12)
    %ylabel({'MSWS (kt)'; '\color{blue}SHIPS shear (kt)'},'interpreter','tex')
    ylabel({'MSWS (kt)'})
    ylabel({'maximum sustained', 'wind speed (kt)'})
    %xlabel('time (d)')
    yyaxis left
    set(gca,'Layer', 'Top','ycolor','r')
    %ylim([0 80])
    yyaxis right
    plot(timeReport-timeTransition, pressureReport,'k','linewidth',2);
    ylim([930 1015])
    ylabel('pressure (mb)')
    title('Ian (2022)')
    set(gca,'fontsize',fontS,'ycolor','k')
    xlim(xlimS)
nexttile(3)
    plot(timeR, sstR,'r.-','linewidth',2,'markersize',markerS); hold on;
    ylabel({'SST (^oC)'})
    plot([0 0],[27 32],'k--','linewidth',2)
    xlim(xlimS)
    yyaxis left
    set(gca,'fontsize',fontS,'ycolor','r')
    ylim([27.8 30.2])
    text(-.8,29.7,'c)','fontsize',12)
    %text(-.8,29,{'TROPICAL', 'STORM'},'fontsize',13)
    %text(.1,29,'HURRICANE','fontsize',13)
    yyaxis right
    plot(timeReportShear-timeTransition, shipsShear,'b','linewidth',2); hold on;
    plot(timeReportShear-timeTransition, shearHistoric,'b--','linewidth',2); hold on;
    ylim([0 20])
    ylabel({'SHIPS', 'shear (kt)'})
    set(gca,'fontsize',fontS,'ycolor','b')
nexttile(5)
    plot(timeR, iiR,'r.-','linewidth',2,'markersize',markerS); hold on;
    ylabel({'instability', 'index (J K^{-1} kg^{-1})'})
    set(gca,'fontsize',fontS,'ycolor','r')
    plot([0 0],[0 43],'k--','linewidth',2)
    ylim([0 43])
    xlim(xlimS)
    yyaxis left
    set(gca,'fontsize',fontS,'ycolor','r')
    text(-.8,36,'e)','fontsize',12)
    yyaxis right
    plot(timeR, pv5to7kmR,'k.-','linewidth',2,'markersize',markerS); hold on;
    ylim([0 2.5])
    ylabel({'5-7 km PV (pvu)'})
    set(gca,'fontsize',fontS,'ycolor','k')
    plot([0 0],[-0.03 0.31],'k--','linewidth',2)
    ylim([0 2.5])
    xlim(xlimS)
nexttile(7)
    plot(timeR, sfR,'b.-','linewidth',2,'markersize',markerS); hold on;
    plot([0 0],[0 1],'k--','linewidth',2)
    set(gca,'fontsize',fontS)
    ylabel('saturation fraction')
    text(-.8,0.92,'g)','fontsize',12)
    xlabel('time (d)')
    ylim([0.66 0.97])
    xlim([-0.3 6])    
    xlim(xlimS)

indCase = 5:11; nameT = 'Gaston (2010)'; nameF = 'gaston2010';
reportS = '10_GASTON'; xlimS = [-7 -0.5]; transTime = [2010 9 9 0 0 0];
mfLmax = 0.15; pvLmax = 2.5;
% GET ALL DATA FOR PLOT
helpingScriptGetDataSingleStorm

timeR = timeR+6.281;

nexttile(2)
    plot(timeReport-timeTransition+6.281, windReport*1.943844,'r','linewidth',2); hold on;
    %plot(timeReportShear-timeTransition+6.281, shipsShear,'b','linewidth',2); hold on;
    %plot(timeReportShear-timeTransition+6.281, shearHistoric,'b--','linewidth',2); hold on;
    ylim([0 150])
    %text(.5,120,'b)','fontsize',12)
    %ylabel({'MSWS (kt)'; '\color{blue}SHIPS shear (kt)'},'interpreter','tex')
    ylabel({'MSWS (kt)'},'interpreter','tex')
    ylabel({'maximum sustained', 'wind speed (kt)'})
    text(.4,110,'b)','fontsize',12)
    yyaxis left
    set(gca,'Layer', 'Top','ycolor','r')
    %ylim([0 80])
    yyaxis right
    plot(timeReport-timeTransition+6.281, pressureReport,'k','linewidth',2);
    ylim([930 1015])
    ylabel('pressure (mb)')
    title('Gaston (2010)')
    set(gca,'fontsize',fontS,'ycolor','k')
    xlim([-0.3 6])
nexttile(4)
    plot(timeR, sstR,'r.-','linewidth',2,'markersize',markerS); hold on;
    ylabel({'SST (^oC)'})
    xlim([-0.3 6])
    yyaxis left
    text(.4,29.7,'d)','fontsize',12)
    set(gca,'fontsize',fontS, 'ycolor','r')
    ylim([27.8 30.2])
    yyaxis right
    plot(timeReportShear-timeTransition+6.281, shipsShear,'b','linewidth',2); hold on;
    plot(timeReportShear-timeTransition+6.281, shearHistoric,'b--','linewidth',2); hold on;
    ylim([0 20])
    ylabel({'SHIPS', 'shear (kt)'})
    set(gca,'fontsize',fontS,'ycolor','b')
nexttile(6)
    plot(timeR, iiR,'r.-','linewidth',2,'markersize',markerS); hold on;
    ylabel({'instability', 'index (J K^{-1} kg^{-1})'})
    set(gca,'fontsize',fontS,'ycolor','r')
    text(.4,36,'f)','fontsize',12)
    ylim([0 43])
    yyaxis left
    set(gca,'fontsize',fontS,'ycolor','r')
    yyaxis right
    plot(timeR, pv5to7kmR,'k.-','linewidth',2,'markersize',markerS); hold on;
    ylim([0 2.5])
    ylabel({'5-7 km PV (pvu)'})
    set(gca,'fontsize',fontS,'ycolor','k')
    ylim([0 2.5])
    xlim([-0.3 6])
nexttile(8)
    plot(timeR, sfR,'b.-','linewidth',2,'markersize',markerS); hold on;
    set(gca,'fontsize',fontS)
    ylabel('saturation fraction')
    text(.4,0.92,'h)','fontsize',12)
    xlabel('time (d)')
    ylim([0.66 0.97])
    xlim([-0.3 6])    

print('-dpng', ['FIGURE_GRL_cases.png'])
print('-depsc',['FIGURE_GRL_cases.eps'])






