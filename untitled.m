% Code to plot simulation results from ssc_solenoid_magnetic

% Copyright 2015 The MathWorks, Inc.

% Reuse figure if it exists, else create new figure
try
    figure(h1_ssc_solenoid_magnetic)
catch
    h1_ssc_solenoid_magnetic=figure('Name', 'ssc_solenoid_magnetic');
end

% Generate simulation results if they don't exist
if(~exist('simlog_ssc_solenoid_magnetic','var'))
    sim('ssc_solenoid_magnetic')
end

% Get simulation results
temp_solx = simlog2.Solenoid_with_Magnetic_Effects.Reluctance_Force_Actuator.x.series;
temp_solmf = simlog2.Solenoid_with_Magnetic_Effects.Reluctance_Force_Actuator.phi.series;

% Plot results
ah(1) = subplot(2,1,1);
plot(temp_solx.time,temp_solx.values*1000,'LineWidth',1);
grid on
title('Position (Magnetic Solenoid)');
ylabel('Position (mm)');
ah(2) = subplot(2,1,2);
plot(temp_solmf.time,temp_solmf.values,'LineWidth',1);
grid on
title('Magnetic Flux');
ylabel('phi (Wb)');
xlabel('Time (s)');

linkaxes(ah,'x');

% Remove temporary variables
clear temp_solx temp_solmf ah