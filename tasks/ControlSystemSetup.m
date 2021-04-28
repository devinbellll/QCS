%% Control System Variables

%% Controller

Controller.F2Throttle = [-4.85680e0 1.14920e2 9.00427e1];
Controller.T2Throttle = [-7.12089e4 1.28483e4 6.77826e1];
Controller.F2T = [4.55179e-4 7.76575e-3 2.49177e-3];
Controller.Throttle2T = [1.33223e-7 2.64397e-5 -4.46355e-4];
Controller.Throttle2F = [7.795453e-6 6.03210e-3 -5.48379e-1];

% 
% Controller.Alt.Kp = 475.622188176767;
% Controller.Alt.Ki = 234.461659085703;
% 
% Controller.Yaw.Kp = 10;
% Controller.Yaw.Kd = 14;
% 
% Controller.Pitch.Kp = 0.0521662212265084;
% Controller.Pitch.Ki = 0.00100771901961456;
% Controller.Pitch.Kd = 0.599954511810091;
% Controller.Pitch.N = 194.459278359077;
% 
% Controller.Roll.Kp = 0.0521662212265084;
% Controller.Roll.Ki = 0.00100771901961456;
% Controller.Roll.Kd = 0.599954511810091;
% Controller.Roll.N = 194.459278359077;

Controller.PID_pitch_P = 0.005;
Controller.PID_pitch_D = 0.005;

Controller.PID_roll_P = 0.005;
Controller.PID_roll_D = 0.005;

Controller.PID_pitch_roll_I = 0.003;

Controller.PID_yaw_P = 0.1;
Controller.PID_yaw_D = 0.14;

Controller.PID_alt_P = 0.08*8;
Controller.PID_alt_D = 0.03*8;

% Controller.PitchRoll.Kp = 0.005;
% Controller.PitchRoll.Ki = 0.003;
% Controller.PitchRoll.Kd = 0.005;
% 
% Controller.XY2Att.Kp = 0.24;
% Controller.XY2Att.Kd = 0.1;
% 

%% Estimator


%IMU
Estimator.IMU.filterAccel = designfilt('lowpassfir', 'FilterOrder', 5, 'CutoffFrequency', 0.1);
Estimator.IMU.filterGyro = designfilt('lowpassfir', 'FilterOrder', 5, 'CutoffFrequency', 0.8);
[Estimator.IMU.filterGyroNum,Estimator.IMU.filterGyroDen] = cheby2(5,40,0.8);

%Altitude
[Estimator.alt.filterPrsNum,Estimator.alt.filterPrsDen] = butter(3,0.01);

Estimator.alt.compFilter = 0.01;
Estimator.alt.compFilterV = 0.001;
%KF
Estimator.alt.kf.G = [0;1];
Estimator.alt.kf.H = 0;
Estimator.alt.kf.Q = 0.0005;
Estimator.alt.kf.R = [0.1];
Estimator.alt.kf.N = 0;