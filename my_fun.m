function [t,y]=my_fun(to,tf,dt,yo)
%[t,y]=my_fun(to,tf,dt)
%This function calculates numerically the solution of the following
%differential equation: dy/dt=2t
%to:initial time
%tf:final time
%dt:time step
%yo:initial value
%t:time vector t
%y:vector containing the solution of dy/dt=2t

%Create time array
t=to:dt:tf;

%Initial condition (value of y at t=0)
y(1)=yo;      

y(2)=y(1)+2*t(1)*dt;
%Calculate y(t) using a finite difference formulation
for i=3:length(t)
    y(i)=y(i-1)+t(i-1)*2*dt;
end
