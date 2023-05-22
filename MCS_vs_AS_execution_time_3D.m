clc
clear vars
clear all
close all
n = 500;
%==========================================================================
%AS algorithm
AS_time = [];
for p1 = 0.1:0.1:0.8
    f_avg_time = [];
    for p2 = 0.0:0.1:1.0
        %load to file for averaging results
        filename = ['output500\AS(',num2str(n),',',num2str(p1,'%.1f'),',',num2str(p2,'%.1f'),').mat'];
        load(filename,'f_results');
        f_avg_time(end+1) = mean(f_results(:,1));
    end
    AS_time = [AS_time;f_avg_time];
end
%==========================================================================
%for MCS
MCS_time = [];
for p1 = 0.1:0.1:0.8
    f_avg_time = [];
    for p2 = 0.0:0.1:1.0
        %load to file for averaging results
        filename = ['output500\MCS(',num2str(n),',',num2str(p1,'%.1f'),',',num2str(p2,'%.1f'),').mat'];
        load(filename,'f_results');
        f_avg_time(end+1) = mean(f_results(:,1));
    end
    MCS_time = [MCS_time;f_avg_time];
end
%==========================================================================
%
AS_time = log10(AS_time);
MCS_time  = log10(MCS_time);
%
%for plot figures
rows = 1:8;
AS_plot_data = AS_time(rows,:);
MCS_plot_data  = MCS_time(rows,:);
%
%create a figure (left,top,width,height) 
figure('position',[50, 50, 1000, 500]); 
set(axes, 'Units', 'pixels', 'Position', [100, 100, 600, 300]);
hold on
%---------------------------------------------------------------
[P2,P1] = meshgrid([0.0:0.1:1.0],[0.1:0.1:0.8]);
surf(P2,P1,AS_plot_data);
surf(P2,P1,MCS_plot_data);
%
set(gcf,'color','w');
xticks(0.0:0.1:1.0);
yticks(0.1:0.1:0.8);
%
hx = xlabel('Probability of ties p_2','color','k');
set(hx, 'FontSize', 13)
hxa = get(gca,'XTickLabel');
set(gca,'XTickLabel',hxa,'fontsize',13)
%
hy = ylabel('Probability of incomplete lists p_1','color','k');
set(hy, 'FontSize', 13)
hxb = get(gca,'YTickLabel');
set(gca,'YTickLabel',hxb,'fontsize',13)
%
hz = zlabel('Average execution time(s)','color','k');
set(hz,'FontSize',13)
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