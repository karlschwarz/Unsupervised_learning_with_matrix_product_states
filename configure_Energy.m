function configure_energy = configure_Energy(X, mps)

n = size(X, 1);
configure_energy = zeros(size(X, 1), 1);

for i = 1:n
	conf = X(i, :);
    configure_energy(i, 1) = -(2 * log(abs(compute_Energy(conf, mps)))...
        - log(compute_Energy_Model(mps)));  
end

end