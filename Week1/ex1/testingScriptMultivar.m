%Test script that plots the hypothesis functions generated

%Load theta previously computed by grad descent/normal eq. algorithms 
load('thetaResultNormal.txt');
thetaNormal=theta;
load('thetaResultGradient.txt');
thetaGradient=theta;
trainingData = load('ex1data2.txt');
  

%Plot training data
tX1=trainingData(:,1);
tX2=trainingData(:,2);
tY=trainingData(:,3);

t=scatter3(tX1,tX2,tY,20,[1 0 0]);
hold on;
xlabel('Area (sq. feet)');
ylabel('Number of bedrooms');

%Prepare mesh grid for plotting
gX1 = linspace(0,6000,100);
gX2 = linspace(0,20,20);
[gXX1,gXX2]=meshgrid(gX1,gX2);

%Plot hypothesis obtained from gradient descent

s1=mesh(gXX1,gXX2,thetaGradient(1)+thetaGradient(2).*((gXX1-mu(1,1))/sigma(1,1))+thetaGradient(3).*((gXX2-mu(1,2))/sigma(1,2)));
s2=mesh(gXX1,gXX2,thetaNormal(1)+thetaNormal(2).*gXX1+thetaNormal(3).*gXX2);


set(s1,'FaceAlpha',0.5,'EdgeColor',[0 1 0]);
set(s2,'FaceAlpha',0.5,'EdgeColor',[0 0 1]);

legend('training data','gradient descent','normal equation');
