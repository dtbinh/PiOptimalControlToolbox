%% Exercise 1: directSingleShooting

clear all;
clc;

% functions

lagrange = @(x,u,t)(u'*u);
mayer = @(x,tf)(0);
f = @(x,u,t)([0 1 ; -1 0]*x+[0;1]*u);

% constraints
uMax = 2.0;
eqPathCon = @(x,u)(0);
inPathCon = @(x,u)(u*[1;-1]-uMax*[1;1]);
eqTerCon = @(xN,tf)(xN-[0;0]);
inTerCon = @(xN,tf)(0);

x0 = [10;0];
tf = 10;
N = 40;
m = 1; % number of control input signal

method = 'rk4';
[X,U,t] = directMultipleShooting(lagrange,mayer,f,eqPathCon,inPathCon,eqTerCon,inTerCon,x0,tf,N,m,method);
