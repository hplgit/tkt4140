function sball45v1
%=================================================================
% The program computes the trajectory of a smooth ball with no lift
% The equations of motion are integrated using ODE45
% The program uses the functions fcnsball45,CDkule and events
% Dragdata from function CDkule.
%==================================================================
clear; clear global g C d nu vfx vfy;
global g C d nu vfx vfy
neq = 4; y = zeros(neq,1); 
nu  = 1.5e-5 ;  % Kinematical viscosity [m^2/s]
rof = 1.22   ;  % Density of fluid [kg/m^3]
ros = 1492.0 ;  % Density of sphere [kg/m^3]
d   = 0.04   ;  % Diameter of sphere [m]
v0  = 50.0   ;  % Initial velocity [m/s]
vfx = 0.0    ;  % x-comp. of fluid velocity
vfy = 0.0    ;  % y-comp. of fluid velocity
alf = 60.0   ;  % Angle of elevation (deg.)

fprintf('        Kinematical viscosity . nu   = %10.3e m^2/s \n',nu );
fprintf('        Density of fluid ...... rof  = %10.3e kg/m^3 \n',rof);
fprintf('        Density of sphere ..... ros  = %10.3e kg/m^3 \n',ros);
fprintf('        Diameter of sphere .... d    = %10.3e m \n',d);
fprintf('        Initial velocity....... v0   = %10.3e m/s \n',v0);
fprintf('        x-comp. of fluid vel... vfx  = %10.3e m/s \n',vfx);
fprintf('        y-comp. of fluid vel... vfy  = %10.3e m/s \n',vfy);
fprintf('        Angle of elevation..... alf  = %10.3e deg. \n',alf);

g = 9.81    ;  % Gravity [N/kg]
radf = pi/180;
ro = rof/ros;
C = 0.75*ro/d;
vx = v0*cos(alf*radf);
vy = v0*sin(alf*radf);
tint = [0 10]; % Timeinterval
y0 = [0.0 ; 0.0; vx; vy]; % Initial values
options = odeset('RelTol',1.0e-5,'Refine',8,'Events',@events);
[t,y,te,ye,ie] = ode45(@fcnsball45,tint,y0,options);
% === Plotting the trajectory ===
FS = 'FontSize'; FW = 'FontWeight';
plot(y(:,1),y(:,2));
ylim([0 Inf])
xlabel('x(m)',FS,14,FW,'Bold')
ylabel('y(m)',FS,14,FW,'Bold')
%========= fcnsball45 ===========
function dydt = fcnsball45(t,y)
% Called by ode45
% Dragdata from function CDkule
dydt = zeros(size(y));
global g C d nu vfx vfy;
vrx = y(3) - vfx;
vry = y(4) - vfy;
vr = sqrt(vrx^2 + vry^2);
Re = vr*d/nu;
CD = CDkule(Re);
f = C*vr*CD;
dydt(1) = y(3);
dydt(2) = y(4);
dydt(3) = - f*vrx;
dydt(4) = - g -f*vry;
% ================ events ========================
function [value,isterminal,direction] = events(t,y)
value = y;
isterminal = [0; 1; 0 ;0];
direction =  [0; -1; 0; 0];

