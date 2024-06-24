


% this script gets varN1, label1, varN2, label2
% from the stormData table
plotFigureShowersAuxiliary

%if strcmp(var1,'timeR')
%    plot([0 0],[min(stormDataIn(:,varN2)) max(stormDataIn(:,varN2))],...
%        'k--','linewidth',2); hold on;    
%end


%plot(stormDataIn(:,varN1),stormDataIn(:,varN2),'k.','color',[0.7 0.7 0.7],'markersize',19); hold on;

% compute correlation coefficients between the extracted variables
xx = stormDataIn(~indStratiform & ~indJuracic,varN1);
yy = stormDataIn(~indStratiform & ~indJuracic,varN2);
indNaNxx = ~isnan(xx);
indNaNyy = ~isnan(yy);
ind = indNaNxx & indNaNyy;
R = corr2(xx(ind), yy(ind));
[R,P] = corrcoef(xx(ind), yy(ind));
disp([var1 '-' var2 ', r = ' num2str(R(2,1)) ', p = ' num2str(P(2,1))])

% plot Gaston cases with a line
%plot(stormDataIn(5:11,varN1),stormDataIn(5:11,varN2),'k-','linewidth',2); hold on;
%plot(stormDataIn(81:85,varN1),stormDataIn(81:85,varN2),'r-','linewidth',2); hold on;


% all symbols circles filled
plot(stormDataIn(indAfterM2 & ~indStratiform & ~indJuracic,varN1),stormDataIn(indAfterM2 & ~indStratiform & ~indJuracic,varN2),'r.','color',[0 0.4470 0.7410],'markersize',19); hold on;
plot(stormDataIn(indAfterH & ~indStratiform & ~indJuracic,varN1),stormDataIn(indAfterH & ~indStratiform & ~indJuracic,varN2),'r.','color',[0 0 0],'markersize',19); hold on;
plot(stormDataIn(indAfterM1 & ~indStratiform & ~indJuracic,varN1),stormDataIn(indAfterM1 & ~indStratiform & ~indJuracic,varN2),'r.','color',[0.9290 0.6940 0.1250],'markerfacecolor',[0.9290 0.6940 0.1250],'markersize',19); hold on;
plot(stormDataIn(indAfterL & ~indStratiform & ~indJuracic,varN1),stormDataIn(indAfterL & ~indStratiform & ~indJuracic,varN2),'r.','color',[0.8500 0.3250 0.0980],'markerfacecolor',[0.8500 0.3250 0.0980],'markersize',19); hold on;

plot(stormDataIn(~indStratiform,varN1),stormDataIn(~indStratiform,varN2),'k.','color',[0 0 0],'markersize',19); hold on;

% if varN1==12 && varN2==9
%     f = @(x) y1+(x-x1)*(y2-y1)/(x2-x1);
%     plot([5 40],f([5 40]),'k--')
%     plot([0 25],f([0 25])+offset2,'k--')
%     plot([-5 15],f([-5 15])+offset3,'k--')
% end

if STRATI_SINGLE_AVERAGE ~=1
% insert RapidIntensification stars
plot(stormDataIn(indI,varN1),stormDataIn(indI,varN2),'kpentagram','markerfacecolor','g','markersize',markerStarSize);
plot(stormDataIn(indRI,varN1),stormDataIn(indRI,varN2),'kpentagram','markerfacecolor','m','markersize',markerStarSize);
% sally2 case added manually, position 59
plot(stormDataIn(59,varN1),stormDataIn(59,varN2),'kpentagram','markerfacecolor','m','markersize',markerStarSize);
%plot(stormDataIn(59,varN1),stormDataIn(59,varN2),'kpentagram','markerfacecolor','g','markersize',markerStarSize);
end

% special symbols here:
%plot(stormDataIn(indAfterM2 & ~indStratiform & ~indJuracic,varN1),stormDataIn(indAfterM2 & ~indStratiform & ~indJuracic,varN2),'r.','color',[0 0.4470 0.7410],'markersize',19); hold on;
%plot(stormDataIn(indAfterH & ~indStratiform & ~indJuracic,varN1),stormDataIn(indAfterH & ~indStratiform & ~indJuracic,varN2),'r.','color',[0 0 0],'markersize',19); hold on;
%plot(stormDataIn(indAfterM1 & ~indStratiform & ~indJuracic,varN1),stormDataIn(indAfterM1 & ~indStratiform & ~indJuracic,varN2),'rs','color',[0.9290 0.6940 0.1250],'markerfacecolor',[0.9290 0.6940 0.1250],'markersize',9); hold on;
%plot(stormDataIn(indAfterL & ~indStratiform & ~indJuracic,varN1),stormDataIn(indAfterL & ~indStratiform & ~indJuracic,varN2),'rdiamond','color',[0.8500 0.3250 0.0980],'markerfacecolor',[0.8500 0.3250 0.0980],'markersize',9); hold on;

% to plot case names, uncomment the following lines 
%ddd = find(~indStratiform  & ~indJuracic);
%for nn = 1:size(ddd,1)
%    i=ddd(nn);
%    %1:size(stormDataIn,1)
%    name = stormNamesIn{i};
%    %text(stormDataIn(i,varN1)+0.3,stormDataIn(i,varN2),name);
%    text(stormDataIn(i,varN1),stormDataIn(i,varN2),name);
%end



% for i = 1:size(stormDataIn,1)
%     name = stormNamesIn{i};
%     text(stormDataIn(i,varN1)+0.01,stormDataIn(i,varN2),name);
% end


xlabel(label1)
ylabel(label2)
title(TITLE)

set(gca,'fontsize',fontSizeEPS)

