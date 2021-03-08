%% Project Startup

clear;
clc;

%% Set Variants
VSS_ENV = 0;
VSS_constEnv = Simulink.Variant('VSS_ENV == 0');
VSS_varEnv = Simulink.Variant('VSS_ENV == 1');

VSS_SENS = 0;
VSS_feedSens = Simulink.Variant('VSS_SENS == 0');
VSS_noiseSens = Simulink.Variant('VSS_SENS == 1');

%% Global Variables

rho = 1.184;
g = 9.81;
Ts = 0.01;

%% Setup Tasks

VehicleSetup;

SensorsSetup;

ControlSystemSetup;

load('QCSbuses.mat');

%% Initial Conditions

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