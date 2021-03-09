clc;
clear all
format short e

A = gallery('kahan',90,1.2,0);
sigma1 = svd(A);
fprintf('Original Matrix\n');
fprintf('sigma(1,1) = %e\n', sigma1(1));
fprintf('sigma(89,89) = %e\n',sigma1(89));
fprintf('sigma(90,90) = %e\n',sigma1(90));

num_rank_normal = rank(A);
fprintf('Rank of Original Matrix: %d\n\n\n', num_rank_normal);

A = gallery('kahan',90,1.2,25);
sigma2 = svd(A);
fprintf('Perturbed Matrix\n');
fprintf('sigma(1,1) = %e\n', sigma2(1));
fprintf('sigma(89,89) = %e\n',sigma2(89));
fprintf('sigma(90,90) = %e\n',sigma2(90));
num_rank_perturbed = rank(A);
fprintf('Rank of Perturbed Matrix: %d\n\n\n', num_rank_perturbed);

fprintf('Using QR decomposition\n');
[Q,R,E] = qr(A);
diff = norm(eye(90)-E);
fprintf('|| I - E||: %e\n',diff);
fprintf('R(90,90) = %e\n',R(90,90));