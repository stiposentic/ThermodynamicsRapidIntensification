f1 = mean(profiles(points1,:,fieldN),1);  f2 = mean(profiles(points2,:,fieldN),1);
f3 = mean(profiles(points3,:,fieldN),1);  f4 = mean(profiles(points4,:,fieldN),1);
f5 = mean(profiles(points5,:,fieldN),1); % stratiform

if fieldN >8
    fieldN = fieldN-1;
end

% if fieldN == 9 
%     f1 = f1/1000;
%     f2 = f2/1000;
%     f3 = f3/1000;
%     f4 = f4/1000;
%     f5 = f5/1000;
% end

size(f1)

%subplot(subY,subX,subN)
nexttile(subN)
plot(f1,z,'k','linewidth',3); hold on
%plot(f2,z,'color',[0 0.4470 0.7410],'linewidth',2);
%plot(f3,z,'color',[0.9290 0.6940 0.1250],'linewidth',2);
plot(f3,z,'color','r','linewidth',3);
%plot(f4,z,'color',[0.8500 0.3250 0.0980],'linewidth',2);
plot(f5,z,'k--','linewidth',2);
if fieldN ==1 
    plot(f5*0,z,'k--','linewidth',1);
    mfi1 = mean(f1(36:46))-mean(f1(16:26));
    mfi2 = mean(f2(36:46))-mean(f2(16:26));
    mfi3 = mean(f3(36:46))-mean(f3(16:26));
    mfi4 = mean(f4(36:46))-mean(f4(16:26));
    disp(['Regime 1 MFI: ' num2str(mfi1)])
    disp(['Regime 2 MFI: ' num2str(mfi2)])
    disp(['Regime 3 MFI: ' num2str(mfi3)])
    disp(['Regime 4 MFI: ' num2str(mfi4)])
    legend([num2str(mfi1,'%4.2f')], ...
               [num2str(mfi2,'%4.2f')], ...
               [num2str(mfi3,'%4.2f')], ...
               [num2str(mfi4,'%4.2f')],'location','northeast');
    text(0.1,10,{'mass flux','index'})
end

if fieldN==2
    legend([num2str(mean(stormData(points1,9)),'%4.2f')], ...
               [num2str(mean(stormData(points2,9)),'%4.2f')], ...
               [num2str(mean(stormData(points3,9)),'%4.2f')], ...
               [num2str(mean(stormData(points4,9)),'%4.2f')],'location','southeast');
    text(320,6,{'saturation','fraction'})
end
if fieldN==3
    legend( [num2str(mean(stormData(points1,12)),'%4.2f')], ...
               [num2str(mean(stormData(points2,12)),'%4.2f')], ...
               [num2str(mean(stormData(points3,12)),'%4.2f')], ...
               [num2str(mean(stormData(points4,12)),'%4.2f')],'location','southeast');
    text(320,6,{'instability','index'})
end

ylim([0 16])
set(gca,'fontsize',fontS)