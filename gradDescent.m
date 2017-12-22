function graddata = gradDescent(pat, mps)

m = size(pat, 1);
n = size(pat, 2);
D = size(mps, 1);

graddata = zeros(size(mps));
grad = zeros(size(mps));

for mm = 1:m

conf = pat(mm, :);
exp_energy = compute_Energy(conf, mps);

% here we calculate the gradient descent

for i=1:n % i's component
    if(i==1) % first vector, only D components
        for j=1:D % learn D components
            Cj=mps(j,:,conf(1, 2),2);
            for ii = 3:n-1   
                Cj = Cj * mps(:,:,conf(1, ii),ii);
            end
            Cj = Cj * mps(:,1,conf(1, n),n); 
            grad(1,j,conf(1, n),1) = (Cj/exp_energy);
        end
    elseif (i==2) % second vector, D*D elements
        for j=1:D
            Bj=mps(1,j,conf(1,1),1);
            for k=1:D
                Ck=mps(k,:,conf(1, 3),3);
                for ii=4:n-1
                    Ck = Ck * mps(:,:,conf(1,ii),ii);
                end
                Ck = Ck * mps(:,1,conf(1,n),n);
                grad(j,k,conf(1,2),2) = (Bj*Ck/exp_energy);
            end
        end
    elseif(i==n) % last vector, only D components
        for j=1:D % learn D components
            Bj=mps(1,:,conf(1,1),1);
            for ii = 2:n-2   
                Bj = Bj * mps(:,:,conf(1,ii),ii);
            end
            Bj = Bj * mps(:,j,conf(1, n-1),n-1); 
            grad(j,1,conf(1, n),n) = (Bj/exp_energy);
        end
    elseif(i==n-1) % D*D elements
        for k=1:D
            Ck=mps(k,1,conf(1, n),n);
            for j=1:D
                Bj=mps(1,:,conf(1, 1),1);
                for ii=2:n-3
                    Bj = Bj * mps(:,:,conf(1, ii),ii);
                end
                Bj = Bj * mps(:,j,conf(1, n-2),n-2);
                grad(j,k,conf(1, i),i) = (Bj*Ck/exp_energy);
            end
        end
    else % others, D*D elements
        for j=1:D
            for k=1:D
              Bj=mps(1,:,conf(1, 1),1);
              for ii=2:i-2
                    Bj = Bj * mps(:,:,conf(1, ii),ii);
              end
              Bj = Bj*mps(:,j,conf(1, i-1),i-1);
              Ck=mps(k,:,conf(1, i+1),i+1);
              for ii=i+1:n-1
                    Ck = Ck * mps(:,:,conf(1, ii),ii);
              end
              Ck = Ck * mps(:,1,conf(1, n),n);
              grad(j,k,conf(1, i),i) = (Bj*Ck/exp_energy);
            end
        end
    end
end

graddata = graddata + grad;

end

end

