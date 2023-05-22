clc
clear vars
clear all
close all
%==========================================================================
%for run and save fy to file
%{
n =700;
p1 = 0.5;
for p2 = 0.0:0.5:1.0
    %
    filename1 = ['input700\I(',num2str(n),',',num2str(p1,'%.1f'),',',num2str(p2,'%.1f'),')-1.mat'];
    load(filename1,'men_rank_list','women_rank_list','M');
    %
    [f_time,f_cost,f_stable,f_iter,f_reset,fy] = MCS(men_rank_list,women_rank_list,M);
    %
    filename2 = ['output700\MCS_FY(',num2str(n),',',num2str(p1,'%.1f'),',',num2str(p2,'%.1f'),').mat'];
    save(filename2,'fy');
    fprintf('\nI(%d,%0.1f,%0.1f)-1: size(fy) = %d',n,p1,p2,size(fy,2));
end
%}
%==========================================================================
%{%
%for plot fy
%create a figure (left,top,width,height) 
figure('position',[50, 50, 800, 500]); 
set(axes, 'Units', 'pixels', 'Position', [100, 100, 500, 300]);
hold on
%==========================================================================
n = 700;
p1 = 0.5;
%
p2 = 0.0;
filename = ['output700\MCS_FY(',num2str(n),',',num2str(p1,'%.1f'),',',num2str(p2,'%.1f'),').mat'];
load(filename,'fy');
MCS_line1 = plot(fy(2,:),'--ro','MarkerEdgeColor','r','MarkerIndices', 1:200:size(fy,2));
%
p2 = 0.5;
filename = ['output700\MCS_FY(',num2str(n),',',num2str(p1,'%.1f'),',',num2str(p2,'%.1f'),').mat'];
load(filename,'fy');
MCS_line2 = plot(fy(2,:),'--r^','MarkerEdgeColor','r','MarkerIndices', 100:200:size(fy,2));
%---------------
p2 = 1.0;
filename = ['output700\MCS_FY(',num2str(n),',',num2str(p1,'%.1f'),',',num2str(p2,'%.1f'),').mat'];
load(filename,'fy');
MCS_line3 = plot(fy(2,:),'--r*','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerIndices', 1:100:size(fy,2));
%==========================================================================
%
n = 900;
p1 = 0.5;
%
p2 = 0.0;
filename = ['output700\MCS_FY(',num2str(n),',',num2str(p1,'%.1f'),',',num2str(p2,'%.1f'),').mat'];
load(filename,'fy');
MCS_line4 = plot(fy(2,:),'--bv','MarkerEdgeColor','b','MarkerIndices', 1:200:size(fy,2),'MarkerSize',7);
%
p2 = 0.5;
filename = ['output700\MCS_FY(',num2str(n),',',num2str(p1,'%.1f'),',',num2str(p2,'%.1f'),').mat'];
load(filename,'fy');
MCS_line5 = plot(fy(2,:),'--bs','MarkerEdgeColor','b','MarkerIndices', 100:200:size(fy,2),'MarkerSize',7);
%---------------
p2 = 1.0;
filename = ['output700\MCS_FY(',num2str(n),',',num2str(p1,'%.1f'),',',num2str(p2,'%.1f'),').mat'];
load(filename,'fy');
%y = fy(2,:);
MCS_line6 = plot(fy(2,:),'--bh','MarkerEdgeColor','b','MarkerFaceColor','b','MarkerIndices', 1:100:size(fy,2));
%============================================================================================================
%
n = 1200;
p1 = 0.5;
%
p2 = 0.0;
filename = ['output700\MCS_FY(',num2str(n),',',num2str(p1,'%.1f'),',',num2str(p2,'%.1f'),').mat'];
load(filename,'fy');
MCS_line7 = plot(fy(2,:),'--kp','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerIndices', 1:200:size(fy,2));
%
p2 = 0.5;
filename = ['output700\MCS_FY(',num2str(n),',',num2str(p1,'%.1f'),',',num2str(p2,'%.1f'),').mat'];
load(filename,'fy');
MCS_line8 = plot(fy(2,:),'--kd','MarkerEdgeColor','k','MarkerIndices', 100:200:size(fy,2));
%---------------
p2 = 1.0;
filename = ['output700\MCS_FY(',num2str(n),',',num2str(p1,'%.1f'),',',num2str(p2,'%.1f'),').mat'];
load(filename,'fy');
MCS_line9 = plot(fy(2,:),'--k<','MarkerEdgeColor','k','MarkerIndices', 1:100:size(fy,2));
%============================================================================================================
%
hand = legend([MCS_line7,MCS_line8,MCS_line9,MCS_line4,MCS_line5,MCS_line6,MCS_line1,MCS_line2,MCS_line3],...
              'n = 1200, p_2 = 0.0','n = 1200, p_2 = 0.5','n = 1200, p_2 = 1.0',...              
              'n =   900, p_2 = 0.0','n =   900, p_2 = 0.5','n =   900, p_2 = 1.0',...
              'n =   700, p_2 = 0.0','n =   700, p_2 = 0.5','n =   700, p_2 = 1.0');
%
hx = xlabel('Iterations','color','k');
hy = ylabel('Cost of matchings: f(M) = #BP + #SG');
%for layout of figure
set(hand,'FontSize',13,'Position',[00.7475 0.2 0.25 0.6]);  
legend('boxoff');
%
set(gcf,'color','w');
set(hx, 'FontSize', 13)
hxa = get(gca,'XTickLabel');
set(gca,'XTickLabel',hxa,'fontsize',13)
%
set(hy,'FontSize',13)
xlim([0,2250]);
%
grid on
ax = gca;
set(ax,'GridLineStyle','--') 
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.GridColor = [0 0 0];
ax.GridLineStyle = '--';
ax.GridAlpha = 0.4;
box on
%}
