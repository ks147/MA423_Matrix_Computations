function d = mydet(A)
    [~,U,~,sign] = gepp_with_sign(A);
%     diag(L)
%     diag(U)
    d = prod(diag(U))*sign;
end