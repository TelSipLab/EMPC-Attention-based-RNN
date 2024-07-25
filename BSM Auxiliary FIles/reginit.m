% initiates parameters for all controllers in use
% this file works together with sensorinit.m
%continuous PI O2-controller for 4th compartment
KSO4 = 25;       %Amplification, 500 in BSM1 book , 25
TiSO4 = 0.002;   %I-part time constant (d = 2.88 min)), integral time constant, 0.001 in BSM1 book
TtSO4 = 0.001;   %Antiwindup time constant (d), tracking time constant, 0.0002 in BSM1 book
SO4intstate = 0; %initial value of I-part
SO4awstate = 0;  %initial value of antiwindup I-part
SO4ref = 2;      %setpoint for controller, mg (-COD)/l
KLa4offset = 144; %reasonable offset value for control around SO5ref
                  % = controller output if the rest is turned off, (1/d)
useantiwindupSO4 = 1;  %0=no antiwindup, 1=use antiwindup for oxygen control

%continuous PI O2-controller for 8th compartment
KSO8 = 25;       %Amplification, 500 in BSM1 book, 25
TiSO8 = 0.002;   %I-part time constant (d = 2.88 min)), integral time constant, 0.001 in BSM1 book
TtSO8 = 0.001;   %Antiwindup time constant (d), tracking time constant, 0.0002 in BSM1 book
SO8intstate = 0; %initial value of I-part
SO8awstate = 0;  %initial value of antiwindup I-part
SO8ref = 2;      %setpoint for controller, mg (-COD)/l
KLa8offset = 144; %reasonable offset value for control around SO5ref
                  % = controller output if the rest is turned off, (1/d)
useantiwindupSO8 = 1;  %0=no antiwindup, 1=use antiwindup for oxygen control

%continuous PI Qintr-controller for NEW line
KQintr_new = 10000;    %Amplification
TiQintr_new = 0.025;   %I-part time constant (d = 36 min), integral time constant, 0.05 in BSM1 book
TtQintr_new = 0.015;   %Antiwindup time constant (d), tracking time constant, 0.03 in BSM1 book
Qintrintstate_new = 0; %initial value of I-part
Qintrawstate_new = 0;  %initial value of antiwindup I-part
SNO1ref = 1;       %setpoint for controller
Qintroffset_new = 18500; %reasonable offset value for control around SNO2ref
                     % = controller output if the rest is turned off, m3/d
useantiwindupQintr_new = 1;  %0=no antiwindup, 1=use antiwindup for Qintr control
% feed forward part has not been tested or tuned for updated BSM1, use with care
Kfeedforward_new = 0;  %1.2 Amp. for feedforward of Qin to Qintr (0=off)
		           %K=Kfeedforward*(SNOref/(SNOref+1))*(Qffref*Qin0-55338)
Qffref_new = 3;

%continuous PI Qintr-controller for OLD line
KQintr_old = 10000;    %Amplification
TiQintr_old = 0.025;   %I-part time constant (d = 36 min), integral time constant, 0.05 in BSM1 book
TtQintr_old = 0.015;   %Antiwindup time constant (d), tracking time constant, 0.03 in BSM1 book
Qintrintstate_old = 0; %initial value of I-part
Qintrawstate_old = 0;  %initial value of antiwindup I-part
SNO5ref = 1;       %setpoint for controller
Qintroffset_old = 18500; %reasonable offset value for control around SNO2ref
                     % = controller output if the rest is turned off, m3/d
useantiwindupQintr_old = 1;  %0=no antiwindup, 1=use antiwindup for Qintr control
% feed forward part has not been tested or tuned for updated BSM1, use with care
Kfeedforward_old = 0;  %1.2 Amp. for feedforward of Qin to Qintr (0=off)
		           %K=Kfeedforward*(SNOref/(SNOref+1))*(Qffref*Qin0-55338)
Qffref_old = 3;
