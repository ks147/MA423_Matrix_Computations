clc;
clear all;

x = linspace(1.93,2.08,151);
z1 = (x - 2).^9;
p = [1,-18,144,-672,2016,-4032,5376,-4608,2304,-512];
z2 = [];
for i = x
    z2 = [z2; Horner(p,i)];
end

plot(x,z1);
xlabel('x');
ylabel('p(x)');
hold on

plot(x,z2);
legend('(x - 2)^9','Horner(p,x)');