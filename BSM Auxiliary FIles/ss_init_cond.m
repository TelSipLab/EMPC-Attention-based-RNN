load('settler_new_ss.mat')
load('settler_old_ss.mat')
load('ss_matrix.mat')
load('hyd_del_new_ss.mat')
load('hyd_del_old_ss.mat')
load('hyd_del_ss.mat')

% --- Hydraulic Delays Initial Conditions for Steady State --- %
% XINITDELAY_OLD = hyd_del_old_ss;
% XINITDELAY_NEW = hyd_del_new_ss;
% ------------------------------------------------------------ %

% ---- Reactors' Steady State Initial Conditions --- %
XINIT1 = ss_matrix(1,:);
XINIT2 = ss_matrix(2,:);
XINIT3 = ss_matrix(3,:);
XINIT4 = ss_matrix(4,:);
XINIT5 = ss_matrix(5,:);
XINIT6 = ss_matrix(6,:);
XINIT7 = ss_matrix(7,:);
XINIT8 = ss_matrix(8,:);
XINIT9 = ss_matrix(9,:);
% ------------------------------------------------- %

% --- Settlers' Steady State Initial Conditions --- %
SETTLERINIT_new = settler_new_ss;
SETTLERINIT_old = settler_old_ss;
% ------------------------------------------------- %
