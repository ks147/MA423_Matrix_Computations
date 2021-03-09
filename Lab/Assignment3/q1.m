clc;
clear all;
warning('off');
C = [];
C_1norm = [];
C_infnorm = [];
N = 2:2:16;
for n=N
    H = hilb(n);
    C = [C; cond(H)];
    C_1norm = [C_1norm; cond(H,1)];
    C_infnorm = [C_infnorm; cond(H,inf)];
end

figure;
semilogy(N,C);
xlabel('N');
ylabel('Condition number');
title('2-norm');

figure;
semilogy(N,C_1norm);
xlabel('N');
ylabel('Condition number');
title('1-norm');

figure;
semilogy(N,C_infnorm);
xlabel('N');
ylabel('Condition Number');
title('inf-norm');