% program t2analyt
% Beregner analytisk l�sning av en sirkul�r 
% vanntank der veggtykkelsen varierer line�rt
clear
R = 8.5; % Tankradius
H = 7.95; % H�yde
t1 = 0.1; % veggtykkelse �verst
t0 = 0.35; % veggtykkelse nederst
ny = 0.20;  % Poissons tall
a = (t0 - t1)/t0;
b = (3*(1 - ny^2)*H^4/(R*t0)^2)^0.25;
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
dx = 0.1; kmax = round(1/dx);
w = zeros(kmax,1);
dw = w; m = w; v = w; x = w; 
% === Beregner w(x), w'(x), m(x) og v(x) ===
for k = 1:kmax + 1
    x(k) = (k - 1)*dx;
    y = 1 - a*x(k);
    z = 2*ro*sqrt(y); 
    [berz,beiz] = berbei(z);
    [berdz,beidz] = berdbeid(z); 
    [kerz,keiz] = kerkei(z);
    [kerdz,keidz] = kerdkeid(z);
    wp = -(a + y - 1)/(a*y);
    w(k) = (C(1)*berdz + C(2)*beidz + C(3)*kerdz + C(4)*keidz)/sqrt(y)+ wp;
    u1 = -C(1)*(2*berdz + z*beiz); u2 = C(2)*(-2*beidz + z*berz);
    u3 = -C(3)*(2*kerdz + z*keiz); u4 = C(4)*(-2*keidz + z*kerz);
    dw(k) = -a*(0.5*(u1 + u2 + u3 + u4)/y^1.5 + fac/y^2);
    u1 = C(1)*(4*berdz -0.5*z^2*beidz + 2*z*beiz);
    u2 = C(2)*(4*beidz + 0.5*z^2*berdz - 2*z*berz);
    u3 = C(3)*(4*kerdz -0.5*z^2*keidz + 2*z*keiz);
    u4 = C(4)*(4*keidz + 0.5*z^2*kerdz - 2*z*kerz);
    m(k) = -(0.5*sqrt(y)*(u1 + u2 + u3 + u4) - 2*fac)*a^2;
    u1 = C(1)*(2*beidz - z*berz);
    u2 = -C(2)*(2*berdz + z*beiz);
    u3 = C(3)*(2*keidz - z*kerz);
    u4 = -C(4)*(2*kerdz + z*keiz);
    v(k) = a^3*0.5*ro^2*sqrt(y)*(u1 + u2 + u3 + u4);
end
s1 = '    x         w             w''';
s2 = '                m            v \n \n';
fprintf([s1,s2]);
fprintf('%6.3f  %13.5e  %13.5e   %13.5e  %13.5e \n',[x w dw m v]');