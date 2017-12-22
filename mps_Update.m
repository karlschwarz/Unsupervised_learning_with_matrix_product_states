function [energy_history, mps] = mps_Update(pat, mps, alpha, iter_nums)

n = size(pat, 2);
m = size(pat, 1);
energy_history = zeros(iter_nums, m);

for i = 1 : iter_nums

	for j = 1:m

	energy_history(i, j) = compute_Energy(pat(j,:), mps);
	graddata = gradDescent(pat(j,:), mps);
	gradmodel = gradDescentModel(mps);

	for jj = 1:n
	mps(:, :, pat(j, jj), jj) = mps(:, :, pat(j, jj), jj) + alpha * (graddata(:, :, pat(j, jj), jj) - gradmodel(:, :, pat(j, jj), jj));
	end

	end
end

end
