function exp_energy_model = compute_Energy_Model(mps)
%% function energy_model = compute_Energy_Model(mps)

n = size(mps, 4);
D = size(mps, 1);
X = ones(1, n);
xx = ones(1, n);
exp_energy_model = 0;

%% construct all possible configure of the input
for j = 1:n
	xx(1, j) = 2;
	X = [X; perms(xx)];
end

%% calculate the energy of the model
m = size(X, 1);

for mm = 1:m
conf = X(mm, :);
exp_energy_model = exp_energy_model + compute_Energy(conf, mps)^2;
end

end