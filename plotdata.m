function plotdata(J_history)

figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Iteration');
ylabel('Energy');

end
