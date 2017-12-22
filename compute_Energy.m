function exp_energy = compute_Energy(conf, mps)

n = size(conf, 2);

exp_energy = mps(1,:,conf(1,1),1); % first vector

for ii = 2:n-1   

    exp_energy = exp_energy * mps(:,:,conf(1,ii),ii);

end

exp_energy = exp_energy * mps(:,1,conf(1,n),n);

end

