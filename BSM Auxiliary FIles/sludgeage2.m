[n,m]=size(reac1);
settlervol_new = DIM_new(1)*DIM_new(2);
settlervol_old = DIM_old(1)*DIM_old(2);

sludge2_new = (reac9(m,5)+reac9(m,6))*VOL9 +(reac1(m,5)+reac1(m,6))*VOL1 + (reac2(m,5)+reac2(m,6))*VOL2 + (reac3(m,5)+reac3(m,6))*VOL3 +...
    (reac4(m,5)+reac4(m,6))*VOL4 + sum(((reac4(m,5)+reac4(m,6)).*(settlernew(m,32:41)./reac4(m,14))).*(settlervol_new/nooflayers));

waste2_new = sum(settlernew(m,5:6).*settlernew(m,16)) + sum(settlernew(m,21:22).*settlernew(m,31));
sludge_age2_new = sludge2_new/waste2_new

sludge2_old = (reac5(m,5)+reac5(m,6))*VOL5 + (reac6(m,5)+reac6(m,6))*VOL6 + (reac7(m,5)+reac7(m,6))*VOL7 +...
    (reac8(m,5)+reac8(m,6))*VOL8 + sum(((reac8(m,5)+reac8(m,6)).*(settlerold(m,32:41)./reac8(m,14))).*(settlervol_old/nooflayers));

waste2_old = sum(settlernew(m,5:6).*settlernew(m,16)) + sum(settlernew(m,21:22).*settlernew(m,31));
sludge_age2_old = sludge2_old/waste2_old

sludge_age2 = sludge_age2_new + sludge_age2_old