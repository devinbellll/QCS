%% Control System Variables

%% Controller

Controller.F2Throttle = [-4.85680e0 1.14920e2 9.00427e1];
Controller.T2Throttle = [-7.12089e4 1.28483e4 6.77826e1];
Controller.F2T = [4.55179e-4 7.76575e-3 2.49177e-3];
Controller.Throttle2T = [1.33223e-7 2.64397e-5 -4.46355e-4];
Controller.Throttle2F = [7.795453e-6 6.03210e-3 -5.48379e-1];


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