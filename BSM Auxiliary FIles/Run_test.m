clear all; clc;
% Compile C files before the begining of the simulation
mex asm1.c
mex settler1dv4.c
mex combiner.c
mex carboncombiner.c
mex hyddelayv3.c

% simulate the plant without control: openloop.mdl  
% simulate the plant with active controllers (closed loop) but with no noise
%  and delay on the measurement signals: benchmarkss.mdl
% simulate the plant with active control (closed loop) including noise and
%  delays:  benchmark.mdl 
 
benchmark_scopes % benchmark
benchmarkinit

%% INPUT DATA
% The file asm1init.m contains all variables and parameters with regard to the  ASM1  model,
% settlerinit.m everything for the settlermodell, reginit.m everything for the controllers 
% and so on). If you are running openloop from that subdirectory you instead initiate the 
% system with the command openloopinit;

% input  data  file:
% load constinfluent
load dryinfluent
% load raininfluent
% load storminfluent

load sensornoise

%%  > Run simulation <

%  list of all values for all state variables (closed loop):
statevalues
%  list of all values for all state variables (open loop):
% statevaluesol

%% EXPORT DATA
% exports all the variables that are printed by statevalues into a file called
% "states.mat" and also sets them in the workspace so the benchmark is ready for a new
% simulation: 
stateset    % closed loop
% statesetol  % open loop

% print the values of all performance criteria related to the overall plant
% according to the definitions on the web site
perf_plant 
% BOD: Fig.7 , COD: Fig.4


% print the performance of all the controllers and their control handles
perf_controller













