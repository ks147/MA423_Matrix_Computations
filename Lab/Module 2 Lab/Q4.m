format long e
n=64;
A=Wilkinson(n);
x=rand(n,1);
b=A*x;
[L,U,p]=gepp(A);
x_c=geppsolve(A,b);
m=2;
tol=10e-6;
x_refined=iteref(A,b,x_c,L,U,p,m,tol);
forward_error_x_c=norm(x-x_c)/norm(x);
forward_error_x_refined=norm(x-x_refined)/norm(x);
residual_x_c=norm(b-A*x_c);
residual_x_refined=norm(b-A*x_refined);
fprintf("Forward error for Computed Solution - %e\n",forward_error_x_c);
fprintf("Forward error for Refined Solution - %e\n",forward_error_x_refined);
fprintf("Norm of residual for Computed Solution - %e\n",residual_x_c);
fprintf("Norm of residual for Refined Solution - %e\n",residual_x_refined);