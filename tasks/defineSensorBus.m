function defineSensorBus() 

% Bus object: accel_data_SI
clear elems;
elems(1) = Simulink.BusElement;
elems(1).Name = 'ddx';
elems(1).Dimensions = 1;
elems(1).DimensionsMode = 'Fixed';
elems(1).DataType = 'double';
elems(1).SampleTime = -1;
elems(1).Complexity = 'real';
elems(1).SamplingMode = 'Sample based';
elems(1).Min = [];
elems(1).Max = [];
elems(1).DocUnits = sprintf('m/s^2');
elems(1).Description = '';

elems(2) = Simulink.BusElement;
elems(2).Name = 'ddy';
elems(2).Dimensions = 1;
elems(2).DimensionsMode = 'Fixed';
elems(2).DataType = 'double';
elems(2).SampleTime = -1;
elems(2).Complexity = 'real';
elems(2).SamplingMode = 'Sample based';
elems(2).Min = [];
elems(2).Max = [];
elems(2).DocUnits = 'm/s^2';
elems(2).Description = '';

elems(3) = Simulink.BusElement;
elems(3).Name = 'ddz';
elems(3).Dimensions = 1;
elems(3).DimensionsMode = 'Fixed';
elems(3).DataType = 'double';
elems(3).SampleTime = -1;
elems(3).Complexity = 'real';
elems(3).SamplingMode = 'Sample based';
elems(3).Min = [];
elems(3).Max = [];
elems(3).DocUnits = 'm/s^2';
elems(3).Description = '';

gyro_data_SI = Simulink.Bus;
gyro_data_SI.HeaderFile = '';
gyro_data_SI.Description = '';
gyro_data_SI.DataScope = 'Auto';
gyro_data_SI.Alignment = -1;
gyro_data_SI.Elements = elems;
assignin('base','accel_data_SI', gyro_data_SI)

% Bus object: gyro_data_SI
clear elems;
elems(1) = Simulink.BusElement;
elems(1).Name = 'p';
elems(1).Dimensions = 1;
elems(1).DimensionsMode = 'Fixed';
elems(1).DataType = 'double';
elems(1).SampleTime = -1;
elems(1).Complexity = 'real';
elems(1).SamplingMode = 'Sample based';
elems(1).Min = [];
elems(1).Max = [];
elems(1).DocUnits = sprintf('rad/s');
elems(1).Description = '';

elems(2) = Simulink.BusElement;
elems(2).Name = 'q';
elems(2).Dimensions = 1;
elems(2).DimensionsMode = 'Fixed';
elems(2).DataType = 'double';
elems(2).SampleTime = -1;
elems(2).Complexity = 'real';
elems(2).SamplingMode = 'Sample based';
elems(2).Min = [];
elems(2).Max = [];
elems(2).DocUnits = 'rad/s';
elems(2).Description = '';

elems(3) = Simulink.BusElement;
elems(3).Name = 'r';
elems(3).Dimensions = 1;
elems(3).DimensionsMode = 'Fixed';
elems(3).DataType = 'double';
elems(3).SampleTime = -1;
elems(3).Complexity = 'real';
elems(3).SamplingMode = 'Sample based';
elems(3).Min = [];
elems(3).Max = [];
elems(3).DocUnits = 'rad/s';
elems(3).Description = '';

gyro_data_SI = Simulink.Bus;
gyro_data_SI.HeaderFile = '';
gyro_data_SI.Description = '';
gyro_data_SI.DataScope = 'Auto';
gyro_data_SI.Alignment = -1;
gyro_data_SI.Elements = elems;
assignin('base','gyro_data_SI', gyro_data_SI)

% Bus object: SensorBus
clear elems;
elems(1) = Simulink.BusElement;
elems(1).Name = 'accel_data_SI';
elems(1).Dimensions = 1;
elems(1).DimensionsMode = 'Fixed';
elems(1).DataType = 'Bus: accel_data_SI';
elems(1).SampleTime = -1;
elems(1).Complexity = 'real';
elems(1).SamplingMode = 'Sample based';
elems(1).Min = [];
elems(1).Max = [];
elems(1).DocUnits = '';
elems(1).Description = '';

elems(2) = Simulink.BusElement;
elems(2).Name = 'gyro_data_SI';
elems(2).Dimensions = 1;
elems(2).DimensionsMode = 'Fixed';
elems(2).DataType = 'Bus: gyro_data_SI';
elems(2).SampleTime = -1;
elems(2).Complexity = 'real';
elems(2).SamplingMode = 'Sample based';
elems(2).Min = [];
elems(2).Max = [];
elems(2).DocUnits = '';
elems(2).Description = '';

elems(3) = Simulink.BusElement;
elems(3).Name = 'quat_data';
elems(3).Dimensions = [4 1];
elems(3).DimensionsMode = 'Fixed';
elems(3).DataType = 'double';
elems(3).SampleTime = -1;
elems(3).Complexity = 'real';
elems(3).SamplingMode = 'Sample based';
elems(3).Min = [];
elems(3).Max = [];
elems(3).DocUnits = '';
elems(3).Description = '';

elems(4) = Simulink.BusElement;
elems(4).Name = 'alt_data_SI';
elems(4).Dimensions = 1;
elems(4).DimensionsMode = 'Fixed';
elems(4).DataType = 'double';
elems(4).SampleTime = -1;
elems(4).Complexity = 'real';
elems(4).SamplingMode = 'Sample based';
elems(4).Min = [];
elems(4).Max = [];
elems(4).DocUnits = 'm';
elems(4).Description = '';

elems(5) = Simulink.BusElement;
elems(5).Name = 'pressure_data_SI';
elems(5).Dimensions = 1;
elems(5).DimensionsMode = 'Fixed';
elems(5).DataType = 'double';
elems(5).SampleTime = -1;
elems(5).Complexity = 'real';
elems(5).SamplingMode = 'Sample based';
elems(5).Min = [];
elems(5).Max = [];
elems(5).DocUnits = 'Pa';
elems(5).Description = '';

SensorBus = Simulink.Bus;
SensorBus.HeaderFile = '';
SensorBus.Description = '';
SensorBus.DataScope = 'Auto';
SensorBus.Alignment = -1;
SensorBus.Elements = elems;
assignin('base','SensorBus', SensorBus)
