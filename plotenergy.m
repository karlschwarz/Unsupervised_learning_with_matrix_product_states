function plotenergy(configure_energy, pat, mps)

m = numel(configure_energy);
mm = size(pat, 1);
pat_energy = zeros(mm, 1);

for i = 1:mm
    conf = pat(i,:);
    pat_energy(i, 1) = -(log(compute_Energy(conf, mps)^2) - ...
        log(compute_Energy_Model(mps)));
end    

figure;
hold on;
plot(1:m, configure_energy, 'r*');
plot(1:mm, pat_energy, 'ko', 'MarkerFaceColor', 'y',...
    'MarkerSize', 7);
xlabel('Points');
ylabel('Energy');

end


