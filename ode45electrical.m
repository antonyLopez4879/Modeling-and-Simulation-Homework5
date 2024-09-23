% Modeling & Simulation
% Antony Xuan - 2024 - INRO. UdG - CUCEI

% Run time
time = 0.002; % Apply the same run time in Simulink
% ODE45(function - time of simulation(s) - initial condition, input) 
[t,x] = ode45(@electricalFcn,[0 time], [0 0]);
%-----------------------------------------------------

T = 0.002; f=1/T; %2ms
offset = 2.5;
dutycicle = 50;
amplitude = 5;
Vin = (amplitude/2)*square(2*pi*f*t,dutycicle)+offset;

plot(t,Vin(:,1),'Color',"#D95319","LineWidth",2)
ylim([-4 8]), grid on, hold on
xlabel("Time");ylabel("[V]")
title("Capacitor Voltage"); xlabel("Time");ylabel("[V]")

% First state - ODE45
plot(t,x(:,1),'r',"LineWidth",1.5) 
grid on, hold on


% --------------------- Import data from Scope -----------------------%
% Scope data was saved as structure with time named 'ScopeData'
% Find the index belongs to the run time:
index = find(out.ScopeData.time == time);

% Import data from the scope. Simulink: Structre signal(2)
plot(out.ScopeData.time(1:index),out.ScopeData.signals(2).values(1:index),'Color','g','LineWidth',1.5,'LineStyle','--')
% Import data from the scope. Simscape: Structre signal(3)
plot(out.ScopeData.time(1:index),out.ScopeData.signals(3).values(1:index),'Color','c','LineWidth',1.5,'LineStyle','-.')
legend('Input','ODE45','Simulink','Simscape')