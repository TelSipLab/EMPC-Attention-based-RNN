TSS_1_old = 12.5016;
TSS_2_old = 18.1183;
TSS_3_old = 29.548;
TSS_4_old = 69.0015;
TSS_5_old = 356.2825;
TSS_6_old = 356.2825;
TSS_7_old = 356.2825;
TSS_8_old = 356.2825;
TSS_9_old = 356.2825;
TSS_10_old = 6399.2981;

SI_1_old = 30;
SI_2_old = 30;
SI_3_old = 30;
SI_4_old = 30;
SI_5_old = 30;
SI_6_old = 30;
SI_7_old = 30;
SI_8_old = 30;
SI_9_old = 30;
SI_10_old = 30;

SS_1_old = 0.80801;
SS_2_old = 0.80801;
SS_3_old = 0.80801;
SS_4_old = 0.80801;
SS_5_old = 0.80801;
SS_6_old = 0.80801;
SS_7_old = 0.80801;
SS_8_old = 0.80801;
SS_9_old = 0.80801;
SS_10_old = 0.80801;

SO_1_old = 2;
SO_2_old = 2;
SO_3_old = 2;
SO_4_old = 2;
SO_5_old = 2;
SO_6_old = 2;
SO_7_old = 2;
SO_8_old = 2;
SO_9_old = 2;
SO_10_old = 2;

SNO_1_old = 13.5243;
SNO_2_old = 13.5243;
SNO_3_old = 13.5243;
SNO_4_old = 13.5243;
SNO_5_old = 13.5243;
SNO_6_old = 13.5243;
SNO_7_old = 13.5243;
SNO_8_old = 13.5243;
SNO_9_old = 13.5243;
SNO_10_old = 13.5243;

SNH_1_old = 0.67193;
SNH_2_old = 0.67193;
SNH_3_old = 0.67193;
SNH_4_old = 0.67193;
SNH_5_old = 0.67193;
SNH_6_old = 0.67193;
SNH_7_old = 0.67193;
SNH_8_old = 0.67193;
SNH_9_old = 0.67193;
SNH_10_old = 0.67193;

SND_1_old = 0.6645;
SND_2_old = 0.6645;
SND_3_old = 0.6645;
SND_4_old = 0.6645;
SND_5_old = 0.6645;
SND_6_old = 0.6645;
SND_7_old = 0.6645;
SND_8_old = 0.6645;
SND_9_old = 0.6645;
SND_10_old = 0.6645;

SALK_1_old = 3.8277;
SALK_2_old = 3.8277;
SALK_3_old = 3.8277;
SALK_4_old = 3.8277;
SALK_5_old = 3.8277;
SALK_6_old = 3.8277;
SALK_7_old = 3.8277;
SALK_8_old = 3.8277;
SALK_9_old = 3.8277;
SALK_10_old = 3.8277;

SETTLERINIT_old = [ TSS_1_old TSS_2_old TSS_3_old TSS_4_old TSS_5_old TSS_6_old TSS_7_old TSS_8_old TSS_9_old TSS_10_old  SI_1_old SI_2_old SI_3_old SI_4_old SI_5_old SI_6_old SI_7_old SI_8_old SI_9_old SI_10_old  SS_1_old SS_2_old SS_3_old SS_4_old SS_5_old SS_6_old SS_7_old SS_8_old SS_9_old SS_10_old  SO_1_old SO_2_old SO_3_old SO_4_old SO_5_old SO_6_old SO_7_old SO_8_old SO_9_old SO_10_old  SNO_1_old SNO_2_old SNO_3_old SNO_4_old SNO_5_old SNO_6_old SNO_7_old SNO_8_old SNO_9_old SNO_10_old  SNH_1_old SNH_2_old SNH_3_old SNH_4_old SNH_5_old SNH_6_old SNH_7_old SNH_8_old SNH_9_old SNH_10_old SND_1_old SND_2_old SND_3_old SND_4_old SND_5_old SND_6_old SND_7_old SND_8_old SND_9_old SND_10_old  SALK_1_old SALK_2_old SALK_3_old SALK_4_old SALK_5_old SALK_6_old SALK_7_old SALK_8_old SALK_9_old SALK_10_old ];


v0_max = 250;
v0 = 474;
r_h = 0.000576;
r_p = 0.00286;
f_ns = 0.00228;
X_t = 3000;

%v0_max = 100;
%v0 = 145;
%r_h = 0.00042;
%r_p = 0.005;
%f_ns = 0;
%X_t = 3000;

SETTLERPAR = [ v0_max v0 r_h r_p f_ns X_t ];


area_old = 1050;
height_old = 4;

DIM_old = [ area_old height_old ];


feedlayer = 5;
nooflayers = 10;

LAYER = [ feedlayer nooflayers ];

% to use model with 10 layers for solubles use type 0 (COST Benchmark)
% to use model with 1 layer for solubles use type 1 (GSP-X implementation)
% to use model with 0 layers for solubles use type 2 (WEST implementation)

MODELTYPE = [ 0 ];
