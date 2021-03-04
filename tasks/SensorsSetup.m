%% Sensor Variables

%% IMU
Sensors.IMU.cg = [0,0,0];
Sensors.IMU.location = [0,0,0];

%% Accelerometer
Sensors.IMU.Accel.FSR = 2*g; % m/s^2
Sensors.IMU.Accel.Sens = (1/16384)*g; % (m/s^2)/LSB
Sensors.IMU.Accel.Bias = [0.02,0.02,0.03]; % m/s^2
Sensors.IMU.Accel.noiseSpectral = g*230e-6; % m/s^2/sqrt(Hz)
Sensors.IMU.Accel.tempScaleFactor = g*0.0008; % m/s^2/C
Sensors.IMU.Accel.tempSensFactor = 0.026; % %/C
Sensors.IMU.Accel.PSD = Sensors.IMU.Accel.noiseSpectral^2; % (m/s^2)^2/Hz

%% Gyroscope
Sensors.IMU.Gyro.FSR = 34.907; % rad/s
Sensors.IMU.Gyro.Sens = deg2rad(1/131); % (rad/s)/LSB
Sensors.IMU.Gyro.Bias = [0.00872665,0.015708,0.0174533]; % rad/s
Sensors.IMU.Gyro.noiseSpectral = deg2rad(0.015); % (rad/s)/sqrt(Hz)
Sensors.IMU.Gyro.PSD = Sensors.IMU.Gyro.noiseSpectral^2; % (rad/s)^2/Hz

%% Magnetometer
Sensors.IMU.Mag.FSR = 4800; % uT
Sensors.IMU.Mag.Sens = 0.6; % uT/LSB

%% Altimeter
Sensors.Altimeter.Fs = 100; % Hz
Sensors.Altimeter.noiseSpectral = 0.0004; % m/sqrt(Hz)
Sensors.Altimeter.Bias = 0.01; % m
Sensors.Altimeter.Sens = 0.0625; % m
Sensors.Altimeter.BiasInstability = 0.05; % m
Sensors.Altimeter.DecayFactor = 0.5;