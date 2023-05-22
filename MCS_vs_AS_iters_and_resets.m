clc
clear vars
clear all
close all
n = 500;
%==========================================================================
%AS algorithm
AS_iters = [];
AS_rsets = [];
for p1 = 0.1:0.1:0.8
    f_avg_iter = [];
    f_avg_rset = [];
    for p2 = 0.0:0.1:1.0
        %load to file for averaging results
        filename = ['output500\AS(',num2str(n),',',num2str(p1,'%.1f'),',',num2str(p2,'%.1f'),').mat'];
        load(filename,'f_results');
        f_avg_iter(end+1) = mean(f_results(:,4));
        f_avg_rset(end+1) = mean(f_results(:,5));
    end
    AS_iters = [AS_iters;f_avg_iter];
    AS_rsets = [AS_rsets;f_avg_rset];
end
%==========================================================================
%for MCS
MCS_iters = [];
MCS_rsets = [];
for p1 = 0.1:0.1:0.8
    f_avg_iter = [];
    f_avg_rset = [];
    for p2 = 0.0:0.1:1.0
        %load to file for averaging results
        filename = ['output500\MCS(',num2str(n),',',num2str(p1,'%.1f'),',',num2str(p2,'%.1f'),').mat'];
        load(filename,'f_results');
        f_avg_iter(end+1) = mean(f_results(:,4));
        f_avg_rset(end+1) = mean(f_results(:,5));
    end
    MCS_iters = [MCS_iters;f_avg_iter];
    MCS_rsets = [MCS_rsets;f_avg_rset];
end
%==========================================================================
%plot 2D
%for plot figures
AS_iters = AS_iters';
AS_rsets = AS_rsets';
%
MCS_iters = MCS_iters';
MCS_rsets = MCS_rsets';
%
% type = 1;
% AS_plot_data = AS_iters;
% MCS_plot_data = MCS_iters;
%
type = 2;
AS_plot_data = log10(AS_rsets);
MCS_plot_data = log10(MCS_rsets);
%
%create a figure (left,top,width,height) 
figure('position',[50, 50, 800, 500]); 
set(axes, 'Units', 'pixels', 'Position', [100, 100, 500, 300]);
hold on
%
%for AS - lines 1-5
AS_line1 = plot(AS_plot_data(3,:),'--bs','MarkerEdgeColor','k','MarkerSize',7);
AS_line2 = plot(AS_plot_data(5,:),'--b>','MarkerEdgeColor','k');
AS_line3 = plot(AS_plot_data(7,:),'--b<','MarkerEdgeColor','k');
AS_line4 = plot(AS_plot_data(9,:),'--bv','MarkerEdgeColor','k');
AS_line5 = plot(AS_plot_data(11,:),'--b^','MarkerEdgeColor','k');
%
%for MMC - lines
if (type == 1)
    MCS_line1 = plot(MCS_plot_data(3,:),'--rs','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',7);
    MCS_line2 = plot(MCS_plot_data(5,:),'--r>','MarkerEdgeColor','k','MarkerFaceColor','k');
    MCS_line3 = plot(MCS_plot_data(7,:),'--r<','MarkerEdgeColor','k','MarkerFaceColor','k');
    MCS_line4 = plot(MCS_plot_data(9,:),'--rv','MarkerEdgeColor','k','MarkerFaceColor','k');
    MCS_line5 = plot(MCS_plot_data(11,:),'--r^','MarkerEdgeColor','k','MarkerFaceColor','k');
    %
    hand = legend([AS_line1,AS_line2,AS_line3,AS_line4,AS_line5,...
                   MCS_line1, MCS_line2, MCS_line3, MCS_line4, MCS_line5],...
                   'AS p_2 = 0.2','AS p_2 = 0.4','AS p_2 = 0.6','AS p_2 = 0.8','AS p_2 = 1.0',...
                   'MCS p_2 = 0.2','MCS p_2 = 0.4','MCS p_2 = 0.6','MCS p_2 = 0.8','MCS p_2 = 1.0');  
else
    MCS_line5 = plot(MCS_plot_data(11,:),'--r^','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',7);
    %
    hand = legend([AS_line1,AS_line2,AS_line3,AS_line4,AS_line5,...
                   MCS_line5],...
                   'AS p_2 = 0.2','AS p_2 = 0.4','AS p_2 = 0.6','AS p_2 = 0.8','AS p_2 = 1.0',...
                   'MCS p_2 = 1.0');  
end
%
%=========================================================================
%for layout of figure
set(hand,'FontSize',13,'Position',[0.76, 0.3, 0.2, 0.5]);  
legend('boxoff')
set(gcf,'color','w');
%xlim([1 11]);
%xticks(1:11);
xticklabels({'0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8'})
if (type ==1)
    ylim([0,3100]);
end
%yticks(10:5:50);
%
hx = xlabel('Probability of incomplete list p_1','color','k');
set(hx, 'FontSize', 13)
hxa = get(gca,'XTickLabel');
set(gca,'XTickLabel',hxa,'fontsize',13)
%
if (type == 1)
    hy = ylabel('Average number of iterations','color','k');
else
    hy = ylabel('Average number of resets (log10 scale)','color','k');
end
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
%}