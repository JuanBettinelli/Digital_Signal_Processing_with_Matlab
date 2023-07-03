%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                ELP002                           %
%                                                                 %
%Class example of the solution of a simple differential equation: %
%                                                                 %
%                              dy/dt=2t                           %
%Analysis of the influence of dt in the accuracy of the solution  %
%                                                                 %
%This script makes use of the user defined function 'my_fun'      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Clear memory and close existing figures
clear all
close all

%Define initial time, final time and time step
to=0;    %Initial time
tf=10;   %Final time

%Initial condition (value of y at t=0)
yo=0;      

%Solve the differential equation
dt1=2;
[t1,y1]=my_fun(to,tf,dt1,yo);

dt2=1;
[t2,y2]=my_fun(to,tf,dt2,yo);

dt3=.1;
[t3,y3]=my_fun(to,tf,dt3,yo);

dt4=.01;
[t4,y4]=my_fun(to,tf,dt4,yo);

%Plot results
plot(t1,y1,t2,y2,t3,y3,t4,y4)
xlabel('Time t') %Add label to x axis
ylabel('Function y') %Add label to y axis

%Compare with exact solution
hold on
t=linspace(to,tf,1000);
y_exact=t.^2;
plot(t,y_exact,'r:')

%Plot the error at time tf as a function of dt
error1=abs(y1(end)-y_exact(end));
error2=abs(y2(end)-y_exact(end));
error3=abs(y3(end)-y_exact(end));
error4=abs(y4(end)-y_exact(end));
figure  %Creates a new figure
plot([dt1 dt2 dt3 dt4],[error1 error2 error3 error4]) %Plot error as a function of dt
xlabel('Time step dt')
ylabel('Error')
