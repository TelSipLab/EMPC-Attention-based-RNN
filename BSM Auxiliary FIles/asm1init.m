COD_BSM = sum(CONSTINFLUENT(1,3:8));
COD_Sparti = 722 - CONSTINFLUENT(1,2); % Set the desired value according to Sprti data
ratio_COD = COD_BSM/COD_BSM;

SNH_BSM = CONSTINFLUENT(1,11);
SNH_Sparti = 63; % Set the desired value according to Sprti data
SNH_ratio = SNH_BSM/SNH_BSM;

Q_BSM = 18446;
Qin0 = 8000; % 18446 in original BSM1
% Qin0 = 18446;
Qin0_ratio = Qin0/Q_BSM;
Qin0_new = Qin0*(1/3);
Qin0_old = Qin0*(2/3);
ratio_asin = (Qin0*2)/92230;
ratio = (Qin0*5)/92230;

ratio_new = ratio*(1/3);
ratio_old = ratio*(2/3);

if (exist('in'))
  Qin = in(end,15);
else
  Qin = Qin0;
end

if (exist('rec_old'))
  Qintrold = rec_old(end,15);
else
  Qintrold = 3*Qin0_old;
end

if (exist('rec_new'))
  Qintrnew = rec_new(end,15);
else
  Qintrnew = 3*Qin0_new;
end

% _ASin represents mass (g/d), flow is still m3/d, used by hydraulic delay
S_I_ASin = 1601328.2216*ratio_asin;
S_S_ASin = 1310222.0115*ratio_asin;
X_I_ASin = 61339851.4962*ratio_asin;
X_S_ASin = 6069822.4622*ratio_asin;
X_BH_ASin = 135212240.1361*ratio_asin;
X_BA_ASin = 8102155.1356*ratio_asin;
X_P_ASin = 23793923.1344*ratio_asin;
S_O_ASin = 69863.2148*ratio_asin;
S_NO_ASin = 472426.1427*ratio_asin;
S_NH_ASin = 605627.2491*ratio_asin;
S_ND_ASin = 151411.6736*ratio_asin;
X_ND_ASin = 366699.3472*ratio_asin;
S_ALK_ASin = 262829.2386*ratio_asin;
TSS_ASin = 175888494.2733*ratio_asin;
Q_ASin = Qin+Qin0;

S_I9 	=	30	;
S_S9 	=	1.6707	;
X_I9 	=	1149.1683	;
X_S9 	=	91.7032	;
X_BH9 	=	2552.3711	;
X_BA9 	=	151.5303	;
X_P9 	=	448.0838	;
S_O9 	=	6.03E-05	;
S_NO9 	=	1	;
S_NH9 	=	12.5482	;
S_ND9 	=	0.78899	;
X_ND9 	=	5.9537	;
S_ALK9 	=	5.5706	;
TSS9 	=	3294.6425	;
Q9 = Qin+Qin0;

%% NEW line
S_I_Asin_new	=	1601328.222 * ratio_new;
S_S_ASin_new	=	1310222.012	* ratio_new;
X_I_ASin_new	=	61339851.5	* ratio_new;
X_S_ASin_new	=	6069822.462	* ratio_new;
X_BH_ASin_new	=	135212240.1	* ratio_new;
X_BA_ASin_new 	=	8102155.136	* ratio_new;
X_P_ASin_new	=	23793923.13	* ratio_new;
S_O_ASin_new	=	69863.2148	* ratio_new;
S_NO_ASin_new	=	472426.1427	* ratio_new;
S_NH_ASin_new	=	605627.2491	* ratio_new;
S_ND_ASin_new	=	151411.6736	* ratio_new;
X_ND_ASin_new	=	366699.3472	* ratio_new;
S_ALK_ASin_new	=	262829.2386	* ratio_new;
TSS_ASin_new	=	175888494.3	* ratio_new;
Q_ASin_new	=	Qin*(1/3)+Qin0_new+Qintrnew;

S_I1 	=	30	;
S_S1 	=	1.6707	;
X_I1 	=	1149.1683	;
X_S1 	=	91.7032	;
X_BH1 	=	2552.3711	;
X_BA1 	=	151.5303	;
X_P1 	=	448.0838	;
S_O1 	=	6.03E-05	;
S_NO1 	=	1	;
S_NH1 	=	12.5482	;
S_ND1 	=	0.78899	;
X_ND1 	=	5.9537	;
S_ALK1 	=	5.5706	;
TSS1 	=	3294.6425	;
Q1 	=	 Qin*(1/3)+Qin0_new+Qintrnew	;

S_I2 	=	30	;
S_S2 	=	1.2195	;
X_I2 	=	1149.1683	;
X_S2 	=	69.6594	;
X_BH2 	=	2560.2025	;
X_BA2 	=	152.6873	;
X_P2 	=	449.6336	;
S_O2 	=	1.635	;
S_NO2 	=	6.2289	;
S_NH2 	=	7.3197	;
S_ND2 	=	0.8307	;
X_ND2 	=	4.7131	;
S_ALK2 	=	4.8236	;
TSS2 	=	3286.0132	;
Q2 	=	 Qin*(1/3)+Qin0_new+Qintrnew	;

S_I3 	=	30	;
S_S3 	=	0.97326	;
X_I3 	=	1149.1683	;
X_S3 	=	54.4484	;
X_BH3 	=	2563.3104	;
X_BA3 	=	153.7108	;
X_P3 	=	451.1852	;
S_O3 	=	2.4745	;
S_NO3 	=	11.0693	;
S_NH3 	=	2.7825	;
S_ND3 	=	0.75276	;
X_ND3 	=	3.8403	;
S_ALK3 	=	4.1538	;
TSS3 	=	3278.8674	;
Q3 	=	 Qin*(1/3)+Qin0_new+Qintrnew	;

S_I4 	=	30	;
S_S4 	=	0.80801	;
X_I4 	=	1149.1683	;
X_S4 	=	44.4828	;
X_BH4 	=	2562.8514	;
X_BA4 	=	154.163	;
X_P4 	=	452.7367	;
S_O4 	=	2	;
S_NO4 	=	13.5243	;
S_NH4 	=	0.67193	;
S_ND4 	=	0.6645	;
X_ND4 	=	3.2605	;
S_ALK4 	=	3.8277	;
TSS4 	=	3272.5516	;
Q4 	=	 Qin*(1/3)+Qin0_new+Qintrnew	;

%% OLD line
S_I_Asin_old	=	1601328.222	* ratio_old;
S_S_ASin_old	=	1310222.012	* ratio_old;
X_I_ASin_old	=	61339851.5	* ratio_old;
X_S_ASin_old	=	6069822.462	* ratio_old;
X_BH_ASin_old	=	135212240.1	* ratio_old;
X_BA_ASin_old	=	8102155.136	* ratio_old;
X_P_ASin_old	=	23793923.13	* ratio_old;
S_O_ASin_old	=	69863.2148	* ratio_old;
S_NO_ASin_old	=	472426.1427	* ratio_old;
S_NH_ASin_old	=	605627.2491	* ratio_old;
S_ND_ASin_old	=	151411.6736	* ratio_old;
X_ND_ASin_old	=	366699.3472	* ratio_old;
S_ALK_ASin_old	=	262829.2386	* ratio_old;
TSS_ASin_old	=	175888494.3	* ratio_old;
Q_ASin_old	=	 Qin*(2/3)+Qin0_old+Qintrold;

S_I5 	=	30	;
S_S5 	=	1.6707	;
X_I5 	=	1149.1683	;
X_S5 	=	91.7032	;
X_BH5 	=	2552.3711	;
X_BA5 	=	151.5303	;
X_P5 	=	448.0838	;
S_O5 	=	6.03E-05	;
S_NO5 	=	1	;
S_NH5 	=	12.5482	;
S_ND5 	=	0.78899	;
X_ND5 	=	5.9537	;
S_ALK5 	=	5.5706	;
TSS5 	=	3294.6425	;
Q5 	=	 Qin*(2/3)+Qin0_old+Qintrold	;

S_I6	=	30	;
S_S6 	=	1.2195	;
X_I6 	=	1149.1683	;
X_S6 	=	69.6594	;
X_BH6 	=	2560.2025	;
X_BA6 	=	152.6873	;
X_P6 	=	449.6336	;
S_O6 	=	1.635	;
S_NO6 	=	6.2289	;
S_NH6 	=	7.3197	;
S_ND6 	=	0.8307	;
X_ND6 	=	4.7131	;
S_ALK6 	=	4.8236	;
TSS6	=	3286.0132	;
Q6	=	 Qin*(2/3)+Qin0_old+Qintrold	;

S_I7	=	30	;
S_S7 	=	0.97326	;
X_I7 	=	1149.1683	;
X_S7 	=	54.4484	;
X_BH7 	=	2563.3104	;
X_BA7 	=	153.7108	;
X_P7 	=	451.1852	;
S_O7 	=	2.4745	;
S_NO7 	=	11.0693	;
S_NH7 	=	2.7825	;
S_ND7 	=	0.75276	;
X_ND7 	=	3.8403	;
S_ALK7 	=	4.1538	;
TSS7	=	3278.8674	;
Q7	=	 Qin*(2/3)+Qin0_old+Qintrold	;

S_I8 	=	30	;
S_S8 	=	0.80801	;
X_I8 	=	1149.1683	;
X_S8 	=	44.4828	;
X_BH8 	=	2562.8514	;
X_BA8 	=	154.163	;
X_P8 	=	452.7367	;
S_O8 	=	2	;
S_NO8 	=	13.5243	;
S_NH8 	=	0.67193	;
S_ND8 	=	0.6645	;
X_ND8 	=	3.2605	;
S_ALK8 	=	3.8277	;
TSS8 	=	3272.5516	;
Q8	=	 Qin*(2/3)+Qin0_old+Qintrold	;

XINITDELAY = [ S_I_ASin  S_S_ASin  X_I_ASin  X_S_ASin  X_BH_ASin  X_BA_ASin  X_P_ASin  S_O_ASin  S_NO_ASin  S_NH_ASin  S_ND_ASin  X_ND_ASin  S_ALK_ASin TSS_ASin Q_ASin ];
XINITDELAY_OLD = [ S_I_Asin_old  S_S_ASin_old  X_I_ASin_old  X_S_ASin_old  X_BH_ASin_old  X_BA_ASin_old  X_P_ASin_old  S_O_ASin_old  S_NO_ASin_old  S_NH_ASin_old  S_ND_ASin_old  X_ND_ASin_old  S_ALK_ASin_old TSS_ASin_old Q_ASin_old ];
XINITDELAY_NEW = [ S_I_Asin_new  S_S_ASin_new  X_I_ASin_new  X_S_ASin_new  X_BH_ASin_new  X_BA_ASin_new  X_P_ASin_new  S_O_ASin_new  S_NO_ASin_new  S_NH_ASin_new  S_ND_ASin_new  X_ND_ASin_new  S_ALK_ASin_new TSS_ASin_new Q_ASin_new ];
XINIT1 = [ S_I1  S_S1  X_I1  X_S1  X_BH1  X_BA1  X_P1  S_O1  S_NO1  S_NH1  S_ND1  X_ND1  S_ALK1 TSS1 Q1 ];
XINIT2 = [ S_I2  S_S2  X_I2  X_S2  X_BH2  X_BA2  X_P2  S_O2  S_NO2  S_NH2  S_ND2  X_ND2  S_ALK2 TSS2 Q2 ];
XINIT3 = [ S_I3  S_S3  X_I3  X_S3  X_BH3  X_BA3  X_P3  S_O3  S_NO3  S_NH3  S_ND3  X_ND3  S_ALK3 TSS3 Q3 ];
XINIT4 = [ S_I4  S_S4  X_I4  X_S4  X_BH4  X_BA4  X_P4  S_O4  S_NO4  S_NH4  S_ND4  X_ND4  S_ALK4 TSS4 Q4 ];
XINIT5 = [ S_I5  S_S5  X_I5  X_S5  X_BH5  X_BA5  X_P5  S_O5  S_NO5  S_NH5  S_ND5  X_ND5  S_ALK5 TSS5 Q5 ];
XINIT6 = [ S_I6  S_S6  X_I6  X_S6  X_BH6  X_BA6  X_P6  S_O6  S_NO6  S_NH6  S_ND6  X_ND6  S_ALK6 TSS6 Q6 ];
XINIT7 = [ S_I7  S_S7  X_I7  X_S7  X_BH7  X_BA7  X_P7  S_O7  S_NO7  S_NH7  S_ND7  X_ND7  S_ALK7 TSS7 Q7 ];
XINIT8 = [ S_I8  S_S8  X_I8  X_S8  X_BH8  X_BA8  X_P8  S_O8  S_NO8  S_NH8  S_ND8  X_ND8  S_ALK8 TSS8 Q8 ];
XINIT9 = [ S_I9  S_S9  X_I9  X_S9  X_BH9  X_BA9  X_P9  S_O9  S_NO9  S_NH9  S_ND9  X_ND9  S_ALK9 TSS9 Q9 ];

XINIT1 = XINIT1.*(rand(1, 15)/2);
XINIT2 = XINIT2.*(rand(1, 15)/2);
XINIT3 = XINIT3.*(rand(1, 15)/2);
XINIT4 = XINIT4.*(rand(1, 15)/2);
XINIT5 = XINIT5.*(rand(1, 15)/2);
XINIT6 = XINIT6.*(rand(1, 15)/2);
XINIT7 = XINIT7.*(rand(1, 15)/2);
XINIT8 = XINIT8.*(rand(1, 15)/2);
XINIT9 = XINIT9.*(rand(1, 15)/2);

XINIT4(8) = 2; % just to avoid antiwindupeffect the first sample time
XINIT8(8) = 2; % just to avoid antiwindupeffect the first sample time

XINIT = [ XINIT1(1,[2 4 5 6 8 9 10 15]) ;
          XINIT2(1,[2 4 5 6 8 9 10 15]) ;
          XINIT3(1,[2 4 5 6 8 9 10 15]) ;
          XINIT4(1,[2 4 5 6 8 9 10 15]) ;
          XINIT5(1,[2 4 5 6 8 9 10 15]) ;
          XINIT6(1,[2 4 5 6 8 9 10 15]) ;
          XINIT7(1,[2 4 5 6 8 9 10 15]) ;
          XINIT8(1,[2 4 5 6 8 9 10 15]) ;
          XINIT9(1,[2 4 5 6 8 9 10 15]) ;];


mu_H = 4.0;  %6.0;
K_S = 10.0;  %20;
K_OH = 0.2;
K_NO = 0.5;
b_H = 0.3;  %0.62;
mu_A = 0.5;  %0.8;
K_NH = 1.0;
K_OA = 0.4;
b_A = 0.05;  %0.2;
ny_g = 0.8;
k_a = 0.05;  %0.08;
k_h = 3.0;
K_X = 0.1;  %0.03;
ny_h = 0.8;  %0.4;
Y_H = 0.67;
Y_A = 0.24;
f_P = 0.08;
i_XB = 0.08;  %0.086;
i_XP = 0.06;
X_I2TSS = 0.75;
X_S2TSS = 0.75;
X_BH2TSS = 0.75;
X_BA2TSS = 0.75;
X_P2TSS = 0.75;

PAR1 = [ mu_H  K_S  K_OH  K_NO  b_H  mu_A  K_NH  K_OA  b_A  ny_g  k_a  k_h  K_X  ny_h  Y_H  Y_A  f_P  i_XB  i_XP X_I2TSS  X_S2TSS  X_BH2TSS  X_BA2TSS  X_P2TSS ];
PAR2 = PAR1;
PAR3 = PAR1;
PAR4 = PAR1;
PAR5 = PAR1;
PAR6 = PAR1;
PAR7 = PAR1;
PAR8 = PAR1;
PAR9 = PAR1;


VOL1 = 550;
VOL2 = 550;
VOL3 = VOL2;
VOL4 = VOL2;

VOL5 = 1000;
VOL6 = 1067;
VOL7 = VOL6;
VOL8 = VOL6;

VOL9 = 1137;

SOSAT1 = 8;
SOSAT2 = SOSAT1;
SOSAT3 = SOSAT1;
SOSAT4 = SOSAT1;
SOSAT5 = SOSAT1;
SOSAT6 = SOSAT1;
SOSAT7 = SOSAT1;
SOSAT8 = SOSAT1;
SOSAT9 = SOSAT1;

KLa1 = 0;
KLa2 = 85;
KLa3 = 85;
KLa4 = 20;

KLa5 = 0;
KLa6 = 85;
KLa7 = 85;
KLa8 = 23;

KLa9 = 0;

carb1 = 0; % external carbon flow rate to reactor 1
carb2 = 0; % external carbon flow rate to reactor 2
carb3 = 0; % external carbon flow rate to reactor 3
carb4 = 0; % external carbon flow rate to reactor 4
carb5 = 0; % external carbon flow rate to reactor 5
carb6 = 0; % external carbon flow rate to reactor 6
carb7 = 0; % external carbon flow rate to reactor 7
carb8 = 0; % external carbon flow rate to reactor 8
carb9 = 0; % external carbon flow rate to reactor 9
CARBONSOURCECONC = 400000; % external carbon source concentration = 400000 mg COD/l


T = 0.0001; % used by hydraulic delays
QintrT = T*10;
