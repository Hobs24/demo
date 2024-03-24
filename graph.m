%Experiment 1 motion along an inclined plane
d = []; % Distance (m)
t = [0.22 0.38 0.53 0.67 0.75 0.84]; % Time (s)

% Plotting distance versus time
figure;
scatter(t, d, 'filled');
hold on;
p1 = polyfit(t, d, 1); % Line of best fit
y1 = polyval(p1, t);
plot(t, y1, 'r');
xlabel('Time (s)');
ylabel('Distance (m)');
title('Distance versus Time');
legend('Data', 'Line of Best Fit');

% Plotting velocity versus time
v = diff(d) ./ diff(t); % Calculating velocity
t_avg = (t(1:end-1) + t(2:end)) / 2; % Average time
figure;
scatter(t_avg, v, 'filled');
hold on;
p2 = polyfit(t_avg, v, 1); % Line of best fit
y2 = polyval(p2, t_avg);
plot(t_avg, y2, 'r');
xlabel('Time (s)');
ylabel('Velocity (m/s)');
title('Velocity versus Time');
legend('Data', 'Line of Best Fit');

% Display equations of the graphs
disp(['Equation of distance versus time: y = ' num2str(p1(1)) 'x + ' num2str(p1(2))]);
disp(['Equation of velocity versus time: y = ' num2str(p2(1)) 'x + ' num2str(p2(2))]);

% Calculate acceleration and its uncertainty
a = p2(1); % Acceleration
delta_a = std(v) / sqrt(length(v)); % Uncertainty in acceleration
disp(['Acceleration: ' num2str(a) ' m/s^2']);
disp(['Uncertainty in acceleration: ' num2str(delta_a) ' m/s^2']);