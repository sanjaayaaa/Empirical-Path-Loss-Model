% This program will plot the relationship Between Received Power with respect to Distance 
clc;
clear ;

% Transmitting  Antenna Height 
Hte=30:1:100;  
% Input of Parameters 
Hre=input('Enter the receiver antenna height 3m<hre<10m : ');
f=input('Enter the frequency 150Mhz<f<1920Mhz : ');
Pt=input('Enter the Transmitter power watts :  ');
Pt1=10*log10 (Pt);
fprintf('The Transmitted power in db is :%i\n',Pt1)

% Basic Calculation
x1=((4*pi)^2);
%lamda Calculation
c=3*10^8;
lamda=(c)/(f*10^6);  
lamda1=lamda*lamda;

% Median Attenuation Assumtion Amu (f,d) in dB
Amu = 35;    
%Gain Due to Type of Terrain in dB
Garea = 9;    
%Base Antenna Height Gain Factor in dB
Ghte = 20*log(Hte/200);
% Mobile a Antenna Height Gain Factor in dB
if(Hre>3)
Ghre = 20*log(Hre/3);    
else
Ghre = 10*log(Hre/3);
end
% Continue .......
% Free Space Loss
d=1:1:71;
d1=d.*d;

Lf = 10*log ((d1.*x1)/(lamda1));
% 50 th  Percentile (Median Value of Propogation Path Loss 
for n=1:1:d 
     L50 = Lf+Amu-Ghte-Ghre-Garea;
     Pr=(Pt1-L50);
%      Pr1=(Pr./10);
%      Pr2=10.^Pr1;
    
end
% Plotting of Graphes 
fprintf('\n######################################################################################');
fprintf('\nCaclulating Received Power Vs Distance Graph for Receiver antena Height of:%i m\n',Hre);
fprintf('Frequency:%i Mhz ,Transmitter Power:%i Watt (%i dB )\n',f,Pt,Pt1);
fprintf('#########################################################################################\n');
plot(d,Pr,'LineWidth',1.5);
title('Okumura Model Analysis');
xlabel('Distance between Transmitter and Receiver');
ylabel('Received Power in dB1');
grid on;




