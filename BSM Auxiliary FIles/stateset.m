[m n] = size(reac1);
% Qin0 = 5000;
Qin0_new = Qin0*(1/3);
Qin0_old = Qin0*(2/3);

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
S_I_ASin = ASinput(m,1);
S_S_ASin = ASinput(m,2);
X_I_ASin = ASinput(m,3);
X_S_ASin = ASinput(m,4);
X_BH_ASin = ASinput(m,5);
X_BA_ASin = ASinput(m,6);
X_P_ASin = ASinput(m,7);
S_O_ASin = ASinput(m,8);
S_NO_ASin = ASinput(m,9);
S_NH_ASin = ASinput(m,10);
S_ND_ASin = ASinput(m,11);
X_ND_ASin = ASinput(m,12);
S_ALK_ASin = ASinput(m,13);
TSS_ASin = ASinput(m,14);
Q_ASin = ASinput(m,15);

%% NEW line
% _ASin represents mass (g/d), flow is still m3/d, used by hydraulic delay
S_I_ASin_new = ASinputnew(m,1);
S_S_ASin_new = ASinputnew(m,2);
X_I_ASin_new = ASinputnew(m,3);
X_S_ASin_new = ASinputnew(m,4);
X_BH_ASin_new = ASinputnew(m,5);
X_BA_ASin_new = ASinputnew(m,6);
X_P_ASin_new = ASinputnew(m,7);
S_O_ASin_new = ASinputnew(m,8);
S_NO_ASin_new = ASinputnew(m,9);
S_NH_ASin_new = ASinputnew(m,10);
S_ND_ASin_new = ASinputnew(m,11);
X_ND_ASin_new = ASinputnew(m,12);
S_ALK_ASin_new = ASinputnew(m,13);
TSS_ASin_new = ASinputnew(m,14);
Q_ASin_new = ASinputnew(m,15);

S_I1 = reac1(m,1);
S_S1 = reac1(m,2);
X_I1 = reac1(m,3);
X_S1 = reac1(m,4);
X_BH1 = reac1(m,5);
X_BA1 = reac1(m,6);
X_P1 = reac1(m,7);
S_O1 = reac1(m,8);
S_NO1 = reac1(m,9);
S_NH1 = reac1(m,10);
S_ND1 = reac1(m,11);
X_ND1 = reac1(m,12);
S_ALK1 = reac1(m,13);
TSS1 = reac1(m,14);
Q1 = reac1(m,15);

S_I2 = reac2(m,1);
S_S2 = reac2(m,2);
X_I2 = reac2(m,3);
X_S2 = reac2(m,4);
X_BH2 = reac2(m,5);
X_BA2 = reac2(m,6);
X_P2 = reac2(m,7);
S_O2 = reac2(m,8);
S_NO2 = reac2(m,9);
S_NH2 = reac2(m,10);
S_ND2 = reac2(m,11);
X_ND2 = reac2(m,12);
S_ALK2 = reac2(m,13);
TSS2 = reac2(m,14);
Q2 = reac2(m,15);

S_I3 = reac3(m,1);
S_S3 = reac3(m,2);
X_I3 = reac3(m,3);
X_S3 = reac3(m,4);
X_BH3 = reac3(m,5);
X_BA3 = reac3(m,6);
X_P3 = reac3(m,7);
S_O3 = reac3(m,8);
S_NO3 = reac3(m,9);
S_NH3 = reac3(m,10);
S_ND3 = reac3(m,11);
X_ND3 = reac3(m,12);
S_ALK3 = reac3(m,13);
TSS3 = reac3(m,14);
Q3 = reac3(m,15);

S_I4 = reac4(m,1);
S_S4 = reac4(m,2);
X_I4 = reac4(m,3);
X_S4 = reac4(m,4);
X_BH4 = reac4(m,5);
X_BA4 = reac4(m,6);
X_P4 = reac4(m,7);
S_O4 = reac4(m,8);
S_NO4 = reac4(m,9);
S_NH4 = reac4(m,10);
S_ND4 = reac4(m,11);
X_ND4 = reac4(m,12);
S_ALK4 = reac4(m,13);
TSS4 = reac4(m,14);
Q4 = reac4(m,15);

%% OLD line
% _ASin represents mass (g/d), flow is still m3/d, used by hydraulic delay
S_I_ASin_old = ASinputold(m,1);
S_S_ASin_old = ASinputold(m,2);
X_I_ASin_old = ASinputold(m,3);
X_S_ASin_old = ASinputold(m,4);
X_BH_ASin_old = ASinputold(m,5);
X_BA_ASin_old = ASinputold(m,6);
X_P_ASin_old = ASinputold(m,7);
S_O_ASin_old = ASinputold(m,8);
S_NO_ASin_old = ASinputold(m,9);
S_NH_ASin_old = ASinputold(m,10);
S_ND_ASin_old = ASinputold(m,11);
X_ND_ASin_old = ASinputold(m,12);
S_ALK_ASin_old = ASinputold(m,13);
TSS_ASin_old = ASinputold(m,14);
Q_ASin_old = ASinputold(m,15);

S_I5 = reac5(m,1);
S_S5 = reac5(m,2);
X_I5 = reac5(m,3);
X_S5 = reac5(m,4);
X_BH5 = reac5(m,5);
X_BA5 = reac5(m,6);
X_P5 = reac5(m,7);
S_O5 = reac5(m,8);
S_NO5 = reac5(m,9);
S_NH5 = reac5(m,10);
S_ND5 = reac5(m,11);
X_ND5 = reac5(m,12);
S_ALK5 = reac5(m,13);
TSS5 = reac5(m,14);
Q5 = reac5(m,15);

S_I6 = reac6(m,1);
S_S6 = reac6(m,2);
X_I6 = reac6(m,3);
X_S6 = reac6(m,4);
X_BH6 = reac6(m,5);
X_BA6 = reac6(m,6);
X_P6 = reac6(m,7);
S_O6 = reac6(m,8);
S_NO6 = reac6(m,9);
S_NH6 = reac6(m,10);
S_ND6 = reac6(m,11);
X_ND6 = reac6(m,12);
S_ALK6 = reac6(m,13);
TSS6 = reac6(m,14);
Q6 = reac6(m,15);

S_I7 = reac7(m,1);
S_S7 = reac7(m,2);
X_I7 = reac7(m,3);
X_S7 = reac7(m,4);
X_BH7 = reac7(m,5);
X_BA7 = reac7(m,6);
X_P7 = reac7(m,7);
S_O7 = reac7(m,8);
S_NO7 = reac7(m,9);
S_NH7 = reac7(m,10);
S_ND7 = reac7(m,11);
X_ND7 = reac7(m,12);
S_ALK7 = reac7(m,13);
TSS7 = reac7(m,14);
Q7 = reac7(m,15);

S_I8 = reac8(m,1);
S_S8 = reac8(m,2);
X_I8 = reac8(m,3);
X_S8 = reac8(m,4);
X_BH8 = reac8(m,5);
X_BA8 = reac8(m,6);
X_P8 = reac8(m,7);
S_O8 = reac8(m,8);
S_NO8 = reac8(m,9);
S_NH8 = reac8(m,10);
S_ND8 = reac8(m,11);
X_ND8 = reac8(m,12);
S_ALK8 = reac8(m,13);
TSS8 = reac8(m,14);
Q8 = reac8(m,15);

S_I9 = reac9(m,1);
S_S9 = reac9(m,2);
X_I9 = reac9(m,3);
X_S9 = reac9(m,4);
X_BH9 = reac9(m,5);
X_BA9 = reac9(m,6);
X_P9 = reac9(m,7);
S_O9 = reac9(m,8);
S_NO9 = reac9(m,9);
S_NH9 = reac9(m,10);
S_ND9 = reac9(m,11);
X_ND9 = reac9(m,12);
S_ALK9 = reac9(m,13);
TSS9 = reac9(m,14);
Q9 = reac9(m,15);

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

TSS_1_new = settlernew(m,32);
TSS_2_new = settlernew(m,33);
TSS_3_new = settlernew(m,34);
TSS_4_new = settlernew(m,35);
TSS_5_new = settlernew(m,36);
TSS_6_new = settlernew(m,37);
TSS_7_new = settlernew(m,38);
TSS_8_new = settlernew(m,39);
TSS_9_new = settlernew(m,40);
TSS_10_new = settlernew(m,41);

SI_1_new = settlernew(m,44);
SI_2_new = settlernew(m,45);
SI_3_new = settlernew(m,46);
SI_4_new = settlernew(m,47);
SI_5_new = settlernew(m,48);
SI_6_new = settlernew(m,49);
SI_7_new = settlernew(m,50);
SI_8_new = settlernew(m,51);
SI_9_new = settlernew(m,52);
SI_10_new = settlernew(m,53);

SS_1_new = settlernew(m,54);
SS_2_new = settlernew(m,55);
SS_3_new = settlernew(m,56);
SS_4_new = settlernew(m,57);
SS_5_new = settlernew(m,58);
SS_6_new = settlernew(m,59);
SS_7_new = settlernew(m,60);
SS_8_new = settlernew(m,61);
SS_9_new = settlernew(m,62);
SS_10_new = settlernew(m,63);

SO_1_new = settlernew(m,64);
SO_2_new = settlernew(m,65);
SO_3_new = settlernew(m,66);
SO_4_new = settlernew(m,67);
SO_5_new = settlernew(m,68);
SO_6_new = settlernew(m,69);
SO_7_new = settlernew(m,70);
SO_8_new = settlernew(m,71);
SO_9_new = settlernew(m,72);
SO_10_new = settlernew(m,73);

SNO_1_new = settlernew(m,74);
SNO_2_new = settlernew(m,75);
SNO_3_new = settlernew(m,76);
SNO_4_new = settlernew(m,77);
SNO_5_new = settlernew(m,78);
SNO_6_new = settlernew(m,79);
SNO_7_new = settlernew(m,80);
SNO_8_new = settlernew(m,81);
SNO_9_new = settlernew(m,82);
SNO_10_new = settlernew(m,83);

SNH_1_new = settlernew(m,84);
SNH_2_new = settlernew(m,85);
SNH_3_new = settlernew(m,86);
SNH_4_new = settlernew(m,87);
SNH_5_new = settlernew(m,88);
SNH_6_new = settlernew(m,89);
SNH_7_new = settlernew(m,90);
SNH_8_new = settlernew(m,91);
SNH_9_new = settlernew(m,92);
SNH_10_new = settlernew(m,93);

SND_1_new = settlernew(m,94);
SND_2_new = settlernew(m,95);
SND_3_new = settlernew(m,96);
SND_4_new = settlernew(m,97);
SND_5_new = settlernew(m,98);
SND_6_new = settlernew(m,99);
SND_7_new = settlernew(m,100);
SND_8_new = settlernew(m,101);
SND_9_new = settlernew(m,102);
SND_10_new = settlernew(m,103);

SALK_1_new = settlernew(m,104);
SALK_2_new = settlernew(m,105);
SALK_3_new = settlernew(m,106);
SALK_4_new = settlernew(m,107);
SALK_5_new = settlernew(m,108);
SALK_6_new = settlernew(m,109);
SALK_7_new = settlernew(m,110);
SALK_8_new = settlernew(m,111);
SALK_9_new = settlernew(m,112);
SALK_10_new = settlernew(m,113);

TSS_1_old = settlerold(m,32);
TSS_2_old = settlerold(m,33);
TSS_3_old = settlerold(m,34);
TSS_4_old = settlerold(m,35);
TSS_5_old = settlerold(m,36);
TSS_6_old = settlerold(m,37);
TSS_7_old = settlerold(m,38);
TSS_8_old = settlerold(m,39);
TSS_9_old = settlerold(m,40);
TSS_10_old = settlerold(m,41);

SI_1_old = settlerold(m,44);
SI_2_old = settlerold(m,45);
SI_3_old = settlerold(m,46);
SI_4_old = settlerold(m,47);
SI_5_old = settlerold(m,48);
SI_6_old = settlerold(m,49);
SI_7_old = settlerold(m,50);
SI_8_old = settlerold(m,51);
SI_9_old = settlerold(m,52);
SI_10_old = settlerold(m,53);

SS_1_old = settlerold(m,54);
SS_2_old = settlerold(m,55);
SS_3_old = settlerold(m,56);
SS_4_old = settlerold(m,57);
SS_5_old = settlerold(m,58);
SS_6_old = settlerold(m,59);
SS_7_old = settlerold(m,60);
SS_8_old = settlerold(m,61);
SS_9_old = settlerold(m,62);
SS_10_old = settlerold(m,63);

SO_1_old = settlerold(m,64);
SO_2_old = settlerold(m,65);
SO_3_old = settlerold(m,66);
SO_4_old = settlerold(m,67);
SO_5_old = settlerold(m,68);
SO_6_old = settlerold(m,69);
SO_7_old = settlerold(m,70);
SO_8_old = settlerold(m,71);
SO_9_old = settlerold(m,72);
SO_10_old = settlerold(m,73);

SNO_1_old = settlerold(m,74);
SNO_2_old = settlerold(m,75);
SNO_3_old = settlerold(m,76);
SNO_4_old = settlerold(m,77);
SNO_5_old = settlerold(m,78);
SNO_6_old = settlerold(m,79);
SNO_7_old = settlerold(m,80);
SNO_8_old = settlerold(m,81);
SNO_9_old = settlerold(m,82);
SNO_10_old = settlerold(m,83);

SNH_1_old = settlerold(m,84);
SNH_2_old = settlerold(m,85);
SNH_3_old = settlerold(m,86);
SNH_4_old = settlerold(m,87);
SNH_5_old = settlerold(m,88);
SNH_6_old = settlerold(m,89);
SNH_7_old = settlerold(m,90);
SNH_8_old = settlerold(m,91);
SNH_9_old = settlerold(m,92);
SNH_10_old = settlerold(m,93);

SND_1_old = settlerold(m,94);
SND_2_old = settlerold(m,95);
SND_3_old = settlerold(m,96);
SND_4_old = settlerold(m,97);
SND_5_old = settlerold(m,98);
SND_6_old = settlerold(m,99);
SND_7_old = settlerold(m,100);
SND_8_old = settlerold(m,101);
SND_9_old = settlerold(m,102);
SND_10_old = settlerold(m,103);

SALK_1_old = settlerold(m,104);
SALK_2_old = settlerold(m,105);
SALK_3_old = settlerold(m,106);
SALK_4_old = settlerold(m,107);
SALK_5_old = settlerold(m,108);
SALK_6_old = settlerold(m,109);
SALK_7_old = settlerold(m,110);
SALK_8_old = settlerold(m,111);
SALK_9_old = settlerold(m,112);
SALK_10_old = settlerold(m,113);

SETTLERINIT_new = [ TSS_1_new TSS_2_new TSS_3_new TSS_4_new TSS_5_new TSS_6_new TSS_7_new TSS_8_new TSS_9_new TSS_10_new  SI_1_new SI_2_new SI_3_new SI_4_new SI_5_new SI_6_new SI_7_new SI_8_new SI_9_new SI_10_new  SS_1_new SS_2_new SS_3_new SS_4_new SS_5_new SS_6_new SS_7_new SS_8_new SS_9_new SS_10_new  SO_1_new SO_2_new SO_3_new SO_4_new SO_5_new SO_6_new SO_7_new SO_8_new SO_9_new SO_10_new  SNO_1_new SNO_2_new SNO_3_new SNO_4_new SNO_5_new SNO_6_new SNO_7_new SNO_8_new SNO_9_new SNO_10_new  SNH_1_new SNH_2_new SNH_3_new SNH_4_new SNH_5_new SNH_6_new SNH_7_new SNH_8_new SNH_9_new SNH_10_new SND_1_new SND_2_new SND_3_new SND_4_new SND_5_new SND_6_new SND_7_new SND_8_new SND_9_new SND_10_new  SALK_1_new SALK_2_new SALK_3_new SALK_4_new SALK_5_new SALK_6_new SALK_7_new SALK_8_new SALK_9_new SALK_10_new ];
SETTLERINIT_old = [ TSS_1_old TSS_2_old TSS_3_old TSS_4_old TSS_5_old TSS_6_old TSS_7_old TSS_8_old TSS_9_old TSS_10_old  SI_1_old SI_2_old SI_3_old SI_4_old SI_5_old SI_6_old SI_7_old SI_8_old SI_9_old SI_10_old  SS_1_old SS_2_old SS_3_old SS_4_old SS_5_old SS_6_old SS_7_old SS_8_old SS_9_old SS_10_old  SO_1_old SO_2_old SO_3_old SO_4_old SO_5_old SO_6_old SO_7_old SO_8_old SO_9_old SO_10_old  SNO_1_old SNO_2_old SNO_3_old SNO_4_old SNO_5_old SNO_6_old SNO_7_old SNO_8_old SNO_9_old SNO_10_old  SNH_1_old SNH_2_old SNH_3_old SNH_4_old SNH_5_old SNH_6_old SNH_7_old SNH_8_old SNH_9_old SNH_10_old SND_1_old SND_2_old SND_3_old SND_4_old SND_5_old SND_6_old SND_7_old SND_8_old SND_9_old SND_10_old  SALK_1_old SALK_2_old SALK_3_old SALK_4_old SALK_5_old SALK_6_old SALK_7_old SALK_8_old SALK_9_old SALK_10_old ];

% SO5intstate = SO5reg(m,4);
% SO5awstate = SO5reg(m,5);
% 
% Qintrintstate = Qintrreg(m,4);
% Qintrawstate = Qintrreg(m,5);


save states Qin0 Qin0_new Qin0_old Qin Qintrnew Qintrold XINIT1 XINIT2 XINIT3 XINIT4 XINIT5 XINIT6 XINIT7 XINIT8 XINIT9 SETTLERINIT_new SETTLERINIT_old XINITDELAY_OLD XINITDELAY_NEW % XINITDELAY SO5intstate SO5awstate Qintrintstate Qintrawstate
