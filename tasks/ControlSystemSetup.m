%% Control System Variables

%% Controller

Controller.T2Throttle = [-71209 12848 67.783];
Controller.F2T = [0.0005 0.0078 0.0025];

Controller.Alt.Kp = 4;
Controller.Alt.Kd = 4;

Controller.Yaw.Kp = 0.01;
Controller.Yaw.Kd = 0.0015;

Controller.PitchRoll.Kp = 0.005;
Controller.PitchRoll.Kd = 0.003;
Controller.PitchRoll.Ki = 0.005;

Controller.XY2Att.Kp = 0.24;
Controller.XY2Att.Kd = 0.1;


%% Estimator

%Altitude

%KF
Estimator.alt.kf.G = [0;1];
Estimator.alt.kf.H = 0;
Estimator.alt.kf.Q = 0.0005;
Estimator.alt.kf.R = [0.1];
Estimator.alt.kf.N = 0;