% program avvik2
%
% Sirkul�r vanntank med variabel veggtykkelse.
% m0 = dimensjonsl�st moment for x = 0
% m0a = asymptotisk dimensjonsl�st moment for x = 0
% v0 = dimensjonsl�s skj�rkraft for x = 0
% v0a = asymptotisk dimensjonsl�s skj�rkraft for x = 0
% Beregner forskjellen (i %) mellom m0 og m0a og imellom
% v0 og v0a som funksjon av beta for a = 5/7
% der a = (t0 - t1)/t0 
clear
t1 = 0.1; % veggtykkelse �verst
t0 = 0.35; % veggtykkelse nederst
a = (t0 - t1)/t0;
bpoints = 100;
beta = linspace(1.5,5,bpoints)';
rerrm0 = zeros(bpoints,1); rerrv0 = rerrm0;

for k = 1: bpoints
    b = beta(k);
    ro = (b/a)*sqrt(2);
    z0 = 2*ro;
    A = zeros(4,4); B = zeros(4,1); C = B;
   [berz0,beiz0] = berbei(z0);
   [berdz0,beidz0] = berdbeid(z0);
   [kerz0,keiz0] = kerkei(z0);
   [kerdz0,keidz0] = kerdkeid(z0);
   A(1,1) = berdz0; A(1,2) = beidz0;
   A(1,3) = kerdz0; A(1,4) = keidz0;
   A(2,1) = -(2*berdz0 + z0*beiz0);
   A(2,2) = (-2*beidz0 + z0*berz0); 
   A(2,3) = -(2*kerdz0 + z0*keiz0);
   A(2,4) = (-2*keidz0 + z0*kerz0);
   
   y1 = t1/t0; z1 = z0*sqrt(y1);
   [berz1,beiz1] = berbei(z1);
   [berdz1,beidz1] = berdbeid(z1);
   [kerz1,keiz1] = kerkei(z1);
   [kerdz1,keidz1] = kerdkeid(z1);

   A(3,1) = 4*berdz1 - 0.5*z1^2*beidz1 + 2*z1*beiz1;
   A(3,2) = 4*beidz1 + 0.5*z1^2*berdz1 - 2*z1*berz1;
   A(3,3) = 4*kerdz1 - 0.5*z1^2*keidz1 + 2*z1*keiz1;
   A(3,4) = 4*keidz1 + 0.5*z1^2*kerdz1 - 2*z1*kerz1;

   A(4,1) = 2*beidz1 - z1*berz1 ;
   A(4,2) = -(2*berdz1 + z1*beiz1);
   A(4,3) = 2*keidz1 - z1*kerz1;
   A(4,4) = -(2*kerdz1 + z1*keiz1);

   fac = (a - 1)/a;
   
   B(1) = 1;
   B(2) = -2*fac;
   B(3) = 4*fac/sqrt(y1);
   B(4) = 0;
   C = A\B;
   
   y = 1 ;
   u1 = C(1)*(4*berdz0 -0.5*z0^2*beidz0 + 2*z0*beiz0);
   u2 = C(2)*(4*beidz0 + 0.5*z0^2*berdz0 - 2*z0*berz0);
   u3 = C(3)*(4*kerdz0 -0.5*z0^2*keidz0 + 2*z0*keiz0);
   u4 = C(4)*(4*keidz0 + 0.5*z0^2*kerdz0 - 2*z0*kerz0);
   m0 = -(0.5*sqrt(y)*(u1 + u2 + u3 + u4) - 2*fac)*a^2;
   u1 = C(1)*(2*beidz0 - z0*berz0);
   u2 = -C(2)*(2*berdz0 + z0*beiz0);
   u3 = C(3)*(2*keidz0 - z0*kerz0);
   u4 = -C(4)*(2*kerdz0 + z0*keiz0);
   v0 = a^3*0.5*ro^2*sqrt(y)*(u1 + u2 + u3 + u4);
   fac2 = 4*(4*b -a);
   m0a = (32*b^2*(b-1) + a*(8*b -a))/fac2;
   v0a =- (32*b^2*(2*b^2 - b*(1 + a) + a) -a^2*(8*b - a))/fac2;
   rerrm0(k) = ((m0 - m0a)/m0)*100;
   rerrv0(k) = ((v0 - v0a)/v0)*100;
   %fprintf('%6.3f  %11.4f  %11.4f   %11.4f  %11.4f \n',b, m0, m0a, v0, v0a);
end
% s1 = '    beta       m0            m0a';
% s2 = '           v0         v0a \n \n';
% fprintf([s1,s2]);
% fprintf('%6.3f  %11.2f  %11.2f   %11.2f  %11.2f \n',b, m0, m0a, v0, v0a);
% plot(beta,m0,beta,m0a,beta,v0,beta,v0a)
FS = 'FontSize'; FW = 'FontWeight';
plot(beta,rerrm0,'k',beta,rerrv0,'k')
grid
title('% avvik i m{_0} og v{_0}.  \alpha = 5/7',FS,14)
xlabel('\beta',FS,14)
ylabel('% avvik',FS,14)
shg