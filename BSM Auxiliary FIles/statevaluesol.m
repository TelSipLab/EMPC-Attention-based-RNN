disp(' ')
disp(' ')
disp('This script will provide the final values of all state variables')
disp('of the last openloop run, i.e. (quasi) steady state results.')
disp(' ')
[m n]=size(reac1);

SNkj0 = in(m,10) + in(m,11) + in(m,12) + i_XB*(in(m,5) + in(m,6)) + i_XP*(in(m,7) + in(m,3));
SS0 = 0.75*(in(m,3) + in(m,4) + in(m,5) + in(m,6) + in(m,7));
COD0 = in(m,1) + in(m,2) + in(m,3) + in(m,4) + in(m,5) + in(m,6) + in(m,7);
TN0 = in(m,9) + SNkj0;

disp('Influent characteristics')
disp('************************')
disp(['   SI =  ', num2str(in(m,1)), ' mg COD/l']);
disp(['   SS =  ', num2str(in(m,2)), ' mg COD/l']);
disp(['   XI =  ', num2str(in(m,3)), ' mg COD/l']);
disp(['   XS =  ', num2str(in(m,4)), ' mg COD/l']);
disp(['   XBH = ', num2str(in(m,5)), ' mg COD/l']);
disp(['   XBA = ', num2str(in(m,6)), ' mg COD/l']);
disp(['   XP =  ', num2str(in(m,7)), ' mg COD/l']);
disp(['   SO =  ', num2str(in(m,8)), ' mg -COD/l']);
disp(['   SNO = ', num2str(in(m,9)), ' mg N/l']);
disp(['   SNH = ', num2str(in(m,10)), ' mg N/l']);
disp(['   SND = ', num2str(in(m,11)), ' mg N/l']);
disp(['   XND = ', num2str(in(m,12)), ' mg N/l']);
disp(['   SALK = ', num2str(in(m,13)), ' mol HCO3/m3']);
disp(['   TSS = ', num2str(in(m,14)), ' mg SS/l']);
disp(['   SNkj = ', num2str(SNkj0), ' mg N/l']);
disp(['   S.S = ', num2str(SS0), ' mg N/l']);
disp(['   COD = ', num2str(COD0), ' mg N/l']);
disp(['   TN = ', num2str(TN0), ' mg N/l']);

disp(' ')
disp('Flow conditions')
disp('***************')
disp(['   Influent flow to WWTP = ', num2str(in(m,15)), ' m3/d']);
disp(['   Influent flow to Phosphporus removal  = ', num2str(ASinput(m,15)), ' m3/d']);
disp(['   Influent flow to new line AS  = ', num2str(ASinputnew(m,15)), ' m3/d']);
disp(['   Influent flow to old line AS  = ', num2str(ASinputold(m,15)), ' m3/d']);
disp(['   Internal recirculation new line = ', num2str(rec_new(m,15)), ' m3/d']);
disp(['   Internal recirculation old line = ', num2str(rec_old(m,15)), ' m3/d']);
disp(['   Settler new line feed flow = ', num2str(feednew(m,15)), ' m3/d']);
disp(['   Settler old line feed flow = ', num2str(feedold(m,15)), ' m3/d']);
disp(['   Returned sludge flow new line = ', num2str(settlernew(m,15)), ' m3/d']);
disp(['   Returned sludge flow old line = ', num2str(settlerold(m,15)), ' m3/d']);
disp(['   Wastage sludge flow new line = ', num2str(settlernew(m,16)), ' m3/d']);
disp(['   Wastage sludge flow old line = ', num2str(settlerold(m,16)), ' m3/d']);
disp(['   Effluent flow new line = ', num2str(settlernew(m,31)), ' m3/d']);
disp(['   Effluent flow oldw line = ', num2str(settlerold(m,31)), ' m3/d']);

disp(' ')
disp('Aeration conditions')
disp('***************')
disp(['   New line 1st aereted reactor = ', num2str(KLa2), ' /d']);
disp(['   New line 2nd aereted reactor = ', num2str(KLa3), ' /d']);
disp(['   New line 3rd aereted reactor = ', num2str(KLa4), ' /d']);
disp(['   Old line 1st aereted reactor = ', num2str(KLa6), ' /d']);
disp(['   Old line 2nd aereted reactor = ', num2str(KLa7), ' /d']);
disp(['   Old line 3rd aereted reactor = ', num2str(KLa8), ' /d']);

disp(' ')
disp('Input to Phosphorus Removal')
disp('***********')
disp(['   SI =  ', num2str(ASinput(m,1)/ASinput(m,15)), ' mg COD/l']);
disp(['   SS =  ', num2str(ASinput(m,2)/ASinput(m,15)), ' mg COD/l']);
disp(['   XI =  ', num2str(ASinput(m,3)/ASinput(m,15)), ' mg COD/l']);
disp(['   XS =  ', num2str(ASinput(m,4)/ASinput(m,15)), ' mg COD/l']);
disp(['   XBH = ', num2str(ASinput(m,5)/ASinput(m,15)), ' mg COD/l']);
disp(['   XBA = ', num2str(ASinput(m,6)/ASinput(m,15)), ' mg COD/l']);
disp(['   XP =  ', num2str(ASinput(m,7)/ASinput(m,15)), ' mg COD/l']);
disp(['   SO =  ', num2str(ASinput(m,8)/ASinput(m,15)), ' mg -COD/l']);
disp(['   SNO = ', num2str(ASinput(m,9)/ASinput(m,15)), ' mg N/l']);
disp(['   SNH = ', num2str(ASinput(m,10)/ASinput(m,15)), ' mg N/l']);
disp(['   SND = ', num2str(ASinput(m,11)/ASinput(m,15)), ' mg N/l']);
disp(['   XND = ', num2str(ASinput(m,12)/ASinput(m,15)), ' mg N/l']);
disp(['   SALK = ', num2str(ASinput(m,13)/ASinput(m,15)), ' mol HCO3/m3']);
disp(['   TSS = ', num2str(ASinput(m,14)/ASinput(m,15)), ' mg SS/l']);

disp(' ')
disp('Input to old Line AS')
disp('***********')
disp(['   SI =  ', num2str(ASinputnew(m,1)/ASinputnew(m,15)), ' mg COD/l']);
disp(['   SS =  ', num2str(ASinputnew(m,2)/ASinputnew(m,15)), ' mg COD/l']);
disp(['   XI =  ', num2str(ASinputnew(m,3)/ASinputnew(m,15)), ' mg COD/l']);
disp(['   XS =  ', num2str(ASinputnew(m,4)/ASinputnew(m,15)), ' mg COD/l']);
disp(['   XBH = ', num2str(ASinputnew(m,5)/ASinputnew(m,15)), ' mg COD/l']);
disp(['   XBA = ', num2str(ASinputnew(m,6)/ASinputnew(m,15)), ' mg COD/l']);
disp(['   XP =  ', num2str(ASinputnew(m,7)/ASinputnew(m,15)), ' mg COD/l']);
disp(['   SO =  ', num2str(ASinputnew(m,8)/ASinputnew(m,15)), ' mg -COD/l']);
disp(['   SNO = ', num2str(ASinputnew(m,9)/ASinputnew(m,15)), ' mg N/l']);
disp(['   SNH = ', num2str(ASinputnew(m,10)/ASinputnew(m,15)), ' mg N/l']);
disp(['   SND = ', num2str(ASinputnew(m,11)/ASinputnew(m,15)), ' mg N/l']);
disp(['   XND = ', num2str(ASinputnew(m,12)/ASinputnew(m,15)), ' mg N/l']);
disp(['   SALK = ', num2str(ASinputnew(m,13)/ASinputnew(m,15)), ' mol HCO3/m3']);
disp(['   TSS = ', num2str(ASinputnew(m,14)/ASinputnew(m,15)), ' mg SS/l']);

disp(' ')
disp('Reactor 1')
disp('*********')
disp(['   SI =  ', num2str(reac1(m,1)), ' mg COD/l']);
disp(['   SS =  ', num2str(reac1(m,2)), ' mg COD/l']);
disp(['   XI =  ', num2str(reac1(m,3)), ' mg COD/l']);
disp(['   XS =  ', num2str(reac1(m,4)), ' mg COD/l']);
disp(['   XBH = ', num2str(reac1(m,5)), ' mg COD/l']);
disp(['   XBA = ', num2str(reac1(m,6)), ' mg COD/l']);
disp(['   XP =  ', num2str(reac1(m,7)), ' mg COD/l']);
disp(['   SO =  ', num2str(reac1(m,8)), ' mg -COD/l']);
disp(['   SNO = ', num2str(reac1(m,9)), ' mg N/l']);
disp(['   SNH = ', num2str(reac1(m,10)), ' mg N/l']);
disp(['   SND = ', num2str(reac1(m,11)), ' mg N/l']);
disp(['   XND = ', num2str(reac1(m,12)), ' mg N/l']);
disp(['   SALK = ', num2str(reac1(m,13)), ' mol HCO3/m3']);
disp(['   TSS = ', num2str(reac1(m,14)), ' mg SS/l']);

disp(' ')
disp('Reactor 2')
disp('*********')
disp(['   SI =  ', num2str(reac2(m,1)), ' mg COD/l']);
disp(['   SS =  ', num2str(reac2(m,2)), ' mg COD/l']);
disp(['   XI =  ', num2str(reac2(m,3)), ' mg COD/l']);
disp(['   XS =  ', num2str(reac2(m,4)), ' mg COD/l']);
disp(['   XBH = ', num2str(reac2(m,5)), ' mg COD/l']);
disp(['   XBA = ', num2str(reac2(m,6)), ' mg COD/l']);
disp(['   XP =  ', num2str(reac2(m,7)), ' mg COD/l']);
disp(['   SO =  ', num2str(reac2(m,8)), ' mg -COD/l']);
disp(['   SNO = ', num2str(reac2(m,9)), ' mg N/l']);
disp(['   SNH = ', num2str(reac2(m,10)), ' mg N/l']);
disp(['   SND = ', num2str(reac2(m,11)), ' mg N/l']);
disp(['   XND = ', num2str(reac2(m,12)), ' mg N/l']);
disp(['   SALK = ', num2str(reac2(m,13)), ' mol HCO3/m3']);
disp(['   TSS = ', num2str(reac2(m,14)), ' mg SS/l']);

disp(' ')
disp('Reactor 3')
disp('*********')
disp(['   SI =  ', num2str(reac3(m,1)), ' mg COD/l']);
disp(['   SS =  ', num2str(reac3(m,2)), ' mg COD/l']);
disp(['   XI =  ', num2str(reac3(m,3)), ' mg COD/l']);
disp(['   XS =  ', num2str(reac3(m,4)), ' mg COD/l']);
disp(['   XBH = ', num2str(reac3(m,5)), ' mg COD/l']);
disp(['   XBA = ', num2str(reac3(m,6)), ' mg COD/l']);
disp(['   XP =  ', num2str(reac3(m,7)), ' mg COD/l']);
disp(['   SO =  ', num2str(reac3(m,8)), ' mg -COD/l']);
disp(['   SNO = ', num2str(reac3(m,9)), ' mg N/l']);
disp(['   SNH = ', num2str(reac3(m,10)), ' mg N/l']);
disp(['   SND = ', num2str(reac3(m,11)), ' mg N/l']);
disp(['   XND = ', num2str(reac3(m,12)), ' mg N/l']);
disp(['   SALK = ', num2str(reac3(m,13)), ' mol HCO3/m3']);
disp(['   TSS = ', num2str(reac3(m,14)), ' mg SS/l']);

disp(' ')
disp('Reactor 4')
disp('*********')
disp(['   SI =  ', num2str(reac4(m,1)), ' mg COD/l']);
disp(['   SS =  ', num2str(reac4(m,2)), ' mg COD/l']);
disp(['   XI =  ', num2str(reac4(m,3)), ' mg COD/l']);
disp(['   XS =  ', num2str(reac4(m,4)), ' mg COD/l']);
disp(['   XBH = ', num2str(reac4(m,5)), ' mg COD/l']);
disp(['   XBA = ', num2str(reac4(m,6)), ' mg COD/l']);
disp(['   XP =  ', num2str(reac4(m,7)), ' mg COD/l']);
disp(['   SO =  ', num2str(reac4(m,8)), ' mg -COD/l']);
disp(['   SNO = ', num2str(reac4(m,9)), ' mg N/l']);
disp(['   SNH = ', num2str(reac4(m,10)), ' mg N/l']);
disp(['   SND = ', num2str(reac4(m,11)), ' mg N/l']);
disp(['   XND = ', num2str(reac4(m,12)), ' mg N/l']);
disp(['   SALK = ', num2str(reac4(m,13)), ' mol HCO3/m3']);
disp(['   TSS = ', num2str(reac4(m,14)), ' mg SS/l']);

disp(' ')
disp('Input to Old Line AS')
disp('***********')
disp(['   SI =  ', num2str(ASinputold(m,1)/ASinputold(m,15)), ' mg COD/l']);
disp(['   SS =  ', num2str(ASinputold(m,2)/ASinputold(m,15)), ' mg COD/l']);
disp(['   XI =  ', num2str(ASinputold(m,3)/ASinputold(m,15)), ' mg COD/l']);
disp(['   XS =  ', num2str(ASinputold(m,4)/ASinputold(m,15)), ' mg COD/l']);
disp(['   XBH = ', num2str(ASinputold(m,5)/ASinputold(m,15)), ' mg COD/l']);
disp(['   XBA = ', num2str(ASinputold(m,6)/ASinputold(m,15)), ' mg COD/l']);
disp(['   XP =  ', num2str(ASinputold(m,7)/ASinputold(m,15)), ' mg COD/l']);
disp(['   SO =  ', num2str(ASinputold(m,8)/ASinputold(m,15)), ' mg -COD/l']);
disp(['   SNO = ', num2str(ASinputold(m,9)/ASinputold(m,15)), ' mg N/l']);
disp(['   SNH = ', num2str(ASinputold(m,10)/ASinputold(m,15)), ' mg N/l']);
disp(['   SND = ', num2str(ASinputold(m,11)/ASinputold(m,15)), ' mg N/l']);
disp(['   XND = ', num2str(ASinputold(m,12)/ASinputold(m,15)), ' mg N/l']);
disp(['   SALK = ', num2str(ASinputold(m,13)/ASinputold(m,15)), ' mol HCO3/m3']);
disp(['   TSS = ', num2str(ASinputold(m,14)/ASinputold(m,15)), ' mg SS/l']);

disp(' ')
disp('Reactor 5')
disp('*********')
disp(['   SI =  ', num2str(reac5(m,1)), ' mg COD/l']);
disp(['   SS =  ', num2str(reac5(m,2)), ' mg COD/l']);
disp(['   XI =  ', num2str(reac5(m,3)), ' mg COD/l']);
disp(['   XS =  ', num2str(reac5(m,4)), ' mg COD/l']);
disp(['   XBH = ', num2str(reac5(m,5)), ' mg COD/l']);
disp(['   XBA = ', num2str(reac5(m,6)), ' mg COD/l']);
disp(['   XP =  ', num2str(reac5(m,7)), ' mg COD/l']);
disp(['   SO =  ', num2str(reac5(m,8)), ' mg -COD/l']);
disp(['   SNO = ', num2str(reac5(m,9)), ' mg N/l']);
disp(['   SNH = ', num2str(reac5(m,10)), ' mg N/l']);
disp(['   SND = ', num2str(reac5(m,11)), ' mg N/l']);
disp(['   XND = ', num2str(reac5(m,12)), ' mg N/l']);
disp(['   SALK = ', num2str(reac5(m,13)), ' mol HCO3/m3']);
disp(['   TSS = ', num2str(reac5(m,14)), ' mg SS/l']);

disp(' ')
disp('Reactor 6')
disp('*********')
disp(['   SI =  ', num2str(reac6(m,1)), ' mg COD/l']);
disp(['   SS =  ', num2str(reac6(m,2)), ' mg COD/l']);
disp(['   XI =  ', num2str(reac6(m,3)), ' mg COD/l']);
disp(['   XS =  ', num2str(reac6(m,4)), ' mg COD/l']);
disp(['   XBH = ', num2str(reac6(m,5)), ' mg COD/l']);
disp(['   XBA = ', num2str(reac6(m,6)), ' mg COD/l']);
disp(['   XP =  ', num2str(reac6(m,7)), ' mg COD/l']);
disp(['   SO =  ', num2str(reac6(m,8)), ' mg -COD/l']);
disp(['   SNO = ', num2str(reac6(m,9)), ' mg N/l']);
disp(['   SNH = ', num2str(reac6(m,10)), ' mg N/l']);
disp(['   SND = ', num2str(reac6(m,11)), ' mg N/l']);
disp(['   XND = ', num2str(reac6(m,12)), ' mg N/l']);
disp(['   SALK = ', num2str(reac6(m,13)), ' mol HCO3/m3']);
disp(['   TSS = ', num2str(reac6(m,14)), ' mg SS/l']);

disp(' ')
disp('Reactor 7')
disp('*********')
disp(['   SI =  ', num2str(reac7(m,1)), ' mg COD/l']);
disp(['   SS =  ', num2str(reac7(m,2)), ' mg COD/l']);
disp(['   XI =  ', num2str(reac7(m,3)), ' mg COD/l']);
disp(['   XS =  ', num2str(reac7(m,4)), ' mg COD/l']);
disp(['   XBH = ', num2str(reac7(m,5)), ' mg COD/l']);
disp(['   XBA = ', num2str(reac7(m,6)), ' mg COD/l']);
disp(['   XP =  ', num2str(reac7(m,7)), ' mg COD/l']);
disp(['   SO =  ', num2str(reac7(m,8)), ' mg -COD/l']);
disp(['   SNO = ', num2str(reac7(m,9)), ' mg N/l']);
disp(['   SNH = ', num2str(reac7(m,10)), ' mg N/l']);
disp(['   SND = ', num2str(reac7(m,11)), ' mg N/l']);
disp(['   XND = ', num2str(reac7(m,12)), ' mg N/l']);
disp(['   SALK = ', num2str(reac7(m,13)), ' mol HCO3/m3']);
disp(['   TSS = ', num2str(reac7(m,14)), ' mg SS/l']);

disp(' ')
disp('Reactor 8')
disp('*********')
disp(['   SI =  ', num2str(reac8(m,1)), ' mg COD/l']);
disp(['   SS =  ', num2str(reac8(m,2)), ' mg COD/l']);
disp(['   XI =  ', num2str(reac8(m,3)), ' mg COD/l']);
disp(['   XS =  ', num2str(reac8(m,4)), ' mg COD/l']);
disp(['   XBH = ', num2str(reac8(m,5)), ' mg COD/l']);
disp(['   XBA = ', num2str(reac8(m,6)), ' mg COD/l']);
disp(['   XP =  ', num2str(reac8(m,7)), ' mg COD/l']);
disp(['   SO =  ', num2str(reac8(m,8)), ' mg -COD/l']);
disp(['   SNO = ', num2str(reac8(m,9)), ' mg N/l']);
disp(['   SNH = ', num2str(reac8(m,10)), ' mg N/l']);
disp(['   SND = ', num2str(reac8(m,11)), ' mg N/l']);
disp(['   XND = ', num2str(reac8(m,12)), ' mg N/l']);
disp(['   SALK = ', num2str(reac8(m,13)), ' mol HCO3/m3']);
disp(['   TSS = ', num2str(reac8(m,14)), ' mg SS/l']);

disp(' ')
disp('Reactor 9')
disp('*********')
disp(['   SI =  ', num2str(reac9(m,1)), ' mg COD/l']);
disp(['   SS =  ', num2str(reac9(m,2)), ' mg COD/l']);
disp(['   XI =  ', num2str(reac9(m,3)), ' mg COD/l']);
disp(['   XS =  ', num2str(reac9(m,4)), ' mg COD/l']);
disp(['   XBH = ', num2str(reac9(m,5)), ' mg COD/l']);
disp(['   XBA = ', num2str(reac9(m,6)), ' mg COD/l']);
disp(['   XP =  ', num2str(reac9(m,7)), ' mg COD/l']);
disp(['   SO =  ', num2str(reac9(m,8)), ' mg -COD/l']);
disp(['   SNO = ', num2str(reac9(m,9)), ' mg N/l']);
disp(['   SNH = ', num2str(reac9(m,10)), ' mg N/l']);
disp(['   SND = ', num2str(reac9(m,11)), ' mg N/l']);
disp(['   XND = ', num2str(reac9(m,12)), ' mg N/l']);
disp(['   SALK = ', num2str(reac9(m,13)), ' mol HCO3/m3']);
disp(['   TSS = ', num2str(reac9(m,14)), ' mg SS/l']);

disp(' ')
disp('Settler new underflow')
disp('*****************')
disp(['   SI =  ', num2str(settlernew(m,1)), ' mg COD/l']);
disp(['   SS =  ', num2str(settlernew(m,2)), ' mg COD/l']);
disp(['   XI =  ', num2str(settlernew(m,3)), ' mg COD/l']);
disp(['   XS =  ', num2str(settlernew(m,4)), ' mg COD/l']);
disp(['   XBH = ', num2str(settlernew(m,5)), ' mg COD/l']);
disp(['   XBA = ', num2str(settlernew(m,6)), ' mg COD/l']);
disp(['   XP =  ', num2str(settlernew(m,7)), ' mg COD/l']);
disp(['   SO =  ', num2str(settlernew(m,8)), ' mg -COD/l']);
disp(['   SNO = ', num2str(settlernew(m,9)), ' mg N/l']);
disp(['   SNH = ', num2str(settlernew(m,10)), ' mg N/l']);
disp(['   SND = ', num2str(settlernew(m,11)), ' mg N/l']);
disp(['   XND = ', num2str(settlernew(m,12)), ' mg N/l']);
disp(['   SALK = ', num2str(settlernew(m,13)), ' mol HCO3/m3']);
disp(['   TSS = ', num2str(settlernew(m,14)), ' mg SS/l']);

disp(' ')
disp('Settler old underflow')
disp('*****************')
disp(['   SI =  ', num2str(settlerold(m,1)), ' mg COD/l']);
disp(['   SS =  ', num2str(settlerold(m,2)), ' mg COD/l']);
disp(['   XI =  ', num2str(settlerold(m,3)), ' mg COD/l']);
disp(['   XS =  ', num2str(settlerold(m,4)), ' mg COD/l']);
disp(['   XBH = ', num2str(settlerold(m,5)), ' mg COD/l']);
disp(['   XBA = ', num2str(settlerold(m,6)), ' mg COD/l']);
disp(['   XP =  ', num2str(settlerold(m,7)), ' mg COD/l']);
disp(['   SO =  ', num2str(settlerold(m,8)), ' mg -COD/l']);
disp(['   SNO = ', num2str(settlerold(m,9)), ' mg N/l']);
disp(['   SNH = ', num2str(settlerold(m,10)), ' mg N/l']);
disp(['   SND = ', num2str(settlerold(m,11)), ' mg N/l']);
disp(['   XND = ', num2str(settlerold(m,12)), ' mg N/l']);
disp(['   SALK = ', num2str(settlerold(m,13)), ' mol HCO3/m3']);
disp(['   TSS = ', num2str(settlerold(m,14)), ' mg SS/l']);

disp(' ')
disp('Settler new effluent')
disp('****************')
disp(['   SI =  ', num2str(settlernew(m,17)), ' mg COD/l']);
disp(['   SS =  ', num2str(settlernew(m,18)), ' mg COD/l']);
disp(['   XI =  ', num2str(settlernew(m,19)), ' mg COD/l']);
disp(['   XS =  ', num2str(settlernew(m,20)), ' mg COD/l']);
disp(['   XBH = ', num2str(settlernew(m,21)), ' mg COD/l']);
disp(['   XBA = ', num2str(settlernew(m,22)), ' mg COD/l']);
disp(['   XP =  ', num2str(settlernew(m,23)), ' mg COD/l']);
disp(['   SO =  ', num2str(settlernew(m,24)), ' mg -COD/l']);
disp(['   SNO = ', num2str(settlernew(m,25)), ' mg N/l']);
disp(['   SNH = ', num2str(settlernew(m,26)), ' mg N/l']);
disp(['   SND = ', num2str(settlernew(m,27)), ' mg N/l']);
disp(['   XND = ', num2str(settlernew(m,28)), ' mg N/l']);
disp(['   SALK = ', num2str(settlernew(m,29)), ' mol HCO3/m3']);
disp(['   TSS = ', num2str(settlernew(m,30)), ' mg SS/l']);

disp(' ')
disp('Settler old effluent')
disp('****************')
disp(['   SI =  ', num2str(settlerold(m,17)), ' mg COD/l']);
disp(['   SS =  ', num2str(settlerold(m,18)), ' mg COD/l']);
disp(['   XI =  ', num2str(settlerold(m,19)), ' mg COD/l']);
disp(['   XS =  ', num2str(settlerold(m,20)), ' mg COD/l']);
disp(['   XBH = ', num2str(settlerold(m,21)), ' mg COD/l']);
disp(['   XBA = ', num2str(settlerold(m,22)), ' mg COD/l']);
disp(['   XP =  ', num2str(settlerold(m,23)), ' mg COD/l']);
disp(['   SO =  ', num2str(settlerold(m,24)), ' mg -COD/l']);
disp(['   SNO = ', num2str(settlerold(m,25)), ' mg N/l']);
disp(['   SNH = ', num2str(settlerold(m,26)), ' mg N/l']);
disp(['   SND = ', num2str(settlerold(m,27)), ' mg N/l']);
disp(['   XND = ', num2str(settlerold(m,28)), ' mg N/l']);
disp(['   SALK = ', num2str(settlerold(m,29)), ' mol HCO3/m3']);
disp(['   TSS = ', num2str(settlerold(m,30)), ' mg SS/l']);

disp(' ')
disp('Settler new internal (1 is top layer)')
disp('*********************************')
disp(['   TSS1 = ', num2str(settlernew(m,32)), ' mg SS/l']);
disp(['   TSS2 = ', num2str(settlernew(m,33)), ' mg SS/l']);
disp(['   TSS3 = ', num2str(settlernew(m,34)), ' mg SS/l']);
disp(['   TSS4 = ', num2str(settlernew(m,35)), ' mg SS/l']);
disp(['   TSS5 = ', num2str(settlernew(m,36)), ' mg SS/l']);
disp(['   TSS6 = ', num2str(settlernew(m,37)), ' mg SS/l']);
disp(['   TSS7 = ', num2str(settlernew(m,38)), ' mg SS/l']);
disp(['   TSS8 = ', num2str(settlernew(m,39)), ' mg SS/l']);
disp(['   TSS9 = ', num2str(settlernew(m,40)), ' mg SS/l']);
disp(['   TSS10 = ', num2str(settlernew(m,41)), ' mg SS/l']);

disp(' ')
disp('Settler old internal (1 is top layer)')
disp('*********************************')
disp(['   TSS1 = ', num2str(settlerold(m,32)), ' mg SS/l']);
disp(['   TSS2 = ', num2str(settlerold(m,33)), ' mg SS/l']);
disp(['   TSS3 = ', num2str(settlerold(m,34)), ' mg SS/l']);
disp(['   TSS4 = ', num2str(settlerold(m,35)), ' mg SS/l']);
disp(['   TSS5 = ', num2str(settlerold(m,36)), ' mg SS/l']);
disp(['   TSS6 = ', num2str(settlerold(m,37)), ' mg SS/l']);
disp(['   TSS7 = ', num2str(settlerold(m,38)), ' mg SS/l']);
disp(['   TSS8 = ', num2str(settlerold(m,39)), ' mg SS/l']);
disp(['   TSS9 = ', num2str(settlerold(m,40)), ' mg SS/l']);
disp(['   TSS10 = ', num2str(settlerold(m,41)), ' mg SS/l']);

SNkjeff = effluent_combined(m,10) + effluent_combined(m,11) + effluent_combined(m,12) + i_XB*(effluent_combined(m,5) + effluent_combined(m,6)) + i_XP*(effluent_combined(m,7) + effluent_combined(m,3));
SSeff = 0.75*(effluent_combined(m,3) + effluent_combined(m,4) + effluent_combined(m,5) + effluent_combined(m,6) + effluent_combined(m,7));
CODeff = effluent_combined(m,1) + effluent_combined(m,2) + effluent_combined(m,3) + effluent_combined(m,4) + effluent_combined(m,5) + effluent_combined(m,6) + effluent_combined(m,7);
TNeff = effluent_combined(m,9) + SNkjeff;

disp(' ')
disp('Effluent Characteristics ')
disp('*********************************')
disp(['   SI =  ', num2str(effluent_combined(m,1)), ' mg COD/l']);
disp(['   SS =  ', num2str(effluent_combined(m,2)), ' mg COD/l']);
disp(['   XI =  ', num2str(effluent_combined(m,3)), ' mg COD/l']);
disp(['   XS =  ', num2str(effluent_combined(m,4)), ' mg COD/l']);
disp(['   XBH = ', num2str(effluent_combined(m,5)), ' mg COD/l']);
disp(['   XBA = ', num2str(effluent_combined(m,6)), ' mg COD/l']);
disp(['   XP =  ', num2str(effluent_combined(m,7)), ' mg COD/l']);
disp(['   SO =  ', num2str(effluent_combined(m,8)), ' mg -COD/l']);
disp(['   SNO = ', num2str(effluent_combined(m,9)), ' mg N/l']);
disp(['   SNH = ', num2str(effluent_combined(m,10)), ' mg N/l']);
disp(['   SND = ', num2str(effluent_combined(m,11)), ' mg N/l']);
disp(['   XND = ', num2str(effluent_combined(m,12)), ' mg N/l']);
disp(['   SALK = ', num2str(effluent_combined(m,13)), ' mol HCO3/m3']);
disp(['   TSS = ', num2str(effluent_combined(m,14)), ' mg SS/l']);
disp(['   SNkj = ', num2str(SNkjeff), ' mg N/l']);
disp(['   S.S = ', num2str(SSeff), ' mg N/l']);
disp(['   COD = ', num2str(CODeff), ' mg N/l']);
disp(['   TN = ', num2str(TNeff), ' mg N/l']);

reactorvol = VOL1+VOL2+VOL3+VOL4+VOL5+VOL6+VOL7+VOL8+VOL9;
settlervol_new = DIM_new(1)*DIM_new(2);
settlervol_old = DIM_old(1)*DIM_old(2);
settlervol = settlervol_new + settlervol_old;
totalvol = reactorvol+settlervol;

sludge_new_line = reac1(m,14)*VOL1 + reac2(m,14)*VOL2 + reac3(m,14)*VOL3 + reac4(m,14)*VOL4;
sludge_old_line = reac5(m,14)*VOL5 + reac6(m,14)*VOL6 + reac7(m,14)*VOL7 + reac9(m,14)*VOL8;
sludge_ph = reac9(m,14)*VOL9;
sludge = sludge_new_line + sludge_old_line + sludge_ph;

sludge2_new_line = (reac1(m,5)+reac1(m,6))*VOL1 + (reac2(m,5)+reac2(m,6))*VOL2 + (reac3(m,5)+reac3(m,6))*VOL3 + (reac4(m,5)+reac4(m,6))*VOL4 + sum(((reac4(m,5)+reac4(m,6)).*(settlernew(m,32:41)./reac4(m,14))).*(settlervol_new/nooflayers));
sludge2_old_line = (reac5(m,5)+reac5(m,6))*VOL5 + (reac6(m,5)+reac6(m,6))*VOL6 + (reac7(m,5)+reac7(m,6))*VOL7 + (reac8(m,5)+reac8(m,6))*VOL8 + sum(((reac8(m,5)+reac8(m,6)).*(settlerold(m,32:41)./reac8(m,14))).*(settlervol_old/nooflayers));
sludge2 = sludge2_new_line + sludge2_old_line;

waste_new_line = settlernew(m,14)*settlernew(m,16) + settlernew(m,30)*settlernew(m,31);
waste_old_line = settlerold(m,14)*settlerold(m,16) + settlerold(m,30)*settlerold(m,31);
waste = waste_new_line + waste_old_line;

waste2_new_line = sum(settlernew(m,5:6).*settlernew(m,16)) + sum(settlernew(m,21:22).*settlernew(m,31));
waste2_old_line = sum(settlerold(m,5:6).*settlerold(m,16)) + sum(settlerold(m,21:22).*settlerold(m,31));
waste2 = waste2_new_line + waste2_old_line;
sludge_age = sludge/waste;
sludge_age2 = sludge2/waste2;

disp(' ')
disp('Other variables')
disp('***************')
disp(['   Trad. sludge age (XS + XP + XI + XBH + XBA in reactors) = ', num2str(sludge_age), ' days']);
disp(['   Spec. sludge age (XBH + XBA in reactors and settler) = ', num2str(sludge_age2), ' days']);
disp(['   Total hydraulic retention time = ', num2str(totalvol/(in(m,15))*24), ' hours']);
disp(['   Reactor hydraulic retention time = ', num2str(reactorvol/(in(m,15))*24), ' hours']);
disp(['   Thickening factor at bottom of settler new line (TSSu/TSSfeed) = ', num2str(settlernew(m,42))]);
disp(['   Thickening factor at bottom of settler old line (TSSu/TSSfeed) = ', num2str(settlerold(m,42))]);
disp(['   Thinning factor at top of settler new line (TSSeff/TSSfeed) = ', num2str(settlernew(m,43))]);
disp(['   Thinning factor at top of settler old line (TSSeff/TSSfeed) = ', num2str(settlerold(m,43))]);

disp(' ')
disp('Dimensions')
disp('**********')
if reac1(m,8)<0.2
disp('   Reactor 1 is anoxic')
else
disp('   Reactor 1 is aerobic')
end
disp(['   Volume reactor 1 = ', num2str(VOL1), ' m3']);
if reac2(m,8)<0.2
disp('   Reactor 2 is anoxic')
else
disp('   Reactor 2 is aerobic')
end
disp(['   Volume reactor 2 = ', num2str(VOL2), ' m3']);
if reac3(m,8)<0.2
disp('   Reactor 3 is anoxic')
else
disp('   Reactor 3 is aerobic')
end
disp(['   Volume reactor 3 = ', num2str(VOL3), ' m3']);
if reac4(m,8)<0.2
disp('   Reactor 4 is anoxic')
else
disp('   Reactor 4 is aerobic')
end
disp(['   Volume reactor 4 = ', num2str(VOL4), ' m3']);
if reac5(m,8)<0.2
disp('   Reactor 5 is anoxic')
else
disp('   Reactor 5 is aerobic')
end
disp(['   Volume reactor 5 = ', num2str(VOL5), ' m3']);
if reac6(m,8)<0.2
disp('   Reactor 6 is anoxic')
else
disp('   Reactor 6 is aerobic')
end
disp(['   Volume reactor 6 = ', num2str(VOL5), ' m3']);
if reac7(m,8)<0.2
disp('   Reactor 7 is anoxic')
else
disp('   Reactor 7 is aerobic')
end
disp(['   Volume reactor 7 = ', num2str(VOL5), ' m3']);
if reac8(m,8)<0.2
disp('   Reactor 8 is anoxic')
else
disp('   Reactor 8 is aerobic')
end
disp(['   Volume reactor 8 = ', num2str(VOL5), ' m3']);
disp('   Reactor 9 is anaerobic')
disp(['   Volume reactor 9 = ', num2str(VOL5), ' m3']);
disp(['   Settler height new line = ', num2str(DIM_new(2)), ' m']);
disp(['   Settler area new line = ', num2str(DIM_new(1)), ' m2']);
disp(['   Settler volume new = ', num2str(settlervol_new), ' m3']);

disp(['   Settler height old line = ', num2str(DIM_old(2)), ' m']);
disp(['   Settler area old line = ', num2str(DIM_old(1)), ' m2']);
disp(['   Settler volume old line  = ', num2str(settlervol_old), ' m3']);

