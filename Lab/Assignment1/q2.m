clc;
clear all;
close all;

[s,scf,scb] = semireciprocal(1000,5);
disp('for m=1000');
fprintf("s:%f\nscf:%f\nscb:%f\n",s,scf,scb);

function [s,scf,scb] = semireciprocal(m,k)
   s = 0;
   scf = 0;
   scb = 0;
   
   for i=1:m
      s = s + 1/i;
      scf = scf + chop(1/i,k);
      scb = scb + chop(1/(m - i + 1),k);
   end
   
end