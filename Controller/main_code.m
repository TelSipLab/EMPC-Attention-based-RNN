% ---------------------------------- %
%                                    %
% Nonlinear Model Predictive Control %
% Benchmark Simulation Model No. 1   %
%                                    %
% Author : Teo Protoulis             %
% ---------------------------------- %

% --- Define & Initialize BSM Original & Reduced Parameters --- %
benchmarkinit
DRYINFLUENT_REDUCED   = DRYINFLUENT(:,[1 3 5 6 7 9 10 11 16]);
RAININFLUENT_REDUCED  = RAININFLUENT(:,[1 3 5 6 7 9 10 11 16]);
STORMINFLUENT_REDUCED = STORMINFLUENT(:,[1 3 5 6 7 9 10 11 16]);

flow_predictions = table2array(readtable("Predictions_DRY_QInfluent_Model_ATT_RNN.csv"));
clc

flow_predictions = flow_predictions(:,9:16);

options = optimoptions('fmincon','Algorithm','sqp','Display','none', ...
    'ScaleProblem',true,'ConstraintTolerance',1e-6,'MaxFunctionEvaluations',10000, ...
    'OptimalityTolerance',1e-6,'MaxIterations',400,'UseParallel',true);

tSim_start = tic;

% --- Declare & Initialize Essential Variables --- %
t = 0;
num_of_ctrl_vars = 4;

% --- Controller Parameters --- %
pred_hours = 2;
pred_hor = 4*pred_hours;
ctrl_hor = pred_hor;
R = [1 10 1 10]; % Control Penalty Vector
slack_weight = 1.e7;

Qa_new_DV = 2000;
KLa4_DV = 30;
Qa_old_DV = 2000;
KLa8_DV = 30;

DV_init = zeros(pred_hor,num_of_ctrl_vars+8);
lb = zeros(pred_hor,num_of_ctrl_vars+8);
lb(:,1) = -Qa_new_DV;
lb(:,2) = -KLa4_DV;
lb(:,3) = -Qa_old_DV;
lb(:,4) = -KLa8_DV;
ub = -lb;
ub(:,5) = 1;
ub(:,[6 7 8 10 11 12]) = Inf;
ub(:,9) = 1;

Qa_new_min = 0;
KLa4_min   = 20;
Qa_old_min = 0;
KLa8_min   = 20;

Qa_new_max = 9864;
KLa4_max   = 152;
Qa_old_max = 10632;
KLa8_max   = 182;

u_min = [Qa_new_min KLa4_min Qa_old_min KLa8_min];
u_max = [Qa_new_max KLa4_max Qa_old_max KLa8_max];

u_prev = [2.6667e+03 50 5.3333e+03 50]; % Steady State Values
states = [XINITDELAY([2 4 5 6 8 9 10 15]) XINITDELAY_NEW([2 4 5 6 8 9 10 15]) XINITDELAY_OLD([2 4 5 6 8 9 10 15]) ...
    XINIT1([2 4 5 6 8 9 10 15]) XINIT2([2 4 5 6 8 9 10 15]) XINIT3([2 4 5 6 8 9 10 15]) XINIT4([2 4 5 6 8 9 10 15]) ...
    XINIT5([2 4 5 6 8 9 10 15]) XINIT6([2 4 5 6 8 9 10 15]) XINIT7([2 4 5 6 8 9 10 15]) XINIT8([2 4 5 6 8 9 10 15]) ...
    XINIT9([2 4 5 6 8 9 10 15])];

total_steps = 1344;

time = zeros(total_steps,1);

reactor1 = zeros(total_steps,15);
reactor2 = zeros(total_steps,15);
reactor3 = zeros(total_steps,15);
reactor4 = zeros(total_steps,15);
reactor5 = zeros(total_steps,15);
reactor6 = zeros(total_steps,15);
reactor7 = zeros(total_steps,15);
reactor8 = zeros(total_steps,15);
reactor9 = zeros(total_steps,15);

Qa_new_imp  = zeros(total_steps,1);
KLa4_imp    = zeros(total_steps,1);
Qa_old_imp  = zeros(total_steps,1);
KLa8_imp    = zeros(total_steps,1);

Qa_new_implemented = zeros(total_steps,1);
Qa_new_implemented_prev = 0;
Qa_old_implemented = zeros(total_steps,1);
Qa_old_implemented_prev = 0;

snh_eff = zeros(total_steps,1);
cod_eff = zeros(total_steps,1);
% bod_eff = zeros(total_steps,1);

SNKj_eff = zeros(total_steps,1);
N_total  = zeros(total_steps,1);
recirculation_new = zeros(total_steps,15);
recirculation_old = zeros(total_steps,15);
inpart = zeros(total_steps,15);

complete_eff = zeros(total_steps,15);
settlerpart_new  = zeros(total_steps,113);
settlerpart_old  = zeros(total_steps,113);

fval = zeros(total_steps,1);
exitflag = zeros(total_steps,1);
lambda = zeros(total_steps,1);
grad = zeros(total_steps,ctrl_hor*(num_of_ctrl_vars+8));
hessian = {};
optim_time = zeros(total_steps,1);

snh_eff_violation_counter = 0;
sno_eff_violation_counter = 0;
cod_eff_violation_counter = 0;
% bod_eff_violation_counter = 0;

for k = 1:total_steps

    tStart = tic;
    fprintf('\nSimulation is at time step: %d/%d\n',k,total_steps)

    % --- Store Essential Signals --- %
    [A,b] = linear_inequality_constraints(ctrl_hor,u_max,u_min,u_prev,num_of_ctrl_vars);

    % --- Compute Control Signal --- %
    nonlcon = @(DV_slack)nonlinear_constraints(DV_slack,states,u_prev,Ts,ctrl_hor,pred_hor, ...
        k,STORMINFLUENT_REDUCED,flow_predictions);
    fmincon_target = @(DV_slack)(obj_func(u_prev,states,DV_slack,pred_hor,ctrl_hor,R,Ts, ...
        k,slack_weight));
    [DV_optimal,fval(k),exitflag(k),output,lambda,grad(k,:),hessian{1,k}] = ...
        fmincon(fmincon_target,DV_init,A,b,[],[],lb,ub,nonlcon,options);

    iterations(k,1) = output.iterations;
    funCount(k,1) = output.funcCount;
    lssteplength(k,1) = output.lssteplength;
    constrviolation(k,1) = output.constrviolation;
    firstorderopt(k,1) = output.firstorderopt;
    
    % --- New Line Inputs --- %
    Qa_new = DV_optimal(1) + u_prev(1);
    KLa4   = DV_optimal(1+ctrl_hor) + u_prev(2);

    if Qa_new < 0
        Qa_new = 0;
    elseif Qa_new > 9864
        Qa_new = 9864;
    end

    if KLa4 > KLa4_max
        KLa4 = KLa4_max;
    elseif KLa4 < KLa4_min
        KLa4 = KLa4_min;
    end
    % ----------------------- %
    
    % --- Old Line Inputs --- %
    Qa_old = DV_optimal(1+(2*ctrl_hor)) + u_prev(3);
    KLa8   = DV_optimal(1+(3*ctrl_hor)) + u_prev(4);

    if Qa_old < Qa_old_min
        Qa_old = Qa_old_min;
    elseif Qa_old > Qa_old_max
        Qa_old = Qa_old_max;
    end

    if KLa8 > KLa8_max
        KLa8 = KLa8_max;
    elseif KLa8 < KLa8_min
        KLa8 = KLa8_min;
    end
    % ----------------------- %

    u_prev = [Qa_new KLa4 Qa_old KLa8];
    DV_init = [DV_optimal(2:end,:) ; DV_optimal(end,:)];

    % ----------------- Simulate Plant ----------------- %
    INFLUENT = STORMINFLUENT(k,2:end);

    sim("benchmarkss_sparta_openloop_02_R2022a.slx");

    XINITDELAY = ASinput(end,:);
    XINITDELAY_NEW = ASinputnew(end,:);
    XINITDELAY_OLD = ASinputold(end,:);
    
    XINIT1 = reac1(end,:);
    XINIT2 = reac2(end,:);
    XINIT3 = reac3(end,:);
    XINIT4 = reac4(end,:);
    XINIT5 = reac5(end,:);
    XINIT6 = reac6(end,:);
    XINIT7 = reac7(end,:);
    XINIT8 = reac8(end,:);
    XINIT9 = reac9(end,:);
    
    states = [ ASinput(end,[2 4 5 6 8 9 10 15]) ASinputnew(end,[2 4 5 6 8 9 10 15]) ASinputold(end,[2 4 5 6 8 9 10 15]) ...
               reac1(end,[2 4 5 6 8 9 10 15]) reac2(end,[2 4 5 6 8 9 10 15]) reac3(end,[2 4 5 6 8 9 10 15]) ...
               reac4(end,[2 4 5 6 8 9 10 15]) reac5(end,[2 4 5 6 8 9 10 15]) reac6(end,[2 4 5 6 8 9 10 15]) ...
               reac7(end,[2 4 5 6 8 9 10 15]) reac8(end,[2 4 5 6 8 9 10 15]) reac9(end,[2 4 5 6 8 9 10 15]) ];
    
    SETTLERINIT_new = settlernew(end,[32:41,44:end]);
    SETTLERINIT_old = settlerold(end,[32:41,44:end]);

    snh_eff(k) = effluent_combined(end,10);
    cod_eff(k) = COD_effluent(end);
    % bod_eff(k) = BOD_effluent(end);

    reactor1(k,:) = reac1(end,:);
    reactor2(k,:) = reac2(end,:);
    reactor3(k,:) = reac3(end,:);
    reactor4(k,:) = reac4(end,:);
    reactor5(k,:) = reac5(end,:);
    reactor6(k,:) = reac6(end,:);
    reactor7(k,:) = reac7(end,:);
    reactor8(k,:) = reac8(end,:);
    reactor9(k,:) = reac9(end,:);

    complete_eff(k,:) = effluent_combined(end,:);

    settlerpart_new(k,:)   = settlernew(end,:);
    settlerpart_old(k,:)   = settlerold(end,:);
    recirculation_new(k,:) = rec_new(end,:);
    recirculation_old(k,:) = rec_old(end,:);
    
    inpart(k,:) = in(end,:);

    SNKj_eff(k) = complete_eff(k,10) + complete_eff(k,11) + complete_eff(k,12) + i_XB*(complete_eff(k,5)+complete_eff(k,6)) + i_XP*(complete_eff(k,3)+complete_eff(k,7));
    N_total(k)  = complete_eff(k,9) + SNKj_eff(k); % Total Effluent Nitrogen

    if k >= total_steps/2

        if effluent_combined(end,10) > 2
            snh_eff_violation_counter = snh_eff_violation_counter + 1;
        end
        if N_total(k) > 18
            sno_eff_violation_counter = sno_eff_violation_counter + 1;
        end
        if COD_effluent(end) > 50
            cod_eff_violation_counter = cod_eff_violation_counter + 1;
        end
        % if BOD_effluent(end) > 5
        %     bod_eff_violation_counter = bod_eff_violation_counter + 1;
        % end

    end
    % -------------------------------------------------- %

    % --- Store Essential Signals --- %
    KLa4_imp(k) = KLa4;
    KLa8_imp(k) = KLa8;
    
    Qa_new_imp(k) = Qa_new;
    Qa_old_imp(k) = Qa_old;
    
    time(k) = t;
    t = t + Ts;
    % ------------------------------- %

    tEnd = toc(tStart);
    optim_time(k) = tEnd;

    fprintf("# --- New Line --- #\n")
    fprintf("Reactor 1 Sno: %.2f\n", reactor1(k,9))
    fprintf("Reactor 4 Snh: %.2f\n", reactor4(k,10))
    fprintf("Reactor 4 Sno: %.2f\n", reactor4(k,9))
    fprintf("KLa4 value: %.2f\n", KLa4)
    fprintf("Qa new value: %.2f\n", Qa_new)
    fprintf("# ---------------- #\n")
    fprintf("# --- Old Line --- #\n")
    fprintf("Reactor 5 Sno: %.2f\n", reactor5(k,9))
    fprintf("Reactor 8 Snh: %.2f\n", reactor8(k,10))
    fprintf("Reactor 8 Sno: %.2f\n", reactor8(k,9))
    fprintf("KLa8 value: %.2f\n", KLa8)
    fprintf("Qa old value: %.2f\n", Qa_old)
    fprintf("# ---------------- #\n")

    fprintf("\nOCP exitflag: %d\n",exitflag(k))
    fprintf("Step %d took %.2f seconds.\n",k,tEnd)

end

tSim_end = toc(tSim_start);
fprintf("\nTotal simulation duration: %.2f minutes\n",tSim_end/60)

t = time;
in = inpart;

reac1 = reactor1;
reac2 = reactor2;
reac3 = reactor3;
reac4 = reactor4;
reac5 = reactor5;
reac6 = reactor6;
reac7 = reactor7;
reac8 = reactor8;
reac9 = reactor9;

effluent_combined = complete_eff;

settlernew = settlerpart_new;
settlerold = settlerpart_old;
rec_new = recirculation_new;
rec_old = recirculation_old;

kla1in = zeros(total_steps,1);
kla2in = 85*ones(total_steps,1);
kla3in = 85*ones(total_steps,1);
kla4in = KLa4_imp;

kla5in = zeros(total_steps,1);
kla6in = 85*ones(total_steps,1);
kla7in = 85*ones(total_steps,1);
kla8in = KLa8_imp;

kla9in = zeros(total_steps,1);

carbon1in = zeros(total_steps,1);
carbon2in = zeros(total_steps,1);
carbon3in = zeros(total_steps,1);
carbon4in = zeros(total_steps,1);
carbon5in = zeros(total_steps,1);
carbon6in = zeros(total_steps,1);
carbon7in = zeros(total_steps,1);
carbon8in = zeros(total_steps,1);
carbon9in = zeros(total_steps,1);

perf_plant

time = time(total_steps/2:end);

KLa4_imp = KLa4_imp(total_steps/2:end);
KLa8_imp = KLa8_imp(total_steps/2:end);
Qa_new_imp = Qa_new_imp(total_steps/2:end);
Qa_old_imp = Qa_old_imp(total_steps/2:end);

reactor1 = reactor1(total_steps/2:end,:);
reactor2 = reactor2(total_steps/2:end,:);
reactor3 = reactor3(total_steps/2:end,:);
reactor4 = reactor4(total_steps/2:end,:);
reactor5 = reactor5(total_steps/2:end,:);
reactor6 = reactor6(total_steps/2:end,:);
reactor7 = reactor7(total_steps/2:end,:);
reactor8 = reactor8(total_steps/2:end,:);

snh_eff = snh_eff(total_steps/2:end);
% bod_eff = bod_eff(total_steps/2:end);
cod_eff = cod_eff(total_steps/2:end);
complete_eff = complete_eff(total_steps/2:end,:);
settlerpart_new = settlerpart_new(total_steps/2:end,:);
settlerpart_old = settlerpart_old(total_steps/2:end,:);
N_total = N_total(total_steps/2:end,:);
SNKj_eff = SNKj_eff(total_steps/2:end,:);

mean_snh_eff = mean(snh_eff);
mean_N_total_eff = mean(N_total);

t_obs = length(KLa4_imp);
reac4_aeration_energy = (8/(t_obs*1.8*1000))*550*sum(KLa4_imp);
reac8_aeration_energy = (8/(t_obs*1.8*1000))*1067*sum(KLa8_imp);
new_line_pump_energy = (0.004/t_obs)*sum(Qa_new_imp);
old_line_pump_energy = (0.004/t_obs)*sum(Qa_old_imp);

total_aeration_energy = reac4_aeration_energy + reac8_aeration_energy;
total_pumping_energy  = new_line_pump_energy + old_line_pump_energy;

SNO_eff = complete_eff(:,9);
effluent_flow = complete_eff(:,end);
% TSS_eff = settlerpart(:,30);

% eqi_terms = (2*TSS_eff + cod_eff + 30*SNKj_eff + 10*SNO_eff + 2*bod_eff).*effluent_flow;
% effluent_quality_index = (1/(t_obs*1000))*sum(eqi_terms);

% fprintf("\nReactor 4 Aeration Energy: %.2f\n",reac4_aeration_energy)
% fprintf("Reactor 8 Aeration Energy: %.2f\n",reac8_aeration_energy)
% fprintf("New line Pumping Energy: %.2f\n",new_line_pump_energy)
% fprintf("Old line Pumping Energy: %.2f\n",old_line_pump_energy)
% 
% fprintf("\nTotal Aeration Energy: %.2f\n",total_aeration_energy)
% fprintf("Total Pumping Energy: %.2f\n",total_pumping_energy)
% 
% fprintf("\nCost Index (CI): %.2f\n",total_aeration_energy+total_pumping_energy)
% 
% fprintf('\nTotal days of SNH effluent violation: %.2f\n',snh_eff_violation_counter*Ts)
% fprintf('Total days of Ntot effluent violation: %.2f\n',sno_eff_violation_counter*Ts)
% fprintf('Total days of COD effluent violation: %.2f\n',cod_eff_violation_counter*Ts)
% % fprintf('Total days of BOD effluent violation: %.2f\n',bod_eff_violation_counter*Ts)
% 
% snh_eff_viol_perc = (snh_eff_violation_counter*Ts/7)*100;
% sno_eff_viol_perc = (sno_eff_violation_counter*Ts/7)*100;
% cod_eff_viol_perc = (cod_eff_violation_counter*Ts/7)*100;
% % bod_eff_viol_perc = (bod_eff_violation_counter*Ts/7)*100;
% 
% fprintf("\nPercentage of days for SNH effluent violation: %.1f%%\n",snh_eff_viol_perc)
% fprintf("Percentage of days for Ntot effluent violation: %.1f%%\n",sno_eff_viol_perc)
% fprintf("Percentage of days for COD effluent violation: %.1f%%\n",cod_eff_viol_perc)
% % fprintf("Percentage of days for BOD effluent violation: %.1f%%\n",bod_eff_viol_perc)
% 
% fprintf("\nMean Total Nitrogen Effluent Concentration: %.4f\n",mean_N_total_eff)
% fprintf("Mean COD Effluent Concentration: %.4f\n",mean(cod_eff))
% fprintf("Mean SNH Effluent Concentration: %.4f\n",mean_snh_eff)
% fprintf("Mean TSS Effluent Concentration: %.4f\n",mean(TSS_eff))
% fprintf("Mean BOD Effluent Concentration: %.4f\n",mean(bod_eff))

% fprintf("\nEffluent Quality Index (EQI): %.4f\n",effluent_quality_index)

time = 7:Ts:14;

figure
subplot(2,2,1)
plot(time,reactor4(:,9),'LineWidth',1.5)
grid on
grid minor
xlim([(total_steps/2)*Ts total_steps*Ts])
xlabel('Time [days]','FontSize',10)
ylabel('Sno []','FontSize',10)
title('Reactor 4 Nitrogen','FontSize',12)
subplot(2,2,2)
plot(time,reactor4(:,10),'LineWidth',1.5)
grid on
grid minor
xlim([(total_steps/2)*Ts total_steps*Ts])
xlabel('Time [days]','FontSize',10)
ylabel('Snh []','FontSize',10)
title('Reactor 4 Ammonia','FontSize',12)
subplot(2,2,3)
plot(time,reactor8(:,9),'LineWidth',1.5)
grid on
grid minor
xlim([(total_steps/2)*Ts total_steps*Ts])
xlabel('Time [days]','FontSize',10)
ylabel('Sno []','FontSize',10)
title('Reactor 8 Nitrogen','FontSize',12)
subplot(2,2,4)
plot(time,reactor8(:,10),'LineWidth',1.5)
grid on
grid minor
xlim([(total_steps/2)*Ts total_steps*Ts])
xlabel('Time [days]','FontSize',10)
ylabel('Snh []','FontSize',10)
title('Reactor 8 Ammonia','FontSize',12)

figure
subplot(2,2,1)
plot(time,KLa4_imp,'LineWidth',1.5)
grid on
grid minor
xlim([(total_steps/2)*Ts total_steps*Ts])
xlabel('Time [days]','FontSize',10)
title('KLa4 Applied','FontSize',12)
subplot(2,2,2)
plot(time,KLa8_imp,'LineWidth',1.5)
grid on
grid minor
xlim([(total_steps/2)*Ts total_steps*Ts])
xlabel('Time [days]','FontSize',10)
title('KLa8 Applied','FontSize',12)
subplot(2,2,3)
plot(time,Qa_new_imp,'LineWidth',1.5)
grid on
grid minor
xlim([(total_steps/2)*Ts total_steps*Ts])
xlabel('Time [days]','FontSize',10)
title('Qa New Applied','FontSize',12)
subplot(2,2,4)
plot(time,Qa_old_imp,'LineWidth',1.5)
grid on
grid minor
xlim([(total_steps/2)*Ts total_steps*Ts])
xlabel('Time [days]','FontSize',10)
title('Qa Old Applied','FontSize',12)

figure
subplot(1,2,1)
plot(time,snh_eff,'LineWidth',1.5)
hold on
plot(time,2*ones(length(snh_eff)),'LineWidth',1.5,'LineStyle','--','Color','r')
grid on
grid minor
xlim([(total_steps/2)*Ts total_steps*Ts])
legend('SNH\_eff','Limit','FontSize',8,'Location','best')
xlabel('Time [days]','FontSize',10)
ylabel('SNH,eff []','FontSize',10)
title('Effluent SNH Concentration','FontSize',12)
subplot(1,2,2)
plot(time,N_total,'LineWidth',1.5)
hold on
plot(time,18*ones(length(complete_eff(:,9))),'LineWidth',1.5,'LineStyle','--','Color','r')
grid on
grid minor
xlim([(total_steps/2)*Ts total_steps*Ts])
legend('N\_total','Limit','FontSize',8,'Location','best')
xlabel('Time [days]','FontSize',10)
ylabel('N_{total},eff []','FontSize',10)
title('Effluent Total Nitrogen Concentration','FontSize',12)

save workspace.mat