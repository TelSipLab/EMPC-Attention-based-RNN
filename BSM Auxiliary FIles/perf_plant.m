% Plant performance module for BSM1 benchmarking
% 990410 UJ, updated many times
% Last update 2007-11-13
% Copyright: Ulf Jeppsson, IEA, Lund University, Lund, Sweden
% 2007-12-07 file updated to include both original and updated BSM1
% evaluation criteria, UJ
% 2007-12-27 file updated to include Risk estimation

% cut away first and last samples, i.e. t=smaller than starttime and 
% t = larger than stoptime
starttime = 7;
stoptime = 14;
startindex=max(find(t <= starttime));
% stopindex=min(find(t >= stoptime));
stopindex = 1344;

time=t(startindex:stopindex);

sampletime = time(2)-time(1);
totalt=time(end)-time(1);

totalCODemax = 50; % Original BSM is 100
totalNemax = 18; % Original BSM is 18
SNHemax = 2; % Original BSM is 4
TSSemax = 20; % Original BSM is 30
BOD5emax = 5; % Original BSM is 10

BSS=2;
BCOD=1;
BNKj=20; % original BSM1
BNO=20; % original BSM1
BBOD5=2;
BNKj_new = 30; % updated BSM TG meeting no 8
BNO_new = 10; % updated BSM TG meeting no 8

pumpfactor = 0.04; % original BSM1, same for all pumped flows
PF_Qintr = 0.004;  % kWh/m3, pumping energy factor, internal AS recirculation
PF_Qr = 0.008;  % kWh/m3, pumping energy factor, AS sludge recycle 
PF_Qw = 0.05;  % kWh/m3, pumping energy factor, AS wastage flow

%cut out the parts of the files to be used
inpart=in(startindex:(stopindex-1),:);
reac1part=reac1(startindex:(stopindex-1),:);
reac2part=reac2(startindex:(stopindex-1),:);
reac3part=reac3(startindex:(stopindex-1),:);
reac4part=reac4(startindex:(stopindex-1),:);
reac5part=reac5(startindex:(stopindex-1),:);
reac6part=reac6(startindex:(stopindex-1),:);
reac7part=reac7(startindex:(stopindex-1),:);
reac8part=reac8(startindex:(stopindex-1),:);
reac9part=reac9(startindex:(stopindex-1),:);
settlerpart=effluent_combined(startindex:(stopindex-1),:);
settlerpart_new=settlernew(startindex:(stopindex-1),:);
settlerpart_old=settlerold(startindex:(stopindex-1),:);
recpart_new=rec_new(startindex:(stopindex-1),:);
recpart_old=rec_old(startindex:(stopindex-1),:);

% Effluent concentrations
timevector=time(2:end)-time(1:(end-1));

Qevec=settlerpart(:,15).*timevector;
Qinvec=inpart(:,15).*timevector;
SIevec=settlerpart(:,1).*Qevec;
SSevec=settlerpart(:,2).*Qevec;     
XIevec=settlerpart(:,3).*Qevec;
XSevec=settlerpart(:,4).*Qevec;  
XBHevec=settlerpart(:,5).*Qevec;  
XBAevec=settlerpart(:,6).*Qevec;
XPevec=settlerpart(:,7).*Qevec;
SOevec=settlerpart(:,8).*Qevec;
SNOevec=settlerpart(:,9).*Qevec;
SNHevec=settlerpart(:,10).*Qevec;
SNDevec=settlerpart(:,11).*Qevec;
XNDevec=settlerpart(:,12).*Qevec;
SALKevec=settlerpart(:,13).*Qevec;
TSSevec=settlerpart(:,14).*Qevec;

Qevec_new=settlerpart_new(:,31).*timevector;
SIevec_new=settlerpart_new(:,17).*Qevec_new;
SSevec_new=settlerpart_new(:,18).*Qevec_new;     
XIevec_new=settlerpart_new(:,19).*Qevec_new;
XSevec_new=settlerpart_new(:,20).*Qevec_new;  
XBHevec_new=settlerpart_new(:,21).*Qevec_new;  
XBAevec_new=settlerpart_new(:,22).*Qevec_new;
XPevec_new=settlerpart_new(:,23).*Qevec_new;
SOevec_new=settlerpart_new(:,24).*Qevec_new;
SNOevec_new=settlerpart_new(:,25).*Qevec_new;
SNHevec_new=settlerpart_new(:,26).*Qevec_new;
SNDevec_new=settlerpart_new(:,27).*Qevec_new;
XNDevec_new=settlerpart_new(:,28).*Qevec_new;
SALKevec_new=settlerpart_new(:,29).*Qevec_new;
TSSevec_new=settlerpart_new(:,30).*Qevec_new;

Qevec_old=settlerpart_old(:,31).*timevector;
SIevec_old=settlerpart_old(:,17).*Qevec_old;
SSevec_old=settlerpart_old(:,18).*Qevec_old;     
XIevec_old=settlerpart_old(:,19).*Qevec_old;
XSevec_old=settlerpart_old(:,20).*Qevec_old;  
XBHevec_old=settlerpart_old(:,21).*Qevec_old;  
XBAevec_old=settlerpart_old(:,22).*Qevec_old;
XPevec_old=settlerpart_old(:,23).*Qevec_old;
SOevec_old=settlerpart_old(:,24).*Qevec_old;
SNOevec_old=settlerpart_old(:,25).*Qevec_old;
SNHevec_old=settlerpart_old(:,26).*Qevec_old;
SNDevec_old=settlerpart_old(:,27).*Qevec_old;
XNDevec_old=settlerpart_old(:,28).*Qevec_old;
SALKevec_old=settlerpart_old(:,29).*Qevec_old;
TSSevec_old=settlerpart_old(:,30).*Qevec_old;

Qetot = sum(Qevec);
Qetot_new = sum(Qevec_new);
Qetot_old = sum(Qevec_old);
Qeav = Qetot/totalt;
Qeav_new = Qetot_new/totalt;
Qeav_old = Qetot_old/totalt;

SIeload = sum(SIevec);
SSeload = sum(SSevec);
XIeload = sum(XIevec);
XSeload = sum(XSevec);
XBHeload = sum(XBHevec);
XBAeload = sum(XBAevec);
XPeload = sum(XPevec);
SOeload = sum(SOevec);
SNOeload = sum(SNOevec);
SNHeload = sum(SNHevec);
SNDeload = sum(SNDevec);
XNDeload = sum(XNDevec);
SALKeload = sum(SALKevec);
TSSeload = sum(TSSevec);

SIeload_new = sum(SIevec_new);
SSeload_new = sum(SSevec_new);
XIeload_new = sum(XIevec_new);
XSeload_new = sum(XSevec_new);
XBHeload_new = sum(XBHevec_new);
XBAeload_new = sum(XBAevec_new);
XPeload_new = sum(XPevec_new);
SOeload_new = sum(SOevec_new);
SNOeload_new = sum(SNOevec_new);
SNHeload_new = sum(SNHevec_new);
SNDeload_new = sum(SNDevec_new);
XNDeload_new = sum(XNDevec_new);
SALKeload_new = sum(SALKevec_new);
TSSeload_new = sum(TSSevec_new);

SIeload_old = sum(SIevec_old);
SSeload_old = sum(SSevec_old);
XIeload_old = sum(XIevec_old);
XSeload_old = sum(XSevec_old);
XBHeload_old = sum(XBHevec_old);
XBAeload_old = sum(XBAevec_old);
XPeload_old = sum(XPevec_old);
SOeload_old = sum(SOevec_old);
SNOeload_old = sum(SNOevec_old);
SNHeload_old = sum(SNHevec_old);
SNDeload_old = sum(SNDevec_old);
XNDeload_old = sum(XNDevec_old);
SALKeload_old = sum(SALKevec_old);
TSSeload_old = sum(TSSevec_old);

SIeav = SIeload/Qetot;
SSeav = SSeload/Qetot;
XIeav = XIeload/Qetot;
XSeav = XSeload/Qetot;
XBHeav = XBHeload/Qetot;
XBAeav = XBAeload/Qetot;
XPeav = XPeload/Qetot;
SOeav = SOeload/Qetot;
SNOeav = SNOeload/Qetot;
SNHeav = SNHeload/Qetot;
SNDeav = SNDeload/Qetot;
XNDeav = XNDeload/Qetot;
SALKeav = SALKeload/Qetot;
TSSeav = TSSeload/Qetot;

SIeav_new = SIeload_new/Qetot_new;
SSeav_new = SSeload_new/Qetot_new;
XIeav_new = XIeload_new/Qetot_new;
XSeav_new = XSeload_new/Qetot_new;
XBHeav_new = XBHeload_new/Qetot_new;
XBAeav_new = XBAeload_new/Qetot_new;
XPeav_new = XPeload_new/Qetot_new;
SOeav_new = SOeload_new/Qetot_new;
SNOeav_new = SNOeload_new/Qetot_new;
SNHeav_new = SNHeload_new/Qetot_new;
SNDeav_new = SNDeload_new/Qetot_new;
XNDeav_new = XNDeload_new/Qetot_new;
SALKeav_new = SALKeload_new/Qetot_new;
TSSeav_new = TSSeload_new/Qetot_new;

SIeav_old = SIeload_old/Qetot_old;
SSeav_old = SSeload_old/Qetot_old;
XIeav_old = XIeload_old/Qetot_old;
XSeav_old = XSeload_old/Qetot_old;
XBHeav_old = XBHeload_old/Qetot_old;
XBAeav_old = XBAeload_old/Qetot_old;
XPeav_old = XPeload_old/Qetot_old;
SOeav_old = SOeload_old/Qetot_old;
SNOeav_old = SNOeload_old/Qetot_old;
SNHeav_old = SNHeload_old/Qetot_old;
SNDeav_old = SNDeload_old/Qetot_old;
XNDeav_old = XNDeload_old/Qetot_old;
SALKeav_old = SALKeload_old/Qetot_old;
TSSeav_old = TSSeload_old/Qetot_old;

totalNKjevec2=(SNHevec+SNDevec+XNDevec+i_XB*(XBHevec+XBAevec)+i_XP*(XPevec+XIevec))./Qevec;
totalNevec2=(SNOevec+SNHevec+SNDevec+XNDevec+i_XB*(XBHevec+XBAevec)+i_XP*(XPevec+XIevec))./Qevec;
totalCODevec2=(SIevec+SSevec+XIevec+XSevec+XBHevec+XBAevec+XPevec)./Qevec;
SNHevec2=SNHevec./Qevec;
TSSevec2=TSSevec./Qevec;
BOD5evec2=(0.25*(SSevec+XSevec+(1-f_P)*(XBHevec+XBAevec)))./Qevec;

totalNKjevec2_new=(SNHevec_new+SNDevec_new+XNDevec_new+i_XB*(XBHevec_new+XBAevec_new)+i_XP*(XPevec_new+XIevec_new))./Qevec_new;
totalNevec2_new=(SNOevec_new+SNHevec_new+SNDevec_new+XNDevec_new+i_XB*(XBHevec_new+XBAevec_new)+i_XP*(XPevec_new+XIevec_new))./Qevec_new;
totalCODevec2_new=(SIevec_new+SSevec_new+XIevec_new+XSevec_new+XBHevec_new+XBAevec_new+XPevec_new)./Qevec_new;
SNHevec2_new=SNHevec_new./Qevec_new;
TSSevec2_new=TSSevec_new./Qevec_new;
BOD5evec2_new=(0.25*(SSevec_new+XSevec_new+(1-f_P)*(XBHevec_new+XBAevec_new)))./Qevec_new;

totalNKjevec2_old=(SNHevec_old+SNDevec_old+XNDevec_old+i_XB*(XBHevec_old+XBAevec_old)+i_XP*(XPevec_old+XIevec_old))./Qevec_old;
totalNevec2_old=(SNOevec_old+SNHevec_old+SNDevec_old+XNDevec_old+i_XB*(XBHevec_old+XBAevec_old)+i_XP*(XPevec_old+XIevec_old))./Qevec_old;
totalCODevec2_old=(SIevec_old+SSevec_old+XIevec_old+XSevec_old+XBHevec_old+XBAevec_old+XPevec_old)./Qevec_old;
SNHevec2_old=SNHevec_old./Qevec_old;
TSSevec2_old=TSSevec_old./Qevec_old;
BOD5evec2_old=(0.25*(SSevec_old+XSevec_old+(1-f_P)*(XBHevec_old+XBAevec_old)))./Qevec_old;

totalNKjeload=SNHeload+SNDeload+XNDeload+i_XB*(XBHeload+XBAeload)+i_XP*(XPeload+XIeload);
totalNeload=SNOeload+totalNKjeload;
totalCODeload=(SIeload+SSeload+XIeload+XSeload+XBHeload+XBAeload+XPeload);
BOD5eload=(0.25*(SSeload+XSeload+(1-f_P)*(XBHeload+XBAeload)));

totalNKjeload_new=SNHeload_new+SNDeload_new+XNDeload_new+i_XB*(XBHeload_new+XBAeload_new)+i_XP*(XPeload_new+XIeload_new);
totalNeload_new=SNOeload_new+totalNKjeload_new;
totalCODeload_new=(SIeload_new+SSeload_new+XIeload_new+XSeload_new+XBHeload_new+XBAeload_new+XPeload_new);
BOD5eload_new=(0.25*(SSeload_new+XSeload_new+(1-f_P)*(XBHeload_new+XBAeload_new)));

totalNKjeload_old=SNHeload_old+SNDeload_old+XNDeload_old+i_XB*(XBHeload_old+XBAeload_old)+i_XP*(XPeload_old+XIeload_old);
totalNeload_old=SNOeload_old+totalNKjeload_old;
totalCODeload_old=(SIeload_old+SSeload_old+XIeload_old+XSeload_old+XBHeload_old+XBAeload_old+XPeload_old);
BOD5eload_old=(0.25*(SSeload_old+XSeload_old+(1-f_P)*(XBHeload_old+XBAeload_old)));

% Influent and Effluent quality index
SSin=inpart(:,14);
CODin=inpart(:,1)+inpart(:,2)+inpart(:,3)+inpart(:,4)+inpart(:,5)+inpart(:,6)+inpart(:,7);
SNKjin=inpart(:,10)+inpart(:,11)+inpart(:,12)+i_XB*(inpart(:,5)+inpart(:,6))+i_XP*(inpart(:,3)+inpart(:,7));
SNOin=inpart(:,9);
BOD5in=0.65*(inpart(:,2)+inpart(:,4)+(1-f_P)*(inpart(:,5)+inpart(:,6)));

SSe=settlerpart(:,14);
CODe=settlerpart(:,1)+settlerpart(:,2)+settlerpart(:,3)+settlerpart(:,4)+settlerpart(:,5)+settlerpart(:,6)+settlerpart(:,7);
SNKje=settlerpart(:,10)+settlerpart(:,11)+settlerpart(:,12)+i_XB*(settlerpart(:,5)+settlerpart(:,6))+i_XP*(settlerpart(:,3)+settlerpart(:,7));
SNOe=settlerpart(:,9);
BOD5e=0.25*(settlerpart(:,2)+settlerpart(:,4)+(1-f_P)*(settlerpart(:,5)+settlerpart(:,6)));

SSe_new=settlerpart_new(:,14);
CODe_new=settlerpart_new(:,1)+settlerpart_new(:,2)+settlerpart_new(:,3)+settlerpart_new(:,4)+settlerpart_new(:,5)+settlerpart_new(:,6)+settlerpart_new(:,7);
SNKje_new=settlerpart_new(:,10)+settlerpart_new(:,11)+settlerpart_new(:,12)+i_XB*(settlerpart_new(:,5)+settlerpart_new(:,6))+i_XP*(settlerpart_new(:,3)+settlerpart_new(:,7));
SNOe_new=settlerpart_new(:,9);
BOD5e_new=0.25*(settlerpart_new(:,2)+settlerpart_new(:,4)+(1-f_P)*(settlerpart_new(:,5)+settlerpart_new(:,6)));

SSe_old=settlerpart_old(:,14);
CODe_old=settlerpart_old(:,1)+settlerpart_old(:,2)+settlerpart_old(:,3)+settlerpart_old(:,4)+settlerpart_old(:,5)+settlerpart_old(:,6)+settlerpart_old(:,7);
SNKje_old=settlerpart_old(:,10)+settlerpart_old(:,11)+settlerpart_old(:,12)+i_XB*(settlerpart_old(:,5)+settlerpart_old(:,6))+i_XP*(settlerpart_old(:,3)+settlerpart_old(:,7));
SNOe_old=settlerpart_old(:,9);
BOD5e_old=0.25*(settlerpart_old(:,2)+settlerpart_old(:,4)+(1-f_P)*(settlerpart_old(:,5)+settlerpart_old(:,6)));

EQvecinst=(BSS*SSe+BCOD*CODe+BNKj*SNKje+BNO*SNOe+BBOD5*BOD5e).*(settlerpart(:,15));
EQvecinst_new=(BSS*SSe+BCOD*CODe+BNKj_new*SNKje+BNO_new*SNOe+BBOD5*BOD5e).*settlerpart(:,15); %updated BSM TG meeting no 8

EQvecinst_new_line=(BSS*SSe_new+BCOD*CODe_new+BNKj*SNKje_new+BNO*SNOe_new+BBOD5*BOD5e_new).*(settlerpart_new(:,15));
EQvecinst_new_new_line=(BSS*SSe_new+BCOD*CODe_new+BNKj_new*SNKje_new+BNO_new*SNOe_new+BBOD5*BOD5e_new).*settlerpart_new(:,15); %updated BSM TG meeting no 8

EQvecinst_old_line=(BSS*SSe_old+BCOD*CODe_old+BNKj*SNKje_old+BNO*SNOe_old+BBOD5*BOD5e_old).*(settlerpart_old(:,15));
EQvecinst_new_old_line=(BSS*SSe_old+BCOD*CODe_old+BNKj_new*SNKje_old+BNO_new*SNOe_old+BBOD5*BOD5e_old).*settlerpart_old(:,15); %updated BSM TG meeting no 8

IQvec=(BSS*SSin+BCOD*CODin+BNKj*SNKjin+BNO*SNOin+BBOD5*BOD5in).*Qinvec;
IQvec_new=(BSS*SSin+BCOD*CODin+BNKj_new*SNKjin+BNO_new*SNOin+BBOD5*BOD5in).*Qinvec; %updated BSM TG meeting no 8
IQ=sum(IQvec)/(totalt*1000);
IQ_new=sum(IQvec_new)/(totalt*1000);
EQvec=(BSS*SSe+BCOD*CODe+BNKj*SNKje+BNO*SNOe+BBOD5*BOD5e).*Qevec;
EQvec_new=(BSS*SSe+BCOD*CODe+BNKj_new*SNKje+BNO_new*SNOe+BBOD5*BOD5e).*Qevec; %updated BSM TG meeting no 8
EQ=sum(EQvec)/(totalt*1000);
EQ_new=sum(EQvec_new)/(totalt*1000); %updated BSM TG meeting no 8

EQvec_new_line=(BSS*SSe_new+BCOD*CODe_new+BNKj*SNKje_new+BNO*SNOe_new+BBOD5*BOD5e_new).*Qevec_new;
EQvec_new_new_line=(BSS*SSe_new+BCOD*CODe_new+BNKj_new*SNKje_new+BNO_new*SNOe_new+BBOD5*BOD5e_new).*Qevec_new; %updated BSM TG meeting no 8
EQ_new_line=sum(EQvec_new_line)/(totalt*1000);
EQ_new_new_line=sum(EQvec_new_new_line)/(totalt*1000); %updated BSM TG meeting no 8

% Costfactors for operation

% Sludge production
TSSreactors_start_new = (reac1part(1,14)*VOL1+reac2part(1,14)*VOL2+reac3part(1,14)*VOL3+reac4part(1,14)*VOL4)/1000;
TSSreactors_end_new = (reac1part(end,14)*VOL1+reac2part(end,14)*VOL2+reac3part(end,14)*VOL3+reac4part(end,14)*VOL4)/1000;
TSSreactors_start_old = (reac5part(1,14)*VOL5+reac6part(1,14)*VOL6+reac7part(1,14)*VOL7+reac8part(1,14)*VOL8)/1000;
TSSreactors_end_old = (reac5part(end,14)*VOL5+reac6part(end,14)*VOL6+reac7part(end,14)*VOL7+reac8part(end,14)*VOL8)/1000;
TSSreactors_start_ph = (reac9part(1,14)*VOL9)/1000;
TSSreactors_end_ph = (reac9part(end,14)*VOL9)/1000;
TSSreactors_start = TSSreactors_start_new + TSSreactors_start_old + TSSreactors_start_ph;
TSSreactors_end = TSSreactors_end_new + TSSreactors_end_old + TSSreactors_end_ph;

TSSsettler_new_start=(settlerpart_new(1,32)*DIM_new(1)*DIM_new(2)/10+settlerpart_new(1,33)*DIM_new(1)*DIM_new(2)/10+settlerpart_new(1,34)*DIM_new(1)*DIM_new(2)/10+settlerpart_new(1,35)*DIM_new(1)*DIM_new(2)/10+settlerpart_new(1,36)*DIM_new(1)*DIM_new(2)/10+settlerpart_new(1,37)*DIM_new(1)*DIM_new(2)/10+settlerpart_new(1,38)*DIM_new(1)*DIM_new(2)/10+settlerpart_new(1,39)*DIM_new(1)*DIM_new(2)/10+settlerpart_new(1,40)*DIM_new(1)*DIM_new(2)/10+settlerpart_new(1,41)*DIM_new(1)*DIM_new(2)/10)/1000;
TSSsettler_new_end=(settlerpart_new(end,32)*DIM_new(1)*DIM_new(2)/10+settlerpart_new(end,33)*DIM_new(1)*DIM_new(2)/10+settlerpart_new(end,34)*DIM_new(1)*DIM_new(2)/10+settlerpart_new(end,35)*DIM_new(1)*DIM_new(2)/10+settlerpart_new(end,36)*DIM_new(1)*DIM_new(2)/10+settlerpart_new(end,37)*DIM_new(1)*DIM_new(2)/10+settlerpart_new(end,38)*DIM_new(1)*DIM_new(2)/10+settlerpart_new(end,39)*DIM_new(1)*DIM_new(2)/10+settlerpart_new(end,40)*DIM_new(1)*DIM_new(2)/10+settlerpart_new(end,41)*DIM_new(1)*DIM_new(2)/10)/1000;
TSSwasteconc_new=settlerpart_new(:,41)/1000;  %kg/m3
Qwasteflow_new=settlerpart_new(:,16);         %m3/d
TSSuvec_new=TSSwasteconc_new.*Qwasteflow_new.*timevector;

TSSsettler_old_start=(settlerpart_old(1,32)*DIM_old(1)*DIM_old(2)/10+settlerpart_old(1,33)*DIM_old(1)*DIM_old(2)/10+settlerpart_old(1,34)*DIM_old(1)*DIM_old(2)/10+settlerpart_old(1,35)*DIM_old(1)*DIM_old(2)/10+settlerpart_old(1,36)*DIM_old(1)*DIM_old(2)/10+settlerpart_old(1,37)*DIM_old(1)*DIM_old(2)/10+settlerpart_old(1,38)*DIM_old(1)*DIM_old(2)/10+settlerpart_old(1,39)*DIM_old(1)*DIM_old(2)/10+settlerpart_old(1,40)*DIM_old(1)*DIM_old(2)/10+settlerpart_old(1,41)*DIM_old(1)*DIM_old(2)/10)/1000;
TSSsettler_old_end=(settlerpart_old(end,32)*DIM_old(1)*DIM_old(2)/10+settlerpart_old(end,33)*DIM_old(1)*DIM_old(2)/10+settlerpart_old(end,34)*DIM_old(1)*DIM_old(2)/10+settlerpart_old(end,35)*DIM_old(1)*DIM_old(2)/10+settlerpart_old(end,36)*DIM_old(1)*DIM_old(2)/10+settlerpart_old(end,37)*DIM_old(1)*DIM_old(2)/10+settlerpart_old(end,38)*DIM_old(1)*DIM_old(2)/10+settlerpart_old(end,39)*DIM_old(1)*DIM_old(2)/10+settlerpart_old(end,40)*DIM_old(1)*DIM_old(2)/10+settlerpart_old(end,41)*DIM_old(1)*DIM_old(2)/10)/1000;
TSSwasteconc_old=settlerpart_old(:,41)/1000;  %kg/m3
Qwasteflow_old=settlerpart_old(:,16);         %m3/d
TSSuvec_old=TSSwasteconc_old.*Qwasteflow_old.*timevector;

TSSwasteconc=TSSwasteconc_new+TSSwasteconc_old;
Qwasteflow=Qwasteflow_new+Qwasteflow_old;
TSSproduced=sum(TSSuvec_new)+sum(TSSuvec_old)+TSSreactors_end+TSSsettler_new_end+TSSsettler_old_end-TSSreactors_start-TSSsettler_new_start-TSSsettler_old_start;
TSSproducedperd = TSSproduced/totalt; %for OCI


% Aeration energy, original BSM1
kla1vec = kla1in(startindex:(stopindex-1),:);
kla2vec = kla2in(startindex:(stopindex-1),:);
kla3vec = kla3in(startindex:(stopindex-1),:);
kla4vec = kla4in(startindex:(stopindex-1),:);
kla5vec = kla5in(startindex:(stopindex-1),:);
kla6vec = kla6in(startindex:(stopindex-1),:);
kla7vec = kla7in(startindex:(stopindex-1),:);
kla8vec = kla8in(startindex:(stopindex-1),:);
kla9vec = kla9in(startindex:(stopindex-1),:);
kla5inx=kla5in(startindex:stopindex);

kla1newvec = 0.0007*(VOL1/1333)*(kla1vec.*kla1vec)+0.3267*(VOL1/1333)*kla1vec;
kla2newvec = 0.0007*(VOL2/1333)*(kla2vec.*kla2vec)+0.3267*(VOL2/1333)*kla2vec;
kla3newvec = 0.0007*(VOL3/1333)*(kla3vec.*kla3vec)+0.3267*(VOL3/1333)*kla3vec;
kla4newvec = 0.0007*(VOL4/1333)*(kla4vec.*kla4vec)+0.3267*(VOL4/1333)*kla4vec;
kla5newvec = 0.0007*(VOL5/1333)*(kla5vec.*kla5vec)+0.3267*(VOL5/1333)*kla5vec;
kla6newvec = 0.0007*(VOL6/1333)*(kla6vec.*kla6vec)+0.3267*(VOL6/1333)*kla6vec;
kla7newvec = 0.0007*(VOL7/1333)*(kla7vec.*kla7vec)+0.3267*(VOL7/1333)*kla7vec;
kla8newvec = 0.0007*(VOL8/1333)*(kla8vec.*kla8vec)+0.3267*(VOL8/1333)*kla8vec;
kla9newvec = 0.0007*(VOL9/1333)*(kla9vec.*kla9vec)+0.3267*(VOL9/1333)*kla9vec;

airenergyvec_new_line = 24*(kla1newvec+kla2newvec+kla3newvec+kla4newvec);
airenergyvec_old_line = 24*(kla5newvec+kla6newvec+kla7newvec+kla8newvec);
airenergyvec_ph = 24*kla9newvec;
airenergyvec = airenergyvec_new_line+airenergyvec_old_line+airenergyvec_ph;
airenergy = sum(airenergyvec.*timevector);
airenergy_new_line = sum(airenergyvec_new_line.*timevector);
airenergy_old_line = sum(airenergyvec_old_line.*timevector);
airenergyperd = airenergy/totalt; % for OCI
airenergyperd_new_line = airenergy_new_line/totalt;
airenergyperd_old_line = airenergy_old_line/totalt;

% Aeration energy, updated BSM1 (and also for BSM2)
kla1newvec_new = SOSAT1*VOL1*kla1vec;
kla2newvec_new = SOSAT2*VOL2*kla2vec;
kla3newvec_new = SOSAT3*VOL3*kla3vec;
kla4newvec_new = SOSAT4*VOL4*kla4vec;
kla5newvec_new = SOSAT5*VOL5*kla5vec;
kla6newvec_new = SOSAT6*VOL6*kla6vec;
kla7newvec_new = SOSAT7*VOL7*kla7vec;
kla8newvec_new = SOSAT8*VOL8*kla8vec;
kla9newvec_new = SOSAT9*VOL9*kla9vec;
airenergyvec_new_new_line = (kla1newvec_new+kla2newvec_new+kla3newvec_new+kla4newvec_new)/(1.8*1000);
airenergyvec_new_old_line = (kla5newvec_new+kla6newvec_new+kla7newvec_new+kla8newvec_new)/(1.8*1000);
airenergyvec_new_ph = kla9newvec_new /(1.8*1000); 
airenergyvec_new = airenergyvec_new_new_line+airenergyvec_new_old_line+airenergyvec_new_ph;
airenergy_new_new_line = sum(airenergyvec_new_new_line.*timevector);
airenergy_new_old_line = sum(airenergyvec_new_old_line.*timevector);
airenergy_new_ph = sum(airenergyvec_new_ph.*timevector);
airenergy_new = airenergy_new_new_line+airenergy_new_old_line+airenergy_new_ph;
airenergy_newperd = airenergy_new/totalt; % for OCI
airenergy_newperd_new_line = airenergy_new_new_line/totalt;
airenergy_newperd_old_line = airenergy_new_old_line/totalt;
airenergy_newperd_ph = airenergy_new_ph/totalt;

% Mixing energy (calculated as kWh consumed for the complete evaluation
% period), same as for BSM2
mixnumreac1 = length(find(kla1vec<20));
mixnumreac2 = length(find(kla2vec<20));
mixnumreac3 = length(find(kla3vec<20));
mixnumreac4 = length(find(kla4vec<20));
mixnumreac5 = length(find(kla5vec<20));
mixnumreac6 = length(find(kla6vec<20));
mixnumreac7 = length(find(kla7vec<20));
mixnumreac8 = length(find(kla8vec<20));
mixnumreac9 = length(find(kla9vec<20));

mixenergyunitreac = 0.005; %kW/m3

mixenergyreac1 = mixnumreac1*mixenergyunitreac*VOL1;
mixenergyreac2 = mixnumreac2*mixenergyunitreac*VOL2;
mixenergyreac3 = mixnumreac3*mixenergyunitreac*VOL3;
mixenergyreac4 = mixnumreac4*mixenergyunitreac*VOL4;
mixenergyreac5 = mixnumreac5*mixenergyunitreac*VOL5;
mixenergyreac6 = mixnumreac6*mixenergyunitreac*VOL6;
mixenergyreac7 = mixnumreac7*mixenergyunitreac*VOL7;
mixenergyreac8 = mixnumreac8*mixenergyunitreac*VOL8;
mixenergyreac9 = mixnumreac5*mixenergyunitreac*VOL9;

mixenergy_new = 24*(mixenergyreac1+mixenergyreac2+mixenergyreac3+mixenergyreac4)*sampletime;
mixenergy_old = 24*(mixenergyreac5+mixenergyreac6+mixenergyreac7+mixenergyreac8)*sampletime;
mixenergy_ph = 24*(mixenergyreac9)*sampletime;
mixenergy = mixenergy_new+mixenergy_old+mixenergy_ph;
mixenergyperd = mixenergy/totalt; % for OCI
mixenergyperd_new = mixenergy_new/totalt;
mixenergyperd_old = mixenergy_old/totalt;
mixenergyperd_ph = mixenergy_ph/totalt;

% Pumping energy, original BSM1
Qintrx_new_line=rec_new(startindex:stopindex,15);
Qintrflow_new_line = recpart_new(:,15);
Qrflow_new_line = settlerpart_new(:,15);
pumpenergyvec_new_line = pumpfactor*(Qwasteflow_new+Qintrflow_new_line+Qrflow_new_line);

Qintrx_old_line=rec_old(startindex:stopindex,15);
Qintrflow_old_line = recpart_old(:,15);
Qrflow_old_line = settlerpart_old(:,15);
pumpenergyvec_old_line = pumpfactor*(Qwasteflow_old+Qintrflow_old_line+Qrflow_old_line);

pumpenergy_new_line = sum(pumpenergyvec_new_line.*timevector);
pumpenergy_old_line = sum(pumpenergyvec_old_line.*timevector);
pumpenergy = pumpenergy_new_line+pumpenergy_old_line;
pumpenergyperd = pumpenergy/totalt; %for OCI
pumpenergyperd_new_line = pumpenergy_new_line/totalt; 
pumpenergyperd_old_line = pumpenergy_old_line/totalt;

% Pumping energy (based on BSM2 principles)
Qintrflow_new_line = recpart_new(:,15);
Qintrflow_old_line = recpart_old(:,15);
Qintrflow_new = Qintrflow_new_line+Qintrflow_old_line;
Qrflow_new_line = settlerpart_new(:,15);
Qrflow_old_line = settlerpart_old(:,15);
Qrflow_new = Qrflow_new_line+Qrflow_old_line;
Qwflow_new_line = settlerpart_new(:,16);
Qwflow_old_line = settlerpart_old(:,16);
Qwflow_new = Qwflow_new_line+Qwflow_old_line;

pumpenergyvec_new_new_line = PF_Qintr*Qintrflow_new_line+PF_Qr*Qrflow_new_line+PF_Qw*Qwflow_new_line;
pumpenergy_new_new_line = sum(pumpenergyvec_new_new_line.*timevector);
pumpenergy_newperd_new_line = pumpenergy_new_new_line/totalt; % for OCI

pumpenergyvec_new_old_line = PF_Qintr*Qintrflow_old_line+PF_Qr*Qrflow_old_line+PF_Qw*Qwflow_old_line;
pumpenergy_new_old_line = sum(pumpenergyvec_new_old_line.*timevector);
pumpenergy_newperdold_line = pumpenergy_new_old_line/totalt; % for OCI

pumpenergyvec_new = pumpenergyvec_new_new_line+pumpenergyvec_new_old_line;
pumpenergy_new = pumpenergy_new_new_line+pumpenergy_new_old_line;
pumpenergy_newperd = pumpenergy_newperd_new_line+pumpenergy_newperdold_line; % for OCI


% % Carbon source addition
carbon1vec = carbon1in(startindex:(stopindex-1),:);
carbon2vec = carbon2in(startindex:(stopindex-1),:);
carbon3vec = carbon3in(startindex:(stopindex-1),:);
carbon4vec = carbon4in(startindex:(stopindex-1),:);
carbon5vec = carbon5in(startindex:(stopindex-1),:);
carbon6vec = carbon6in(startindex:(stopindex-1),:);
carbon7vec = carbon7in(startindex:(stopindex-1),:);
carbon8vec = carbon8in(startindex:(stopindex-1),:);
carbon9vec = carbon9in(startindex:(stopindex-1),:);
Qcarbonvec = (carbon1vec+carbon2vec+carbon3vec+carbon4vec+carbon5vec+carbon6vec+carbon7vec+carbon8vec+carbon9vec);
carbonmassvec = Qcarbonvec*CARBONSOURCECONC/1000;
Qcarbon = sum(Qcarbonvec.*timevector); %m3
carbonmass = sum(carbonmassvec.*timevector); %kg COD
carbonmassperd = carbonmass/totalt; %for OCI


% Operational Cost Index for BSM1
TSScost = 5*TSSproducedperd;
airenergycost = 1*airenergyperd; %original BSM1
airenergy_newcost = 1*airenergy_newperd; %updated BSM1
mixenergycost = 1*mixenergyperd; %based on BSM2
pumpenergycost = 1*pumpenergyperd; % original BSM1
pumpenergy_newcost = 1*pumpenergy_newperd; % based on BSM2
carbonmasscost = 3*carbonmassperd;

OCI = TSScost + airenergycost + mixenergycost + pumpenergycost + carbonmasscost;
OCI_new = TSScost + airenergy_newcost + mixenergycost + pumpenergy_newcost + carbonmasscost;


% Calculate 95% percentiles for effluent SNH, TN and TSS; BSM2 standard criteria
SNHeffprctile=prctile(SNHevec2,95);
TNeffprctile=prctile(totalNevec2,95);
TSSeffprctile=prctile(TSSevec2,95);


disp(' ')
disp(['Overall plant performance during time ',num2str(time(1)),' to ',num2str(time(end)),' days'])
disp('**************************************************')
disp(' ')
disp('Total Effluent average concentrations based on load')
disp('---------------------------------------------')
disp(['Effluent average flow rate = ',num2str(Qeav),' m3/d'])
disp(['Effluent average SI conc = ',num2str(SIeav),' mg COD/l'])
disp(['Effluent average SS conc = ',num2str(SSeav),' mg COD/l'])
disp(['Effluent average XI conc = ',num2str(XIeav),' mg COD/l'])
disp(['Effluent average XS conc = ',num2str(XSeav),' mg COD/l'])
disp(['Effluent average XBH conc = ',num2str(XBHeav),' mg COD/l'])
disp(['Effluent average XBA conc = ',num2str(XBAeav),' mg COD/l'])
disp(['Effluent average XP conc = ',num2str(XPeav),' mg COD/l'])
disp(['Effluent average SO conc = ',num2str(SOeav),' mg (-COD)/l'])
disp(['Effluent average SNO conc = ',num2str(SNOeav),' mg N/l'])
disp(['Effluent average SNH conc = ',num2str(SNHeav),' mg N/l  (limit = 2 mg N/l)'])
disp(['Effluent average SND conc = ',num2str(SNDeav),' mg N/l'])
disp(['Effluent average XND conc = ',num2str(XNDeav),' mg N/l'])
disp(['Effluent average SALK conc = ',num2str(SALKeav),' mol HCO3/m3'])
disp(['Effluent average TSS conc = ',num2str(TSSeav),' mg SS/l  (limit = 30 mg SS/l)'])
disp(' ')
disp(['Effluent average Kjeldahl N conc = ',num2str(SNHeav+SNDeav+XNDeav+i_XB*(XBHeav+XBAeav)+i_XP*(XIeav+XPeav)),' mg N/l'])
disp(['Effluent average total N conc = ',num2str(SNOeav+SNHeav+SNDeav+XNDeav+i_XB*(XBHeav+XBAeav)+i_XP*(XIeav+XPeav)),' mg N/l  (limit = 18 mg COD/l)'])
disp(['Effluent average total COD conc = ',num2str(SIeav+SSeav+XIeav+XSeav+XBHeav+XBAeav+XPeav),' mg COD/l  (limit = 50 mg COD/l)'])
disp(['Effluent average BOD5 conc = ',num2str(0.25*(SSeav+XSeav+(1-f_P)*(XBHeav+XBAeav))),' mg/l  (limit = 5 mg/l)'])

disp(' ')
disp('Effluent average load')
disp('---------------------')
disp(['Effluent average SI load = ',num2str(SIeload/(1000*totalt)),' kg COD/day'])
disp(['Effluent average SS load = ',num2str(SSeload/(1000*totalt)),' kg COD/day'])
disp(['Effluent average XI load = ',num2str(XIeload/(1000*totalt)),' kg COD/day'])
disp(['Effluent average XS load = ',num2str(XSeload/(1000*totalt)),' kg COD/day'])
disp(['Effluent average XBH load = ',num2str(XBHeload/(1000*totalt)),' kg COD/day'])
disp(['Effluent average XBA load = ',num2str(XBAeload/(1000*totalt)),' kg COD/day'])
disp(['Effluent average XP load = ',num2str(XPeload/(1000*totalt)),' kg COD/day'])
disp(['Effluent average SO load = ',num2str(SOeload/(1000*totalt)),' kg (-COD)/day'])
disp(['Effluent average SNO load = ',num2str(SNOeload/(1000*totalt)),' kg N/day'])
disp(['Effluent average SNH load = ',num2str(SNHeload/(1000*totalt)),' kg N/day'])
disp(['Effluent average SND load = ',num2str(SNDeload/(1000*totalt)),' kg N/day'])
disp(['Effluent average XND load = ',num2str(XNDeload/(1000*totalt)),' kg N/day'])
disp(['Effluent average SALK load = ',num2str(SALKeload/(1000*totalt)),' kmol HCO3/day'])
disp(['Effluent average TSS load = ',num2str(TSSeload/(1000*totalt)),' kg SS/day'])
disp(' ')
disp(['Effluent average Kjeldahl N load = ',num2str(totalNKjeload/(1000*totalt)),' kg N/d'])
disp(['Effluent average total N load = ',num2str(totalNeload/(1000*totalt)),' kg N/d'])
disp(['Effluent average total COD load = ',num2str(totalCODeload/(1000*totalt)),' kg COD/d'])
disp(['Effluent average BOD5 load = ',num2str(BOD5eload/(1000*totalt)),' kg/d'])
disp(' ')
disp('Other effluent quality variables')
disp('--------------------------------')
disp(['Influent Quality (I.Q.) index = ',num2str(IQ),' kg poll.units/d (original BSM1 version)'])
disp(['Effluent Quality (E.Q.) index = ',num2str(EQ),' kg poll.units/d (original BSM1 version)'])
disp(['Influent Quality (I.Q.) index = ',num2str(IQ_new),' kg poll.units/d (updated BSM1 version)'])
disp(['Effluent Quality (E.Q.) index = ',num2str(EQ_new),' kg poll.units/d (updated BSM1 version)'])
%%%%%%%%%%%%%%%%%%----New Line----%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp(' ')
disp('New Line Effluent average concentrations based on load')
disp('---------------------------------------------')
disp(['Effluent average flow rate = ',num2str(Qeav_new),' m3/d'])
disp(['Effluent average SI conc = ',num2str(SIeav_new),' mg COD/l'])
disp(['Effluent average SS conc = ',num2str(SSeav_new),' mg COD/l'])
disp(['Effluent average XI conc = ',num2str(XIeav_new),' mg COD/l'])
disp(['Effluent average XS conc = ',num2str(XSeav_new),' mg COD/l'])
disp(['Effluent average XBH conc = ',num2str(XBHeav_new),' mg COD/l'])
disp(['Effluent average XBA conc = ',num2str(XBAeav_new),' mg COD/l'])
disp(['Effluent average XP conc = ',num2str(XPeav_new),' mg COD/l'])
disp(['Effluent average SO conc = ',num2str(SOeav_new),' mg (-COD)/l'])
disp(['Effluent average SNO conc = ',num2str(SNOeav_new),' mg N/l'])
disp(['Effluent average SNH conc = ',num2str(SNHeav_new),' mg N/l  (limit = 2 mg N/l)'])
disp(['Effluent average SND conc = ',num2str(SNDeav_new),' mg N/l'])
disp(['Effluent average XND conc = ',num2str(XNDeav_new),' mg N/l'])
disp(['Effluent average SALK conc = ',num2str(SALKeav_new),' mol HCO3/m3'])
disp(['Effluent average TSS conc = ',num2str(TSSeav_new),' mg SS/l  (limit = 30 mg SS/l)'])
disp(' ')
disp(['Effluent average Kjeldahl N conc = ',num2str(SNHeav_new+SNDeav_new+XNDeav_new+i_XB*(XBHeav_new+XBAeav_new)+i_XP*(XIeav_new+XPeav_new)),' mg N/l'])
disp(['Effluent average total N conc = ',num2str(SNOeav_new+SNHeav_new+SNDeav_new+XNDeav_new+i_XB*(XBHeav_new+XBAeav_new)+i_XP*(XIeav_new+XPeav_new)),' mg N/l  (limit = 18 mg COD/l)'])
disp(['Effluent average total COD conc = ',num2str(SIeav_new+SSeav_new+XIeav_new+XSeav_new+XBHeav_new+XBAeav_new+XPeav_new),' mg COD/l  (limit = 50 mg COD/l)'])
disp(['Effluent average BOD5 conc = ',num2str(0.25*(SSeav_new+XSeav_new+(1-f_P)*(XBHeav_new+XBAeav_new))),' mg/l  (limit = 5 mg/l)'])

disp(' ')
disp('New Line Effluent average load')
disp('---------------------')
disp(['Effluent average SI load = ',num2str(SIeload_new/(1000*totalt)),' kg COD/day'])
disp(['Effluent average SS load = ',num2str(SSeload_new/(1000*totalt)),' kg COD/day'])
disp(['Effluent average XI load = ',num2str(XIeload_new/(1000*totalt)),' kg COD/day'])
disp(['Effluent average XS load = ',num2str(XSeload_new/(1000*totalt)),' kg COD/day'])
disp(['Effluent average XBH load = ',num2str(XBHeload_new/(1000*totalt)),' kg COD/day'])
disp(['Effluent average XBA load = ',num2str(XBAeload_new/(1000*totalt)),' kg COD/day'])
disp(['Effluent average XP load = ',num2str(XPeload_new/(1000*totalt)),' kg COD/day'])
disp(['Effluent average SO load = ',num2str(SOeload_new/(1000*totalt)),' kg (-COD)/day'])
disp(['Effluent average SNO load = ',num2str(SNOeload_new/(1000*totalt)),' kg N/day'])
disp(['Effluent average SNH load = ',num2str(SNHeload_new/(1000*totalt)),' kg N/day'])
disp(['Effluent average SND load = ',num2str(SNDeload_new/(1000*totalt)),' kg N/day'])
disp(['Effluent average XND load = ',num2str(XNDeload_new/(1000*totalt)),' kg N/day'])
disp(['Effluent average SALK load = ',num2str(SALKeload_new/(1000*totalt)),' kmol HCO3/day'])
disp(['Effluent average TSS load = ',num2str(TSSeload_new/(1000*totalt)),' kg SS/day'])
disp(' ')
disp(['Effluent average Kjeldahl N load = ',num2str(totalNKjeload_new/(1000*totalt)),' kg N/d'])
disp(['Effluent average total N load = ',num2str(totalNeload_new/(1000*totalt)),' kg N/d'])
disp(['Effluent average total COD load = ',num2str(totalCODeload_new/(1000*totalt)),' kg COD/d'])
disp(['Effluent average BOD5 load = ',num2str(BOD5eload_new/(1000*totalt)),' kg/d'])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%----Old Line----%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp(' ')
disp('Old Line Effluent average concentrations based on load')
disp('---------------------------------------------')
disp(['Effluent average flow rate = ',num2str(Qeav_old),' m3/d'])
disp(['Effluent average SI conc = ',num2str(SIeav_old),' mg COD/l'])
disp(['Effluent average SS conc = ',num2str(SSeav_old),' mg COD/l'])
disp(['Effluent average XI conc = ',num2str(XIeav_old),' mg COD/l'])
disp(['Effluent average XS conc = ',num2str(XSeav_old),' mg COD/l'])
disp(['Effluent average XBH conc = ',num2str(XBHeav_old),' mg COD/l'])
disp(['Effluent average XBA conc = ',num2str(XBAeav_old),' mg COD/l'])
disp(['Effluent average XP conc = ',num2str(XPeav_old),' mg COD/l'])
disp(['Effluent average SO conc = ',num2str(SOeav_old),' mg (-COD)/l'])
disp(['Effluent average SNO conc = ',num2str(SNOeav_old),' mg N/l'])
disp(['Effluent average SNH conc = ',num2str(SNHeav_old),' mg N/l  (limit = 2 mg N/l)'])
disp(['Effluent average SND conc = ',num2str(SNDeav_old),' mg N/l'])
disp(['Effluent average XND conc = ',num2str(XNDeav_old),' mg N/l'])
disp(['Effluent average SALK conc = ',num2str(SALKeav_old),' mol HCO3/m3'])
disp(['Effluent average TSS conc = ',num2str(TSSeav_old),' mg SS/l  (limit = 30 mg SS/l)'])
disp(' ')
disp(['Effluent average Kjeldahl N conc = ',num2str(SNHeav_old+SNDeav_old+XNDeav_old+i_XB*(XBHeav_old+XBAeav_old)+i_XP*(XIeav_old+XPeav_old)),' mg N/l'])
disp(['Effluent average total N conc = ',num2str(SNOeav_old+SNHeav_old+SNDeav_old+XNDeav_old+i_XB*(XBHeav_old+XBAeav_old)+i_XP*(XIeav_old+XPeav_old)),' mg N/l  (limit = 18 mg COD/l)'])
disp(['Effluent average total COD conc = ',num2str(SIeav_old+SSeav_old+XIeav_old+XSeav_old+XBHeav_old+XBAeav_old+XPeav_old),' mg COD/l  (limit = 50 mg COD/l)'])
disp(['Effluent average BOD5 conc = ',num2str(0.25*(SSeav_old+XSeav_old+(1-f_P)*(XBHeav_old+XBAeav_old))),' mg/l  (limit = 5 mg/l)'])

disp(' ')
disp('Old Line Effluent average load')
disp('---------------------')
disp(['Effluent average SI load = ',num2str(SIeload_old/(1000*totalt)),' kg COD/day'])
disp(['Effluent average SS load = ',num2str(SSeload_old/(1000*totalt)),' kg COD/day'])
disp(['Effluent average XI load = ',num2str(XIeload_old/(1000*totalt)),' kg COD/day'])
disp(['Effluent average XS load = ',num2str(XSeload_old/(1000*totalt)),' kg COD/day'])
disp(['Effluent average XBH load = ',num2str(XBHeload_old/(1000*totalt)),' kg COD/day'])
disp(['Effluent average XBA load = ',num2str(XBAeload_old/(1000*totalt)),' kg COD/day'])
disp(['Effluent average XP load = ',num2str(XPeload_old/(1000*totalt)),' kg COD/day'])
disp(['Effluent average SO load = ',num2str(SOeload_old/(1000*totalt)),' kg (-COD)/day'])
disp(['Effluent average SNO load = ',num2str(SNOeload_old/(1000*totalt)),' kg N/day'])
disp(['Effluent average SNH load = ',num2str(SNHeload_old/(1000*totalt)),' kg N/day'])
disp(['Effluent average SND load = ',num2str(SNDeload_old/(1000*totalt)),' kg N/day'])
disp(['Effluent average XND load = ',num2str(XNDeload_old/(1000*totalt)),' kg N/day'])
disp(['Effluent average SALK load = ',num2str(SALKeload_old/(1000*totalt)),' kmol HCO3/day'])
disp(['Effluent average TSS load = ',num2str(TSSeload_old/(1000*totalt)),' kg SS/day'])
disp(' ')
disp(['Effluent average Kjeldahl N load = ',num2str(totalNKjeload_old/(1000*totalt)),' kg N/d'])
disp(['Effluent average total N load = ',num2str(totalNeload_old/(1000*totalt)),' kg N/d'])
disp(['Effluent average total COD load = ',num2str(totalCODeload_old/(1000*totalt)),' kg COD/d'])
disp(['Effluent average BOD5 load = ',num2str(BOD5eload_old/(1000*totalt)),' kg/d'])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp(' ')
disp(['Sludge production for disposal = ',num2str(TSSproduced),' kg SS'])
disp(['Average sludge production for disposal per day = ',num2str(TSSproduced/totalt),' kg SS/d'])
disp(['Sludge production released into effluent = ',num2str(TSSeload/1000),' kg SS'])
disp(['Average sludge production released into effluent per day = ',num2str(TSSeload/(1000*totalt)),' kg SS/d'])
disp(['Total sludge production = ',num2str(TSSproduced+TSSeload/1000),' kg SS'])
disp(['Total average sludge production per day = ',num2str(TSSproduced/totalt+TSSeload/(1000*totalt)),' kg SS/d'])

disp(' ')
disp('New Line Aeration Energy ')
disp(['Total aeration energy = ',num2str(airenergy_new_line),' kWh (original BSM1 version)'])
disp(['Average aeration energy per day = ',num2str(airenergy_new_line/totalt),' kWh/d (original BSM1 version)'])
disp(['Total aeration energy = ',num2str(airenergy_new_new_line),' kWh (updated BSM1 version)'])
disp(['Average aeration energy per day = ',num2str(airenergy_new_new_line/totalt),' kWh/d (updated BSM1 version)'])

disp(' ')
disp('Old Line Aeration Energy ')
disp(['Total aeration energy = ',num2str(airenergy_old_line),' kWh (original BSM1 version)'])
disp(['Average aeration energy per day = ',num2str(airenergy_old_line/totalt),' kWh/d (original BSM1 version)'])
disp(['Total aeration energy = ',num2str(airenergy_new_old_line),' kWh (updated BSM1 version)'])
disp(['Average aeration energy per day = ',num2str(airenergy_new_old_line/totalt),' kWh/d (updated BSM1 version)'])

disp(' ')
disp('New Line Pumping Energy ')
disp(['Total pumping energy (for Qintr, Qr and Qw) = ',num2str(pumpenergy_new_line),' kWh (original BSM1 version)'])
disp(['Average pumping energy per day (for Qintr, Qr and Qw) = ',num2str(pumpenergy_new_line/totalt),' kWh/d (original BSM1 version)'])
disp(['Total pumping energy (for Qintr, Qr and Qw) = ',num2str(pumpenergy_new_new_line),' kWh (based on BSM2 principles)'])
disp(['Average pumping energy per day (for Qintr, Qr and Qw) = ',num2str(pumpenergy_new_new_line/totalt),' kWh/d (based on BSM2 principles)'])

disp(' ')
disp('Old Line Pumping Energy ')
disp(['Total pumping energy (for Qintr, Qr and Qw) = ',num2str(pumpenergy_old_line),' kWh (original BSM1 version)'])
disp(['Average pumping energy per day (for Qintr, Qr and Qw) = ',num2str(pumpenergy_old_line/totalt),' kWh/d (original BSM1 version)'])
disp(['Total pumping energy (for Qintr, Qr and Qw) = ',num2str(pumpenergy_new_old_line),' kWh (based on BSM2 principles)'])
disp(['Average pumping energy per day (for Qintr, Qr and Qw) = ',num2str(pumpenergy_new_old_line/totalt),' kWh/d (based on BSM2 principles)'])

disp(' ')
disp(['Total mixing energy = ',num2str(mixenergy),' kWh (based on BSM2 principles)'])
disp(['Average mixing energy per day = ',num2str(mixenergy/totalt),' kWh/d (based on BSM2 principles)'])
disp(' ')
disp(['Total added carbon volume = ',num2str(Qcarbon),' m3'])
disp(['Average added carbon flow rate = ',num2str(Qcarbon/totalt),' m3/d'])
disp(['Total added carbon mass = ',num2str(carbonmass),' kg COD'])
disp(['Average added carbon mass per day = ',num2str(carbonmass/totalt),' kg COD/d'])
disp(' ')
disp('Operational Cost Index')
disp('----------------------')
disp(['Sludge production cost index = ',num2str(TSScost),' (using weight 5 for BSM1)'])
disp(['Aeration energy cost index = ',num2str(airenergycost),' (original BSM1 version)'])
disp(['Updated aeration energy cost index = ',num2str(airenergy_newcost),' (updated BSM1 version)'])
disp(['Pumping energy cost index = ',num2str(pumpenergycost),' (original BSM1 version)'])
disp(['Updated pumping energy cost index = ',num2str(pumpenergy_newcost),' (based on BSM2 principles)'])
disp(['Carbon source addition cost index = ',num2str(carbonmasscost)])
disp(['Mixing energy cost index = ',num2str(mixenergycost),' (based on BSM2 principles)'])
disp(['Total Operational Cost Index (OCI) = ',num2str(OCI),' (original BSM1 version)'])
disp(['Updated Total Operational Cost Index (OCI) = ',num2str(OCI_new),' (using new aeration and pumping costs)'])
disp(' ')

Nviolation=find(totalNevec2>totalNemax);
CODviolation=find(totalCODevec2>totalCODemax);
SNHviolation=find(SNHevec2>SNHemax);
TSSviolation=find(TSSevec2>TSSemax);
BOD5violation=find(BOD5evec2>BOD5emax);

noofNviolation = 1;
noofCODviolation = 1;
noofSNHviolation = 1;
noofTSSviolation = 1;
noofBOD5violation = 1;

disp('Effluent violations')
disp('-------------------')
disp(['95% percentile for effluent SNH (Ammonia95) = ',num2str(SNHeffprctile),' g N/m3'])
disp(['95% percentile for effluent TN (TN95) = ',num2str(TNeffprctile),' g N/m3'])
disp(['95% percentile for effluent TSS (TSS95) = ',num2str(TSSeffprctile),' g SS/m3'])
disp(' ')

if not(isempty(Nviolation))
  disp(['The maximum effluent total nitrogen level (', num2str(totalNemax),  ' mg N/l) was violated'])
  disp(['during ',num2str(min(totalt,length(Nviolation)*sampletime)),' days, i.e. ',num2str(min(100,length(Nviolation)*sampletime/totalt*100)),'% of the operating time.'])
  for i=2:length(Nviolation)
    if Nviolation(i-1)~=(Nviolation(i)-1)
      noofNviolation = noofNviolation+1;
    end
  end
  disp(['The limit was violated at ',num2str(noofNviolation),' different occasions.'])
  disp(' ')
end

if not(isempty(CODviolation))
  disp(['The maximum effluent total COD level (', num2str(totalCODemax) ,' mg COD/l) was violated'])
  disp(['during ',num2str(min(totalt,length(CODviolation)*sampletime)),' days, i.e. ',num2str(min(100,length(CODviolation)*sampletime/totalt*100)),'% of the operating time.'])
  for i=2:length(CODviolation)
    if CODviolation(i-1)~=(CODviolation(i)-1)
      noofCODviolation = noofCODviolation+1;
    end
  end
  disp(['The limit was violated at ',num2str(noofCODviolation),' different occasions.'])
  disp(' ')
end

if not(isempty(SNHviolation))
  disp(['The maximum effluent ammonia nitrogen level (' , num2str(SNHemax), ' mg N/l) was violated'])
  disp(['during ',num2str(min(totalt,length(SNHviolation)*sampletime)),' days, i.e. ',num2str(min(100,length(SNHviolation)*sampletime/totalt*100)),'% of the operating time.'])
  for i=2:length(SNHviolation)
    if SNHviolation(i-1)~=(SNHviolation(i)-1)
      noofSNHviolation = noofSNHviolation+1;
    end
  end
  disp(['The limit was violated at ',num2str(noofSNHviolation),' different occasions.'])
  disp(' ')
end

if not(isempty(TSSviolation))
  disp(['The maximum effluent total suspended solids level (', num2str(TSSemax) ,'mg SS/l) was violated'])
  disp(['during ',num2str(min(totalt,length(TSSviolation)*sampletime)),' days, i.e. ',num2str(min(100,length(TSSviolation)*sampletime/totalt*100)),'% of the operating time.'])
  for i=2:length(TSSviolation)
    if TSSviolation(i-1)~=(TSSviolation(i)-1)
      noofTSSviolation = noofTSSviolation+1;
    end
  end
  disp(['The limit was violated at ',num2str(noofTSSviolation),' different occasions.'])
  disp(' ')
end

if not(isempty(BOD5violation))
  disp(['The maximum effluent BOD5 level (', num2str(BOD5emax), ' mg/l) was violated'])
  disp(['during ',num2str(min(totalt,length(BOD5violation)*sampletime)),' days, i.e. ',num2str(min(100,length(BOD5violation)*sampletime/totalt*100)),'% of the operating time.'])
  for i=2:length(BOD5violation)
    if BOD5violation(i-1)~=(BOD5violation(i)-1)
      noofBOD5violation = noofBOD5violation+1;
    end
  end
  disp(['The limit was violated at ',num2str(noofBOD5violation),' different occasions.'])
  disp(' ')
end

% fignum = 3;
% figure(fignum)
% plot(time(1:(end-1)),totalNevec2)
% hold on
% plot([time(1) time(end-1)],[totalNemax totalNemax],'r')
% xlabel('time (days)')
% ylabel('Total nitrogen concentration in effluent (mg N/l)','FontSize',14)
% title('Effluent total nitrogen and limit value')
% hold off
% 
% fignum = fignum + 1;
% figure(fignum)
% plot(time(1:(end-1)),totalNevec2_new)
% hold on
% plot([time(1) time(end-1)],[totalNemax totalNemax],'r')
% xlabel('time (days)')
% ylabel('Total nitrogen concentration in effluent (mg N/l)','FontSize',14)
% title('New Line effluent total nitrogen and limit value')
% hold off
% 
% fignum = fignum + 1;
% figure(fignum)
% plot(time(1:(end-1)),totalNevec2_old)
% hold on
% plot([time(1) time(end-1)],[totalNemax totalNemax],'r')
% xlabel('time (days)')
% ylabel('Total nitrogen concentration in effluent (mg N/l)','FontSize',14)
% title('Old Line effluent total nitrogen and limit value')
% hold off
% 
% fignum = fignum + 1;
% figure(fignum)
% plot(time(1:(end-1)),totalCODevec2)
% hold on
% plot([time(1) time(end-1)],[totalCODemax totalCODemax],'r')
% xlabel('time (days)')
% ylabel('Total COD concentration in effluent (mg COD/l)','FontSize',14)
% title('Effluent total COD and limit value')
% hold off
% 
% fignum = fignum + 1;
% figure(fignum)
% plot(time(1:(end-1)),totalCODevec2_new)
% hold on
% plot([time(1) time(end-1)],[totalCODemax totalCODemax],'r')
% xlabel('time (days)')
% ylabel('Total COD concentration in effluent (mg COD/l)','FontSize',14)
% title('New Line effluent total COD and limit value')
% hold off
% 
% fignum = fignum + 1;
% figure(fignum)
% plot(time(1:(end-1)),totalCODevec2_new)
% hold on
% plot([time(1) time(end-1)],[totalCODemax totalCODemax],'r')
% xlabel('time (days)')
% ylabel('Total COD concentration in effluent (mg COD/l)','FontSize',14)
% title('Old Line effluent total COD and limit value')
% hold off
% 
% fignum = fignum + 1;
% figure(fignum)
% plot(time(1:(end-1)),SNHevec2)
% hold on
% plot([time(1) time(end-1)],[SNHemax SNHemax],'r')
% xlabel('time (days)')
% ylabel('Ammonia concentration in effluent (mg N/l)','FontSize',14)
% title('Effluent total ammonia and limit value')
% hold off
% 
% fignum = fignum + 1;
% figure(fignum)
% plot(time(1:(end-1)),SNHevec2_new)
% hold on
% plot([time(1) time(end-1)],[SNHemax SNHemax],'r')
% xlabel('time (days)')
% ylabel('Ammonia concentration in effluent (mg N/l)','FontSize',14)
% title('New Line effluent total ammonia and limit value')
% hold off
% 
% fignum = fignum + 1;
% figure(fignum)
% plot(time(1:(end-1)),SNHevec2_old)
% hold on
% plot([time(1) time(end-1)],[SNHemax SNHemax],'r')
% xlabel('time (days)')
% ylabel('Ammonia concentration in effluent (mg N/l)','FontSize',14)
% title('Old Line effluent total ammonia and limit value')
% hold off
% 
% fignum = fignum + 1;
% figure(fignum)
% plot(time(1:(end-1)),TSSevec2)
% hold on
% plot([time(1) time(end-1)],[TSSemax TSSemax],'r')
% xlabel('time (days)')
% ylabel('Suspended solids concentration in effluent (mg SS/l)','FontSize',14)
% title('Effluent suspended solids and limit value')
% hold off
% 
% fignum = fignum + 1;
% figure(fignum)
% plot(time(1:(end-1)),TSSevec2_new)
% hold on
% plot([time(1) time(end-1)],[TSSemax TSSemax],'r')
% xlabel('time (days)')
% ylabel('Suspended solids concentration in effluent (mg SS/l)','FontSize',14)
% title('New Line effluent suspended solids and limit value')
% hold off
% 
% fignum = fignum + 1;
% figure(fignum)
% plot(time(1:(end-1)),TSSevec2_old)
% hold on
% plot([time(1) time(end-1)],[TSSemax TSSemax],'r')
% xlabel('time (days)')
% ylabel('Suspended solids concentration in effluent (mg SS/l)','FontSize',14)
% title('Old Line effluent suspended solids and limit value')
% hold off
% 
% fignum = fignum + 1;
% figure(fignum)
% plot(time(1:(end-1)),BOD5evec2)
% hold on
% plot([time(1) time(end-1)],[BOD5emax BOD5emax],'r')
% xlabel('time (days)')
% ylabel('BOD5 concentration in effluent (mg/l)','FontSize',14)
% title('Effluent BOD5 and limit value')
% hold off
% 
% fignum = fignum + 1;
% figure(fignum)
% plot(time(1:(end-1)),BOD5evec2_new)
% hold on
% plot([time(1) time(end-1)],[BOD5emax BOD5emax],'r')
% xlabel('time (days)')
% ylabel('BOD5 concentration in effluent (mg/l)','FontSize',14)
% title('New Line effluent BOD5 and limit value')
% hold off
% 
% fignum = fignum + 1;
% figure(fignum)
% plot(time(1:(end-1)),BOD5evec2_old)
% hold on
% plot([time(1) time(end-1)],[BOD5emax BOD5emax],'r')
% xlabel('time (days)')
% ylabel('BOD5 concentration in effluent (mg/l)','FontSize',14)
% title('Old Line effluent BOD5 and limit value')
% hold off
% 
% fignum = fignum + 1;
% figure(fignum)
% plot(time(1:(end-1)),TSSwasteconc.*Qwasteflow)
% xlabel('time (days)')
% ylabel('Instantaneous sludge wastage rate (kg SS/d)','FontSize',14)
% 
% fignum = fignum + 1;
% figure(fignum)
% plot(time(1:(end-1)),TSSwasteconc_new.*Qwasteflow)
% xlabel('time (days)')
% ylabel('New Line instantaneous sludge wastage rate (kg SS/d)','FontSize',14)
% 
% fignum = fignum + 1;
% figure(fignum)
% plot(time(1:(end-1)),TSSwasteconc_old.*Qwasteflow)
% xlabel('time (days)')
% ylabel('Old Line instantaneous sludge wastage rate (kg SS/d)','FontSize',14)
% 
% fignum = fignum + 1;
% figure(fignum)
% plot(time(1:(end-1)),EQvecinst_new./1000,'r')
% xlabel('time (days)')
% ylabel('Instantaneous Effluent Quality index (kg poll.units/d)','FontSize',14)
% 
% fignum = fignum + 1;
% figure(fignum)
% plot(time(1:(end-1)),EQvecinst_new_new_line./1000,'r')
% xlabel('time (days)')
% ylabel('New Line instantaneous Effluent Quality index (kg poll.units/d)','FontSize',14)
% 
% fignum = fignum + 1;
% figure(fignum)
% plot(time(1:(end-1)),EQvecinst_new_old_line./1000,'r')
% xlabel('time (days)')
% ylabel('Old Line instantaneous Effluent Quality index (kg poll.units/d)','FontSize',14)
% 
% %%%%%%%%%%%%%%%
% fignum = fignum + 1;
% figure(fignum)
% plot(time(1:(end-1)),pumpenergyvec_new,'r')
% xlabel('time (days)')
% ylabel('Instantaneous pumping energy (kWh/d)','FontSize',14)
% 
% fignum = fignum + 1;
% figure(fignum)
% plot(time(1:(end-1)),pumpenergyvec_new_new_line,'r')
% xlabel('time (days)')
% ylabel('New Line instantaneous pumping energy (kWh/d)','FontSize',14)
% 
% fignum = fignum + 1;
% figure(fignum)
% plot(time(1:(end-1)),pumpenergyvec_new_old_line,'r')
% xlabel('time (days)')
% ylabel('Old Line instantaneous pumping energy (kWh/d)','FontSize',14)
% 
% fignum = fignum + 1;
% figure(fignum)
% plot(time(1:(end-1)),airenergyvec_new,'r')
% xlabel('time (days)')
% ylabel('Instantaneous aeration energy (kWh/d)','FontSize',14)
% 
% fignum = fignum + 1;
% figure(fignum)
% plot(time(1:(end-1)),airenergyvec_new_new_line,'r')
% xlabel('time (days)')
% ylabel('New Line instantaneous aeration energy (kWh/d)','FontSize',14)
% 
% fignum = fignum + 1;
% figure(fignum)
% plot(time(1:(end-1)),airenergyvec_new_old_line,'r')
% xlabel('time (days)')
% ylabel('Old Line instantaneous aeration energy (kWh/d)','FontSize',14)
%     
% % Plot of the SNH, TN and TSS curves
% SNHeffsort = sort(SNHevec2);
% TNeffsort = sort(totalNevec2);
% TSSeffsort = sort(TSSevec2);
% n = size(SNHevec2,1);
% xvalues = [1:n].*(100/n);

% figure(13)
% plot(xvalues,SNHeffsort,'b','LineWidth',1.5)
% hold on
% plot([0 95],[SNHeffprctile SNHeffprctile],'k--','LineWidth',1.5)
% plot([95 95],[0 SNHeffprctile],'k--','LineWidth',1.5)
% xlabel('Ordered S_N_H effluent concentrations (%)','FontSize',10,'FontWeight','bold')
% ylabel('S_N_H effluent concentrations (g N/m^3)','FontSize',10,'FontWeight','bold')
% title('Ordered effluent S_N_H concentrations with 95% percentile','FontSize',10,'FontWeight','bold')
% xlim([0 105])
% set(gca,'LineWidth',1.5,'FontSize',10,'FontWeight','bold')
% hold off
% 
% figure(14)
% plot(xvalues,TNeffsort,'b','LineWidth',1.5)
% hold on
% plot([0 95],[TNeffprctile TNeffprctile],'k--','LineWidth',1.5)
% plot([95 95],[0 TNeffprctile],'k--','LineWidth',1.5)
% xlabel('Ordered TN effluent concentrations (%)','FontSize',10,'FontWeight','bold')
% ylabel('TN effluent concentrations (g N/m^3)','FontSize',10,'FontWeight','bold')
% title('Ordered effluent TN concentrations with 95% percentile','FontSize',10,'FontWeight','bold')
% xlim([0 105])
% set(gca,'LineWidth',1.5,'FontSize',10,'FontWeight','bold')
% hold off
% 
% figure(15)
% plot(xvalues,TSSeffsort,'b','LineWidth',1.5)
% hold on
% plot([0 95],[TSSeffprctile TSSeffprctile],'k--','LineWidth',1.5)
% plot([95 95],[0 TSSeffprctile],'k--','LineWidth',1.5)
% xlabel('Ordered TSS effluent concentrations (%)','FontSize',10,'FontWeight','bold')
% ylabel('TSS effluent concentrations (g SS/m^3)','FontSize',10,'FontWeight','bold')
% title('Ordered effluent TSS concentrations with 95% percentile','FontSize',10,'FontWeight','bold')
% xlim([0 105])
% set(gca,'LineWidth',1.5,'FontSize',10,'FontWeight','bold')
% hold off

% Results
% Call the 'fuzzified' expert module to detect settling problems
% perf_risk