clear all; clc;

options = odeset('RelTol',1e-6,'AbsTol',1e-8);
x0=[0 0 0 0 0]; % Initial condition

[t,x] = ode45(@(t,x) dynamics(t,x,x0),[0 50],x0,options);