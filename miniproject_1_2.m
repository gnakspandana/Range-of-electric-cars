% The plot for power consumption as a function of speed. 
% miniproject_part2_b 
load elbilTesla.mat;         % Loading the dataset 
% Fitting a 2nd degree polynomial using least squares method 
A = (ones(size(speed_kmph)))'; 
A(:,end+1) = speed_kmph; 
A(:,end+1) = speed_kmph.^2; 
B = A'*A; 
b = A'*consumption_Whpkm'; 
z = B\b; 
poly_Tesla = flip(z'); 
 
% Curve fitting using 'polyfit' in Matlab 
poly2Tesla= polyfit(speed_kmph,consumption_Whpkm,2); 
 
% Plotting the graph 
x = linspace(0,220,400); 
y2 = polyval(polyTesla,x); 
plot(speed_kmph,consumption_Whpkm,'b*' ); 
hold on; 
plot(x,y2,'r'); 
title('Speed vs Energy Consumption - Tesla'); 
xlabel('Speed(km/h)'); 
ylabel('Energy Consumption(Wh/km)'); 
legend('data','deg2','Location','best');