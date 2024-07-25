function x_pred = generate_model_predictions_numerically(x,Ts,pred_hor,u,k,INFLUENT_REDUCED, ...
    dry_flow_predictions)

    % --------------------------------------------------------- %
    % x: Matrix Containing Current States of BSM Original Plant %
    %                                                           %
    % --------------------------------------------------------- %

    XINITDELAY = x(1:8) ; XINITDELAY_new = x(9:16) ; XINITDELAY_old = x(17:24);

    XINIT1 = x(25:32) ; XINIT2 = x(33:40) ; XINIT3 = x(41:48) ; XINIT4 = x(49:56);
    XINIT5 = x(57:64) ; XINIT6 = x(65:72) ; XINIT7 = x(73:80) ; XINIT8 = x(81:88);
    XINIT9 = x(89:96);

    x_pred = zeros(pred_hor,56);

    dt = Ts/100;
    timeconst = 0.0001;
    V1 = 550;
    V5 = 1000;
    V6 = 1067;
    V9 = 1137;
    So_sat = 8;

    parameters = [ 0.301054 0.468951 0.165306 0.790444 10 0.829879 0.05 7.24295 ...
                   0.09 28.9121 0.025145 1.5 0.222988 8.94952 1.5 5.56138 0.916414 ...
                   0.980629]; % RAININFLUENT 10-days step changes (0.01968)

    initial_del_state = XINITDELAY;
    hyd_del_new_state = XINITDELAY_new;
    hyd_del_old_state = XINITDELAY_old;

    cstr1 = XINIT1 ; cstr2 = XINIT2 ; cstr3 = XINIT3 ; cstr4 = XINIT4 ; cstr5 = XINIT5;
    cstr6 = XINIT6 ; cstr7 = XINIT7 ; cstr8 = XINIT8 ; cstr9 = XINIT9;

    for n = 1:pred_hor

        % --- Numerically Solve Model Differential Equations ---- %
        if k <= 96
            influent = [69.5 202.32 28.17 0 0 0 INFLUENT_REDUCED(k+n,8) INFLUENT_REDUCED(k+n,9)];
        else         
            if n <= 8
                flow_pred = dry_flow_predictions(k-96,n);
            else
                flow_pred = dry_flow_predictions(k-96,8);
            end
            influent = [69.5 202.32 28.17 0 0 0 INFLUENT_REDUCED(k,8) flow_pred];
        end

        for delta_step = 1:100

            % --- Compute New Line Flow Splitter Outputs --- %
            reactor_4_output_flow = [cstr4 hyd_del_new_state(end)];
            [flow_splitter_new_flow_1, flow_splitter_new_flow_2] = flow_splitter(reactor_4_output_flow,u(n,1));

            % --- Compute Old Line Flow Splitter Outputs --- %
            reactor_8_output_flow = [cstr8 hyd_del_old_state(end)];
            [flow_splitter_old_flow_1, flow_splitter_old_flow_2] = flow_splitter(reactor_8_output_flow,u(n,3));

            % --- Compute New Line Settler Outputs --- %
            settler_flow_new = settler(influent(8)/3, flow_splitter_new_flow_2);

            % --- Compute Old Line Settler Outputs --- %
            settler_flow_old = settler((influent(8)*2)/3, flow_splitter_old_flow_2);

            % --- Compute Flow Rates Outputs of Input Combiners (Before Line Flow Splitter) --- %
            combiner_1 = combiner_model(settler_flow_new, influent);
            combiner_2 = combiner_model(combiner_1, settler_flow_old);
    
            % --- Hydraulic Delay Ordinary Differential Equations --- %
            [initial_del_out,initial_del_state] = hydraulic_delay_output(initial_del_state,combiner_2,timeconst,dt);

            % --- Denitrification Reactor Number 9 in the model --- %
            cstr9 = reactor_effluent_stream(cstr9,initial_del_out,0,So_sat,parameters,V9,dt);

            % --- Compute Line Splitter Flows --- %
            new_line_influent = [cstr9 initial_del_out(end)/3];
            old_line_influent = [cstr9 (initial_del_out(end)*2)/3];

            % --- Compute Flow Rates of each Line's Combiner --- %
            new_line_combiner = combiner_model(flow_splitter_new_flow_1,new_line_influent);
            old_line_combiner = combiner_model(flow_splitter_old_flow_1,old_line_influent);

            % --- Compute Hydraulic Delays of  each Line --- %
            [hyd_del_new_out,hyd_del_new_state] = hydraulic_delay_output(hyd_del_new_state,new_line_combiner,timeconst,dt);
            [hyd_del_old_out,hyd_del_old_state] = hydraulic_delay_output(hyd_del_old_state,old_line_combiner,timeconst,dt);

            % -- Reactors of New Line -- %
            cstr1 = reactor_effluent_stream(cstr1,hyd_del_new_out,0,So_sat,parameters,V1,dt);
            cstr2 = reactor_effluent_stream(cstr2,[cstr1 hyd_del_new_out(end)],85,So_sat,parameters,V1,dt);
            cstr3 = reactor_effluent_stream(cstr3,[cstr2 hyd_del_new_out(end)],85,So_sat,parameters,V1,dt);
            cstr4 = reactor_effluent_stream(cstr4,[cstr3 hyd_del_new_out(end)],u(n,2),So_sat,parameters,V1,dt);

            % -- Reactors of Old Line -- %
            cstr5 = reactor_effluent_stream(cstr5,hyd_del_old_out,0,So_sat,parameters,V5,dt);
            cstr6 = reactor_effluent_stream(cstr6,[cstr5 hyd_del_old_out(end)],85,So_sat,parameters,V6,dt);
            cstr7 = reactor_effluent_stream(cstr7,[cstr6 hyd_del_old_out(end)],85,So_sat,parameters,V6,dt);
            cstr8 = reactor_effluent_stream(cstr8,[cstr7 hyd_del_old_out(end)],u(n,4),So_sat,parameters,V6,dt);
            
        end

        % --- Store Predictions --- %
        x_pred(n,:) = [ cstr1 cstr2 cstr3 cstr4 cstr5 cstr6 cstr7 cstr8 ];
    end
end