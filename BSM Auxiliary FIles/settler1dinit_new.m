TSS_1_new = 12.5016;
TSS_2_new = 18.1183;
TSS_3_new = 29.548;
TSS_4_new = 69.0015;
TSS_5_new = 356.2825;
TSS_6_new = 356.2825;
TSS_7_new = 356.2825;
TSS_8_new = 356.2825;
TSS_9_new = 356.2825;
TSS_10_new = 6399.2981;

SI_1_new = 30;
SI_2_new = 30;
SI_3_new = 30;
SI_4_new = 30;
SI_5_new = 30;
SI_6_new = 30;
SI_7_new = 30;
SI_8_new = 30;
SI_9_new = 30;
SI_10_new = 30;

SS_1_new = 0.80801;
SS_2_new = 0.80801;
SS_3_new = 0.80801;
SS_4_new = 0.80801;
SS_5_new = 0.80801;
SS_6_new = 0.80801;
SS_7_new = 0.80801;
SS_8_new = 0.80801;
SS_9_new = 0.80801;
SS_10_new = 0.80801;

SO_1_new = 2;
SO_2_new = 2;
SO_3_new = 2;
SO_4_new = 2;
SO_5_new = 2;
SO_6_new = 2;
SO_7_new = 2;
SO_8_new = 2;
SO_9_new = 2;
SO_10_new = 2;

SNO_1_new = 13.5243;
SNO_2_new = 13.5243;
SNO_3_new = 13.5243;
SNO_4_new = 13.5243;
SNO_5_new = 13.5243;
SNO_6_new = 13.5243;
SNO_7_new = 13.5243;
SNO_8_new = 13.5243;
SNO_9_new = 13.5243;
SNO_10_new = 13.5243;

SNH_1_new = 0.67193;
SNH_2_new = 0.67193;
SNH_3_new = 0.67193;
SNH_4_new = 0.67193;
SNH_5_new = 0.67193;
SNH_6_new = 0.67193;
SNH_7_new = 0.67193;
SNH_8_new = 0.67193;
SNH_9_new = 0.67193;
SNH_10_new = 0.67193;

SND_1_new = 0.6645;
SND_2_new = 0.6645;
SND_3_new = 0.6645;
SND_4_new = 0.6645;
SND_5_new = 0.6645;
SND_6_new = 0.6645;
SND_7_new = 0.6645;
SND_8_new = 0.6645;
SND_9_new = 0.6645;
SND_10_new = 0.6645;

SALK_1_new = 3.8277;
SALK_2_new = 3.8277;
SALK_3_new = 3.8277;
SALK_4_new = 3.8277;
SALK_5_new = 3.8277;
SALK_6_new = 3.8277;
SALK_7_new = 3.8277;
SALK_8_new = 3.8277;
SALK_9_new = 3.8277;
SALK_10_new = 3.8277;

SETTLERINIT_new = [ TSS_1_new TSS_2_new TSS_3_new TSS_4_new TSS_5_new TSS_6_new TSS_7_new TSS_8_new TSS_9_new TSS_10_new  SI_1_new SI_2_new SI_3_new SI_4_new SI_5_new SI_6_new SI_7_new SI_8_new SI_9_new SI_10_new  SS_1_new SS_2_new SS_3_new SS_4_new SS_5_new SS_6_new SS_7_new SS_8_new SS_9_new SS_10_new  SO_1_new SO_2_new SO_3_new SO_4_new SO_5_new SO_6_new SO_7_new SO_8_new SO_9_new SO_10_new  SNO_1_new SNO_2_new SNO_3_new SNO_4_new SNO_5_new SNO_6_new SNO_7_new SNO_8_new SNO_9_new SNO_10_new  SNH_1_new SNH_2_new SNH_3_new SNH_4_new SNH_5_new SNH_6_new SNH_7_new SNH_8_new SNH_9_new SNH_10_new SND_1_new SND_2_new SND_3_new SND_4_new SND_5_new SND_6_new SND_7_new SND_8_new SND_9_new SND_10_new  SALK_1_new SALK_2_new SALK_3_new SALK_4_new SALK_5_new SALK_6_new SALK_7_new SALK_8_new SALK_9_new SALK_10_new ];


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


area_new = 550;
height_new = 4;

DIM_new = [ area_new height_new ];


feedlayer = 5;
nooflayers = 10;

LAYER = [ feedlayer nooflayers ];

% to use model with 10 layers for solubles use type 0 (COST Benchmark)
% to use model with 1 layer for solubles use type 1 (GSP-X implementation)
% to use model with 0 layers for solubles use type 2 (WEST implementation)

MODELTYPE = [ 0 ];
