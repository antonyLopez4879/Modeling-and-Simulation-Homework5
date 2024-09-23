function dz = electricalFcn(t,z)
%-----------------------------------------------------
% Parameters:
R = 120; %Considerar resistencia interna de la fuente
L = 6e-3;
C = 0.1e-6;

T = 0.002; f=1/T; %2ms
offset = 2.5;
dutycicle = 50;
amplitude = 5;
% Function square. Amplitude and offset are related to DC injection
Vin = (amplitude/2)*square(2*pi*f*t,dutycicle)+offset;
%-----------------------------------------------------
% State Vector: dz
% dz = [z1_d;z2_d]
dz = zeros(2,1); % Size: # of states we need
%-----------------------------------------------------

%-----------------------------------------------------
%Definition of the dynamics of the system
dz(1) = z(2);
dz(2) = (1/(L*C))*(-C*R*z(2)-z(1)+Vin);
%-----------------------------------------------------