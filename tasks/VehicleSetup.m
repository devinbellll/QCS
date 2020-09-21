clear;

rho = 1.184;
g = 9.81;

Vehicle.Airframe.armLength = 10;
Vehicle.Airframe.orthagPropDistance = Vehicle.Airframe.armLength*sqrt(2)/2;
Vehicle.Airframe.propHeight = 0;
Vehicle.Airframe.mass = 0.063;
Vehicle.Airframe.inertia = diag([0.0000582857 0.0000716914 0.0001]);

Vehicle.Motor.Throttle2w = 3; % Found through motor test
Vehicle.Motor.maxSignal = 1000;
Vehicle.Motor.minSignal = 30;
Vehicle.Motor.w2Thrust = 1; % Yet to be determined will be tested and confirmed through rotor characteristics


Vehicle.Rotor.blades = 2;
Vehicle.Rotor.radius = 0.033;
Vehicle.Rotor.chord = .008;
Vehicle.Rotor.flappingOffset = 0;
Vehicle.Rotor.bladeMass = 3.75e-04;
Vehicle.Rotor.bladeInertia = Vehicle.Rotor.bladeMass*Vehicle.Rotor.radius^2/4;
Vehicle.Rotor.hubMass = 0;
Vehicle.Rotor.hubInertia = 0;
Vehicle.Rotor.inertia = Vehicle.Rotor.hubInertia + Vehicle.Rotor.bladeInertia;
Vehicle.Rotor.Ct = .0107;
Vehicle.Rotor.Cq = Vehicle.Rotor.Ct*sqrt(Vehicle.Rotor.Ct/2);
Vehicle.Rotor.solidity = Vehicle.Rotor.chord*Vehicle.Rotor.blades/(pi*Vehicle.Rotor.radius);
Vehicle.Rotor.theta0 = 14.6*(pi/180);
Vehicle.Rotor.thetaTip = 6.8*(pi/180);
Vehicle.Rotor.theta1 = Vehicle.Rotor.thetaTip-Vehicle.Rotor.theta0;
Vehicle.Rotor.theta34 = Vehicle.Rotor.theta0+0.75*Vehicle.Rotor.theta1;
Vehicle.Rotor.a = 5.5; % Lift slope
Vehicle.Rotor.area = pi*Vehicle.Rotor.radius^2;
Vehicle.Rotor.lock = rho*Vehicle.Rotor.a*Vehicle.Rotor.chord*Vehicle.Rotor.radius^4/...
    (Vehicle.Rotor.hubInertia+Vehicle.Rotor.bladeInertia);
Vehicle.Rotor.b = Vehicle.Rotor.Ct*rho*Vehicle.Rotor.area*Vehicle.Rotor.radius^2;
Vehicle.Rotor.k = Vehicle.Rotor.Cq*rho*Vehicle.Rotor.area*Vehicle.Rotor.radius^3;
Vehicle.Rotor.w2ToThrustGain = Vehicle.Rotor.Ct*rho*Vehicle.Rotor.area*Vehicle.Rotor.radius^2;

Sensors.IMU.cg = [0,0,0];
Sensors.IMU.location = [0,0,0];

Sensors.Altimeter = altimeterSensor('ReferenceFrame','NED');

% defineStatesBus;
% defineEnvironmentBus;
% defineSensorBus;

load('QCSbuses.mat');

Ts = 0.005;

% Initial conditions
init.date = [2017 1 1 0 0 0];
init.posLLA = [43.1541 -79.5432 100];
init.posNED = [57 95 -0.046];
init.vb = [0 0 0];
init.euler = [0 0 0];
init.angRates = [0 0 0];

% Initialize States:
States = Simulink.Bus.createMATLABStruct('StatesBus');
States.V_body = init.vb';
States.Omega_body = init.angRates';
States.Euler = init.euler';
States.X_ned = init.posNED';
States.LLA = init.posLLA;
States.DCM_be = angle2dcm(init.euler(3),init.euler(2),init.euler(1));
