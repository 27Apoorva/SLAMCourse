function [mu, sigma] = recover_gaussian(sigma_points, w_m, w_c)
% This function computes the recovered Gaussian distribution (mu and sigma)
% given the sigma points (size: nx2n+1) and their weights w_m and w_c:
% w_m = [w_m_0, ..., w_m_2n], w_c = [w_c_0, ..., w_c_2n].
% The weight vectors are each 1x2n+1 in size,
% where n is the dimensionality of the distribution.

% Try to vectorize your operations as much as possible
n = size(sigma_points,1);
% TODO: compute mu
temp1 = w_m(:,1) * transform(sigma_points(:,1));
mu = zeros(n,1);
mu = mu + temp1;
for i = 1:2*n
    var(:,i) = w_m(:,i+1) * transform(sigma_points(:,i+1));
    mu = mu + var(:,i);
endfor

% TODO: compute sigma
sigma = zeros(n,n);

sigma = w_c(:,1)*(transform(sigma_points) - mu)*(transform(sigma_points) - mu)';
for i = 1:2*n
    var = w_c(1,i+1)*(transform(sigma_points) - mu)*(transform(sigma_points) - mu)';
    sigma = sigma + var;
endfor

end
