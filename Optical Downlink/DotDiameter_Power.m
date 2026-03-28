 clear
close all

% Plot altitude vs dot diameter
altitudes = 0:0.1:600;
dotDiameters =  2 * tand(7/2) * altitudes;

plot(altitudes(1,:), dotDiameters(1,:))
title("Altitude Vs Dot Diameter")
xlabel("Altitude (km)")
ylabel("Dot Diameter (km)")

% Plot each output power curve
figure
hold on

inputPower = 10:10:100; % Input powers

for power = inputPower
    outputPower = (power * 0.6 * 0.2 ^ 2) ./ (dotDiameters*1000.^2);
    
    plot(altitudes(1,:), outputPower(1,:))
end

title("Altitudes Vs Output Power for Different Input Power")
ylim([0 2*10^-7])
ylabel("Output Power (W)")
xlabel("Altitudes (km)")

leg = legend(string(inputPower) + " W");
title(leg, "Input power")

% Plot each power fraction graph
figure
hold on

powerFraction = (0.6 * 0.2 ^ 2) ./ (dotDiameters*1000.^2);

plot(altitudes(1,:), powerFraction(1,:))
title("Altitudes Vs P_r_x / P_t_x")
ylim([0 0.5*10^-8])
ylabel("P_r_x / P_t_x")
xlabel("Altitudes (km)")