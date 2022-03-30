clear data

att_P_initial = 0.005;
att_I_initial = 0.003;
att_D_initial = 0.005;

alt_P_initial = 0.64;
alt_D_initial = 0.24;

alt_const_initial = Vehicle.Airframe.mass*9.81/4;

N = 5;

att_P = linspace(att_P_initial*0.25, att_P_initial*1.75, N);
att_I = linspace(att_I_initial*0.25, att_I_initial*1.75, N);
att_D = linspace(att_D_initial*0.25, att_D_initial*1.75, N);
alt_P = linspace(alt_P_initial*0.25, alt_P_initial*1.75, N);
alt_D = linspace(alt_D_initial*0.25, alt_D_initial*1.75, N);

configs = zeros(5^5,5);
i = 1;

for a = 1:length(att_P)
    for b = 1:length(att_I)
        for c = 1:length(att_D)
            for d = 1:length(alt_P)
                for e = 1:length(alt_D)
                    
                    configs(i,1) = att_P(a);
                    configs(i,2) = att_I(b);
                    configs(i,3) = att_D(c);
                    configs(i,4) = alt_P(d);
                    configs(i,5) = alt_D(e);
                    
                    i = i + 1;
                    
                end
            end
        end
    end
end

dt = 0.01;
t = 0:dt:10;

roll_command = [t' (pi/36)*sin(t/2)'];
pitch_command = [t' (pi/36)*cos(t/2)'];
alt_command = 0;

for i = 1:length(configs)
    
    Controller.PID_pitch_P = configs(i,1);
    Controller.PID_roll_P = configs(i,1);
    Controller.PID_pitch_roll_I = configs(i,2);
    Controller.PID_pitch_D = configs(i,3);
    Controller.PID_roll_D = configs(i,3);
    
    Controller.PID_alt_P = configs(i,4);
    Controller.PID_alt_D = configs(i,5);
    
    tic; 
    w=warning('off','all');
    data{1,i} = sim('QCS.slx'); 
    data{2,i} = configs(i,:);
    warning(w);
    toc
    
end

save('simulationRuns.mat','data')