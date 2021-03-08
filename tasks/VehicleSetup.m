
Vehicle.Airframe.armLength = 0.11;
Vehicle.Airframe.orthagPropDistance = Vehicle.Airframe.armLength*sqrt(2)/2;
Vehicle.Airframe.propHeight = 0;
Vehicle.Airframe.mass = 0.513;
% Vehicle.Airframe.inertia = diag([0.0000716914 0.0000716914 0.0001]);
Vehicle.Airframe.inertia = diag([0.0005547 0.0005547 0.0007738]);

% Vehicle.Airframe.Cdx = 20;
Vehicle.Airframe.Cdx = 0;
Vehicle.Airframe.Cdy = 0;
Vehicle.Airframe.diameter = .01; % For drag calculation purposes

Vehicle.Motor.Throttle2w = 3; % Found through motor test
Vehicle.Motor.maxSignal = 1000;
Vehicle.Motor.minSignal = 100;
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
Vehicle.Rotor.Ct = 0.04;
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
