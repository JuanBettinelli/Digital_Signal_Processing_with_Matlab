%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                ELP002                           %
%                                                                 %
%Class example of the solution of a simple differential equation: %
%                                                                 %
%                              dy/dt=2t                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Clear memory and close existing figures
clear all
close all

%Define initial time, final time and time step
to=0;    %Initial time
tf=10;   %Final time
dt=1e-3; %Time step

%Create time array
t=to:dt:tf;

%Initial condition (value of y at t=0)
y(1)=0;      

%Calculate y(t) using a finite difference formulation
for i=2:length(t)
    y(i)=y(i-1)+2*t(i)*dt;
end

%Plot result
plot(t,y)
xlabel('Time t') %Add label to x axis
ylabel('Function y') %Add label to y axis

%Compare with exact solution
hold on
y_exact=t.^2;
plot(t,y_exact,'r:')

%Plot the error as a function of time
error=(y-y_exact);
figure  %Creates a new figure
semilogy(t,error) %Plot error using a logarithmic scale in the y axis
xlabel('Time t')
ylabel('Error')
