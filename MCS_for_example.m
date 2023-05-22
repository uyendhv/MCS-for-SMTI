clc
clear vars
clear all
close all
%
 filename1 = ['examples\I(8,0.5,0.5)-1.mat'];
 load(filename1,'men_rank_list','women_rank_list');
 filename2 = ['examples\M8-1.mat'];
 load(filename2,'M');
 %men_rank_list
 %women_rank_list
 %M
 [f,nbp,nsg,BPs] = number_of_blocking_pairs(men_rank_list,women_rank_list,M);
 %
 [f_time,f_cost,f_stable,f_iter,f_reset]= AS(men_rank_list,women_rank_list,M);
 [f_time,f_cost,f_stable,f_iter,f_reset] = MCS(men_rank_list,women_rank_list,M);
 debug = 1;
 
 