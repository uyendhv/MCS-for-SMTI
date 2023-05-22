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
%AS_time = log10(AS_time);
%MCS_time  = log10(MCS_time);
%
%for plot figures
rows = 5:8;
AS_plot_data = AS_time(rows,:);
MCS_plot_data  = MCS_time(rows,:);
%
%create a figure (left,top,width,height) 
figure('position',[50, 50, 800, 500]); 
set(axes, 'Units', 'pixels', 'Position', [100, 100, 500, 300]);
hold on
%
%for AS - lines 1-4
AS_line1 = plot(AS_plot_data(1,:),'--bo','MarkerEdgeColor','k');
AS_line2 = plot(AS_plot_data(2,:),'--bs','MarkerEdgeColor','k','MarkerSize',7);
AS_line3 = plot(AS_plot_data(3,:),'--b>','MarkerEdgeColor','k');
AS_line4 = plot(AS_plot_data(4,:),'--b^','MarkerEdgeColor','k');
%
%for MCS - lines
MCS_line1 = plot(MCS_plot_data(1,:),'--ro','MarkerEdgeColor','k','MarkerFaceColor','k');
MCS_line2 = plot(MCS_plot_data(2,:),'--rs','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',7);
MCS_line3 = plot(MCS_plot_data(3,:),'--r>','MarkerEdgeColor','k','MarkerFaceColor','k');
MCS_line4 = plot(MCS_plot_data(4,:),'--r^','MarkerEdgeColor','k','MarkerFaceColor','k');
%
%=========================================================================
%for legend for p1 = 0.1-0.4
if (rows(1) == 1)
hand = legend([AS_line1,AS_line2,AS_line3,AS_line4,...
               MCS_line1,MCS_line2,MCS_line3,MCS_line4],...
       'AS p_1 = 0.1','AS p_1 = 0.2','AS p_1 = 0.3','AS p_1 = 0.4',...
       'MCS p_1 = 0.1','MCS p_1 = 0.2','MCS p_1 = 0.3','MCS p_1 = 0.4');  
else
hand = legend([AS_line1,AS_line2,AS_line3,AS_line4,...
               MCS_line1,MCS_line2,MCS_line3,MCS_line4],...
       'AS p_1 = 0.5','AS p_1 = 0.6','AS p_1 = 0.7','AS p_1 = 0.8',...
       'MCS p_1 = 0.5','MCS p_1 = 0.6','MCS p_1 = 0.7','MCS p_1 = 0.8');  
end   
%=========================================================================
%for layout of figure
set(hand,'FontSize',13,'Position',[0.76, 0.3, 0.2, 0.5]);  
legend('boxoff')
set(gcf,'color','w');
xlim([1 11]);
xticks(1:11);
xticklabels({'0.0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0'})
ylim([0,70]);
yticks(0:10:70);
%
hx = xlabel('Probability of ties p_2','color','k');
set(hx, 'FontSize', 13)
hxa = get(gca,'XTickLabel');
set(gca,'XTickLabel',hxa,'fontsize',13)
%
hy = ylabel('Average execution time(s)','color','k');
set(hy,'FontSize',13)
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