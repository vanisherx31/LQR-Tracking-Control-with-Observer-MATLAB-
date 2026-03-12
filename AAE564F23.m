clc

clear all

clf

syms k t

a = [0,0,1,0;0,0,0,1;-0.3208,0,0.0858,0;0,0,0,-0.0806];
b = [0,0;0,0;0.0232,0.0099;-0.0224,0.0429];
c = [1,0,0,0;0,1,0,0];

A = [a, zeros(size(a,1), 2);c, zeros(size(c,1), 2)]

B = [b;zeros(2,size(b,2))]

C = [1,0,0,0,0,0;0,1,0,0,0,0;0,0,0,0,1,0;0,0,0,0,0,1]

Q = diag([300, 300,30,30, 2000,2000])

R = diag([1/100;1/100])

K = lqr(A,B,Q,R)

A_cl = A-B*K

F = lqr(A',C',eye(6),eye(4)/30)

L = F'

abig=[A,-B*K;L*C,A-B*K-L*C];

t=linspace(0,120,2^17);

r1=2*square(t/6);

r2=2*sin(t/6);

r = [r1' r2'];   

W = [zeros(4,2);[-1,0];[0,-1]]

Bbig = [W; W];

Cbig = [eye(2) zeros(2,10)];

Dbig = zeros(2,2);

z0 = zeros(12,1);
z0(1) = pi;   % theta(0)
z0(2) = pi;   % psi(0)

y = lsim(abig,Bbig,Cbig,Dbig,r,t, z0);grid


subplot(2,1,1)
plot(t, y(:,1));grid
hold on
plot(t, r1);
xlabel('\theta(t)');
ylabel('t)');
title(' \theta vs t');
legend(' \theta(t)',' r_1(t)','Location','best')

xlim([0 120])
ylim([-4.41 4.41])


subplot(2,1,2)
plot(t, y(:,2));grid
hold on
plot(t, r2);
title(' \psi vs t');
legend(' \theta(t)',' r_2(t)','Location','best')

xlim([0 120])
ylim([-4.41 4.41])

