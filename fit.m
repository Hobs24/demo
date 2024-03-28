
t = [0.2239 0.3790 0.5342 0.6712 0.7489 0.8408]; %time
v = [0.4466 0.5277 0.5616 0.5959 0.6676 0.7136]; %velocity

n = length(t);
sumt = 0.0;
sumv = 0.0;
sumvt = 0.0;
sumtt = 0.0;

for i = 1:n
    sumt = sumt + t(i);
    sumv = sumv + v(i);
    sumvt = sumvt + v(i)*t(i);
    sumtt = sumtt + t(i)*t(i);
end

slope = (n*sumvt - sumt*sumv)/(n*sumtt - sumt*sumt);
y_intercept = (sumtt*sumv - sumt*sumvt)/(n*sumtt - sumt*sumt);
z = slope*t + y_intercept;
plot(t,v,'o',t,z,'-')
xlabel('Time (s)')
ylabel('Velocity (m/s)')
title('Velocity vs Time')
legend('Data','Best Fit Line')
grid on

% Errors
di = y_intercept-(slope*t + y_intercept);
Error_in_slope = sqrt(sum(di.^2)*(n/(n-2))/((n*sumtt - sumt*sumt)));

Error_in_y_intercept = sqrt(sum(di.^2)*sumtt*(n/(n-2))/((n*sumtt - sumt*sumt)));

% determine the acceleration and its uncertainty
a = 2*slope;
Error_in_a = 2*Error_in_slope;
fprintf('The acceleration is %.4f m/s^2\n',a)
fprintf('The uncertainty in the acceleration is %.4f m/s^2\n',Error_in_a)



