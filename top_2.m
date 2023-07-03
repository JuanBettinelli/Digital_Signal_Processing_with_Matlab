%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                ELP002                           %
%                                                                 %
%Class example of the solution of a simple differential equation: %
%                                                                 %
%                              dy/dt=2t                           %
%Analysis of the influence of dt in the accuracy of the solution  %
%This time using for loops                                        %
%                                                                 %
%This script makes use of the user defined function 'my_fun'      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Clear memory and close existing figures
clear all
close all

%Define initial time, final time and time step
to=0;    %Initial time
tf=10;   %Final time
dt=[.01 .1 .5 1 2 5]; %Time step

%Initial condition (value of y at t=0)
yo=0;      

%Solve the differential equation for different dt values
%and plot each solution
colors=['r' 'g' 'b' 'm' 'c' 'k' 'y'];
for i=1:length(dt)
    [t,y]=my_fun(to,tf,dt(i),yo);
    plot(t,y,colors(i))
    hold on
    
    %Save the error at the the last point (t=tf)
    error_at_tf(i)=abs(y(end)-t(end)^2);
end
xlabel('Time t') %Add label to x axis
ylabel('Function y') %Add label to y axis

%Compare with exact solution
hold on
t=linspace(to,tf,1000);
y_exact=t.^2;
plot(t,y_exact,'r:')

%Plot the error at time tf as a function of dt
figure  %Creates a new figure
plot(dt,error_at_tf) %Plot error as a function of dt
xlabel('Time step dt')
ylabel('Error')
