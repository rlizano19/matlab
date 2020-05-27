% Authors
%   Reza Arfa <rezaarfa (at)gmail.com>
%
% License
%   The program is free to use for non-commercial and academic purposes.
%
% Changes
%   01/01/2013
%   21/01/2013

%Modificado por Ricardo Lizano Godínez
%Enero 2016

clc; close all; clear all;

%Inicializar variables:
fs = 200;
t = linspace(-2,2,fs);

convol = zeros(1,length(t));

set(gcf,'Color',[1 1 1]);
ax = [-2 2 -0.2 1.1];    

%Se construye la primera función x(t)
x      = 0*t;
ind    = t>=-1 & t<=0;
x(ind) = 1;
ind    = t>=0 & t<1;
x(ind) = 1-t(ind);

%Se construye la segunda función h(t)
h = tripuls(t-0.5,1,-1);

subplot(4,2,1);plot(t,x,'Color','blue','LineWidth',2),axis(ax); 
grid on;
xlabel('t')
ylabel('x(t)')

subplot(4,2,2);plot(t,h,'Color','red','LineWidth',2),axis(ax); 
grid on;
xlabel('t')
ylabel('h(t)')

iter = length(t);
for i = 1:iter 
    moveStep = (4*i-fs)/fs;
    
    h_shifted = tripuls(-(t-moveStep)-1.5,1,-1);
    %Convolución
    convol(i) = trapz(t, x.*h_shifted);
    
    subplot(4,2,3:4)
    hold off;
    plot(t,x,'Color','blue','LineWidth',2),axis(ax);
    hold on; 
    plot(t,h_shifted,'Color','red' ,'LineWidth',2),axis(ax);
    grid on;
    xlabel('t');
   
    subplot(4,2,5:8)
    hold off
    plot(t(1:i),convol(1:i),'Color','black','LineWidth',2);
    axis([-2 2 0 0.51]);
    grid on;
    xlabel('t')
    ylabel('Convolución(x, h)(t) ')
    
    pause(0.05)
end

