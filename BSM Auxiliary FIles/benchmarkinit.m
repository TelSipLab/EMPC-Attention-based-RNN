clear all; clc

dt = 1; % Define the sampling time of the controller. You may choose between 
        % 1,2 & 4 . According to your selection the apropriate data set 
        % will be selected. 
        
load dryinfluent;
load storminfluent;
load raininfluent;
load constinfluent;
load sensornoise;

asm1init;
settler1dinit_new;
settler1dinit_old;
reginit;
sensorinit;
%eqinit;

CONSTINFLUENT = InfluentModify(CONSTINFLUENT, 1, SNH_ratio, Qin0_ratio);
DRYINFLUENT   = InfluentModify(DRYINFLUENT, 1, SNH_ratio, Qin0_ratio);
RAININFLUENT  = InfluentModify(RAININFLUENT, 1, SNH_ratio, Qin0_ratio);
STORMINFLUENT = InfluentModify(STORMINFLUENT, 1, SNH_ratio, Qin0_ratio);

Ts = (DRYINFLUENT(2,1)-DRYINFLUENT(1,1))*dt;

% save_ss_bsm_sparta; % Save Steady State Values for all state variables
ss_init_cond;  % Initialize the plant at Steady State

% Save_Steps;

step_change_day = 100;
simulation_days = 150;
% dead_time_threshold = 0.02;
% dead_time_multiplier = 0.01;
numstates = 17;