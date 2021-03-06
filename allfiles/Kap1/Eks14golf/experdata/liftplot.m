%liftplot
x = [13.7 21.6 29.9 38.4 46.9 55.2 63.1 71.9 80.2 88.1];
y = (20:2:60);
cl(1,1) = 0.100; cl(1,2) = 0.185; cl(1,3) = 0.245; cl(1,4)  = 0.200; cl(1,5)   = 0.173;
cl(1,6) = 0.153; cl(1,7) = 0.142; cl(1,8) = 0.136; cl(1,9)  = 0.128; cl(1,10)  = 0.128;
cl(2,1) = 0.200; cl(2,2) = 0.230; cl(2,3) = 0.261; cl(2,4)  = 0.208; cl(2,5)   = 0.179;
cl(2,6) = 0.161; cl(2,7) = 0.148; cl(2,8) = 0.1405; cl(2,9) = 0.132; cl(2,10)  = 0.132;
cl(3,1) = 0.261; cl(3,2) = 0.271; cl(3,3) = 0.271; cl(3,4)  = 0.218; cl(3,5)   = 0.190;
cl(3,6) = 0.167; cl(3,7) = 0.154; cl(3,8) = 0.145; cl(3,9)  = 0.1362; cl(3,10) = 0.1362;
cl(4,1) = 0.308; cl(4,2) = 0.300; cl(4,3) = 0.284; cl(4,4)  = 0.229; cl(4,5)  =  0.197;
cl(4,6) = 0.173; cl(4,7) = 0.161; cl(4,8) = 0.1495; cl(4,9) = 0.1403; cl(4,10) = 0.1403;
cl(5,1) = 0.342; cl(5,2) = 0.319; cl(5,3) = 0.293; cl(5,4)  = 0.237; cl(5,5)   = 0.203;
cl(5,6) = 0.179; cl(5,7) = 0.165; cl(5,8) = 0.1539; cl(5,9) = 0.1444; cl(5,10) = 0.1444;
cl(6,1) = 0.359; cl(6,2) = 0.335; cl(6,3) = 0.304; cl(6,4)  = 0.246; cl(6,5)   = 0.208;
cl(6,6) = 0.184; cl(6,7) = 0.167; cl(6,8) = 0.1584; cl(6,9) = 0.1485; cl(6,10) = 0.1468;
cl(7,1) = 0.372; cl(7,2) = 0.348; cl(7,3) = 0.316; cl(7,4)  = 0.258; cl(7,5)   = 0.2141;
cl(7,6) = 0.192; cl(7,7) = 0.174; cl(7,8) = 0.1628; cl(7,9) = 0.1526; cl(7,10) = 0.1486;
cl(8,1) = 0.383; cl(8,2) = 0.354; cl(8,3) = 0.322; cl(8,4)  = 0.266; cl(8,5)   = 0.2203;
cl(8,6) = 0.200; cl(8,7) = 0.181; cl(8,8) = 0.1673; cl(8,9) = 0.1567; cl(8,10) = 0.1504;
cl(9,1) = 0.387; cl(9,2) = 0.359; cl(9,3) = 0.327; cl(9,4)  = 0.274; cl(9,5)   = 0.2264;
cl(9,6) = 0.204; cl(9,7) = 0.185; cl(9,8) = 0.1718; cl(9,9) = 0.1608; cl(9,10) = 0.1522;
cl(10,1) = 0.394; cl(10,2) = 0.361; cl(10,3) = 0.333; cl(10,4)  = 0.280; cl(10,5)   = 0.2325;
cl(10,6) = 0.210; cl(10,7) = 0.192; cl(10,8) = 0.1763; cl(10,9) = 0.1649; cl(10,10) = 0.154;
cl(11,1) = 0.400; cl(11,2) = 0.364; cl(11,3) = 0.335; cl(11,4)  = 0.286; cl(11,5)   = 0.2387;
cl(11,6) = 0.215; cl(11,7) = 0.197; cl(11,8) = 0.1807; cl(11,9) = 0.169; cl(11,10)  = 0.1582;
cl(12,1) = 0.401; cl(12,2) = 0.370; cl(12,3) = 0.337; cl(12,4)  = 0.291; cl(12,5)   = 0.2448;
cl(12,6) = 0.221; cl(12,7) = 0.203; cl(12,8) = 0.1852; cl(12,9) = 0.1731; cl(12,10) = 0.1624;
cl(13,1) = 0.402; cl(13,2) = 0.374; cl(13,3) = 0.340; cl(13,4)  = 0.296; cl(13,5)   = 0.2509;
cl(13,6) = 0.224; cl(13,7) = 0.210; cl(13,8) = 0.1897; cl(13,9) = 0.1772; cl(13,10) = 0.1666;
cl(14,1) = 0.405; cl(14,2) = 0.379; cl(14,3) = 0.345; cl(14,4)  = 0.303; cl(14,5)   = 0.2571;
cl(14,6) = 0.230; cl(14,7) = 0.216; cl(14,8) = 0.1941; cl(14,9) = 0.1813; cl(14,10) = 0.1707;
cl(15,1) = 0.409; cl(15,2) = 0.385; cl(15,3) = 0.348; cl(15,4)  = 0.309; cl(15,5)   = 0.2632;
cl(15,6) = 0.236; cl(15,7) = 0.221; cl(15,8) = 0.1986; cl(15,9) = 0.1854; cl(15,10) = 0.1749;
cl(16,1) = 0.413; cl(16,2) = 0.391; cl(16,3) = 0.350; cl(16,4)  = 0.312; cl(16,5)   = 0.2693;
cl(16,6) = 0.241; cl(16,7) = 0.226; cl(16,8) = 0.2031; cl(16,9) = 0.1895; cl(16,10) = 0.1791;
cl(17,1) = 0.419; cl(17,2) = 0.394; cl(17,3) = 0.352; cl(17,4)  = 0.315; cl(17,5)   = 0.2755;
cl(17,6) = 0.247; cl(17,7) = 0.230; cl(17,8) = 0.2076; cl(17,9) = 0.1936; cl(17,10) = 0.1833;
cl(18,1) = 0.427; cl(18,2) = 0.400; cl(18,3) = 0.355; cl(18,4)  = 0.319; cl(18,5)   = 0.2816;
cl(18,6) = 0.253; cl(18,7) = 0.235; cl(18,8) = 0.212; cl(18,9)  = 0.1977; cl(18,10) = 0.1875;
cl(19,1) = 0.438; cl(19,2) = 0.407; cl(19,3) = 0.361; cl(19,4)  = 0.322; cl(19,5)   = 0.2877;
cl(19,6) = 0.258; cl(19,7) = 0.239; cl(19,8) = 0.2165; cl(19,9) = 0.2018; cl(19,10) = 0.1916;
cl(20,1) = 0.448; cl(20,2) = 0.414; cl(20,3) = 0.367; cl(20,4)  = 0.331; cl(20,5)   = 0.2938;
cl(20,6) = 0.261; cl(20,7) = 0.245; cl(20,8) = 0.221; cl(20,9)  = 0.2059; cl(20,10) = 0.1958;
cl(21,1) = 0.465; cl(21,2) = 0.423; cl(21,3) = 0.372; cl(21,4)  = 0.339; cl(21,5)   = 0.300;
cl(21,6) = 0.266; cl(21,7) = 0.250; cl(21,8) = 0.2254; cl(21,9) = 0.210; cl(21,10)  = 0.200;
hold on
for k = 1: 10
    plot(y,cl(:,k));
end
hold off
set(gca,'XTick',20:2:60);
grid on





