rho = 1.184;
g = 9.81;

Vehicle.Airframe.armLength = 0.1;
Vehicle.Airframe.orthagPropDistance = Vehicle.Airframe.armLength*sqrt(2)/2;
Vehicle.Airframe.propHeight = 0;
Vehicle.Airframe.mass = 0.0663;
Vehicle.Airframe.inertia = diag([0.0000716914 0.0000716914 0.0001]);

Vehicle.Motor.Throttle2w = 3; % Found through motor test
Vehicle.Motor.maxSignal = 1000;
Vehicle.Motor.minSignal = 30;
Vehicle.Motor.w2Thrust = 1; % Yet to be determined will be tested and confirmed through rotor characteristics

Vehicle.Rotor.blades = 3;
Vehicle.Rotor.radius = 0.063;
Vehicle.Rotor.chord = 0.017;
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
Sensors.IMU.Accel.FSR = 2*g; % m/s^2
Sensors.IMU.Accel.Sens = (1/16384)*g; % (m/s^2)/LSB
Sensors.IMU.Accel.Bias = [0.02,0.02,0.03]; % m/s^2
Sensors.IMU.Accel.noiseSpectral = [g*300e-6,g*300e-6,g*300e-6]; % m/s^2/sqrt(Hz)
Sensors.IMU.Accel.tempScaleFactor = [g*0.0015,g*0.0015,g*0.0015]; % m/s^2/C
Sensors.IMU.Accel.tempSensFactor = [0.026,0.026,0.026]; % %/C

Sensors.IMU.Gyro.FSR = 34.907; % rad/s
Sensors.IMU.Gyro.Sens = 0.0174533; % (rad/s)/LSB
Sensors.IMU.Gyro.Bias = [0.00872665,0.015708,0.0174533]; % rad/s
Sensors.IMU.Gyro.noiseSpectral = [0.0001745329,0.0001745329,0.0001745329]; % (rad/s)/sqrt(Hz)

Sensors.IMU.Mag.FSR = 4800; % uT
Sensors.IMU.Mag.Sens = 0.6; % uT/LSB

Sensors.Altimeter.Fs = 100; % Hz
Sensors.Altimeter.NoiseDensity = 0.05; % m/sqrt(Hz)
Sensors.Altimeter.Bias = 0.01; % m
Sensors.Altimeter.BiasInstability = 0.05; % m
Sensors.Altimeter.DecayFactor = 0.5;
% Sensors.Altimeter.sensorModel = altimeterSensor('ReferenceFrame','NED', ...
%                                                 'SampleRate',Sensors.Altimeter.Fs, ...
%                                                 'ConstantBias',Sensors.Altimeter.Bias, ...
%                                                 'NoiseDensity',Sensors.Altimeter.NoiseDensity, ...
%                                                 'BiasInstability',Sensors.Altimeter.BiasInstability, ...
%                                                 'DecayFactor',Sensors.Altimeter.DecayFactor);


load('QCSbuses.mat');

Ts = 0.005;

% Initial conditions
init.date = [2017 1 1 0 0 0];
init.posLLA = [43.1541 -79.5432 100];
init.posNED = [0 0 0];
init.vb = [0 0 0];
init.euler = [0.000 0.000 0.000];
init.angRates = [0 0 0];

% Initialize States:
States = Simulink.Bus.createMATLABStruct('StatesBus');
States.V_body = init.vb';
States.Omega_body = init.angRates';
States.Euler = init.euler';
States.X_ned = init.posNED';
States.LLA = init.posLLA;
States.DCM_be = angle2dcm(init.euler(3),init.euler(2),init.euler(1));