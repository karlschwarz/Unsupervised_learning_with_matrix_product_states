%% This is the main program of Tensor networks
% We initialize the MPS and the patterns
% D: the bond dimension, n: the number of spins
clear; close All; clc;
D = 6; n = 5; p = 1; alpha = 0.01; num_iters = 200;

mps = MPS(D, n);
pat = Pat(n, p);

%% plot initial energy of all configurations
fprintf('creat all  possible configurations...\n');
X = creat_Configure(n);
conf_energy = configure_Energy(X, mps);
plotenergy(conf_energy, pat, mps);

%% update the MPS
[energy_history, mps] = mps_Update(pat, mps, alpha, num_iters);

%% plot iter-energy figure
fprintf('iter-energy figure is being plot...\n');
for i = 1:p
plotdata(energy_history(:,i));
end
fprintf('please enter any key to go on. \n');
pause;

%% create all  possible configurations and calculate their energy
fprintf('creat all the possible configurations...\n');
X = creat_Configure(n);
conf_energy = configure_Energy(X, mps);
plotenergy(conf_energy, pat, mps);





