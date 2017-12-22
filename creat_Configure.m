function X = creat_Configure(n)

X = ones(1, n);
xx = ones(1, n);

for j = 1:n
	xx(1, j) = 2;
	X = [X; perms(xx)];
end