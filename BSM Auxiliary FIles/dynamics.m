function dx=dynamics(t,x,x0)
dx=zeros(13,1);

proc1 = mu_H*(xtemp[1]/(K_S+xtemp[1]))*(xtemp[7]/(K_OH+xtemp[7]))*xtemp[4];
proc2 = mu_H*(xtemp[1]/(K_S+xtemp[1]))*(K_OH/(K_OH+xtemp[7]))*(xtemp[8]/(K_NO+xtemp[8]))*ny_g*xtemp[4];
proc3 = mu_A*(xtemp[9]/(K_NH+xtemp[9]))*(xtemp[7]/(K_OA+xtemp[7]))*xtemp[5];
% /* in GPS-X they use proc3x instead of proc3 in the oxygen equation */
% /* proc3x = mu_A*(xtemp[9]/(K_NH+xtemp[9]))*(xtemp[7]/(K_OH+xtemp[7]))*xtemp[5]; */
proc4 = b_H*xtemp[4];
proc5 = b_A*xtemp[5];
proc6 = k_a*xtemp[10]*xtemp[4];
proc7 = k_h*((xtemp[3]/xtemp[4])/(K_X+(xtemp[3]/xtemp[4])))*((xtemp[7]/(K_OH+xtemp[7]))+ny_h*(K_OH/(K_OH+xtemp[7]))*(xtemp[8]/(K_NO+xtemp[8])))*xtemp[4];
proc8 = proc7*xtemp[11]/xtemp[3];


reac1 = 0.0;
reac2 = (-proc1-proc2)/Y_H+proc7;
reac3 = 0.0;
reac4 = (1.0-f_P)*(proc4+proc5)-proc7;
reac5 = proc1+proc2-proc4;
reac6 = proc3-proc5;
reac7 = f_P*(proc4+proc5);
reac8 = -((1.0-Y_H)/Y_H)*proc1-((4.57-Y_A)/Y_A)*proc3;
reac9 = -((1.0-Y_H)/(2.86*Y_H))*proc2+proc3/Y_A;
reac10 = -i_XB*(proc1+proc2)-(i_XB+(1.0/Y_A))*proc3+proc6;
reac11 = -proc6+proc8;
reac12 = (i_XB-f_P*i_XP)*(proc4+proc5)-proc8;
reac13 = -i_XB/14*proc1+((1.0-Y_H)/(14.0*2.86*Y_H)-(i_XB/14.0))*proc2-((i_XB/14.0)+1.0/(7.0*Y_A))*proc3+proc6/14;


dx(1) = 1.0/vol*(u(14)*(u(1)-x(1)))+reac1;
dx(2) = 1.0/vol*(u(14)*(u(2)-x(2)))+reac2;
dx(3) = 1.0/vol*(u(14)*(u(3)-x(3)))+reac3;
dx(4) = 1.0/vol*(u(14)*(u(4)-x(4)))+reac4;
dx(5) = 1.0/vol*(u(14)*(u(5)-x(5)))+reac5;
dx(6) = 1.0/vol*(u(14)*(u(6)-x(6)))+reac6;
dx(7) = 1.0/vol*(u(14)*(u(7)-x(7)))+reac7;
if (u(15) < 0.0)
      dx(8) = 0.0;
   else
      dx(8) = 1.0/vol*(u(14)*(u(8)-x(8)))+reac8+u(15)*(SO_sat-x(8));
end
dx(9)  = 1.0/vol*(u(14)*(u(9)-x(9)))  +reac9;
dx(10) = 1.0/vol*(u(14)*(u(10)-x(10)))+reac10;
dx(11) = 1.0/vol*(u(14)*(u(11)-x(11)))+reac11;
dx(12) = 1.0/vol*(u(14)*(u(12)-x(12)))+reac12;
dx(13) = 1.0/vol*(u(14)*(u(13)-x(13)))+reac13;