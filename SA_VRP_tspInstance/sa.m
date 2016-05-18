clc;
clear;
close all;

T0 = 10000000 ; % initial temperature
r = 0.999 ; % temperature damping rate
Ts = 0.001 ; % stop temperature

model = initModel();

% initialization
while(1)
route = randomSol(model);
if(isFeasible(route,model)) 
    break; 
end
end

cost = calculateCost(route,model);
T = T0;
min = cost;

cnt = 1;

% SA
while(T > Ts)
    flag = '#';
    mode = randi([1 3]);
    newRoute = createNeibor(route,model,mode);
    newCost = calculateCost(newRoute,model);
    delta = newCost - cost;
    
    if(delta < 0)
        cost = newCost;
        route = newRoute;
        flag = '*';
    else
        p=exp(-delta/T);
        if rand <= p 
             cost = newCost;
             route = newRoute;
             flag = '^';
        end
    end
    
     if cost < min
         min = cost;
     end
     
     costArr(cnt) = cost;
     
    T = T*r; %  annealing
    disp([flag 'Iteration ' num2str(cnt) ': Best Cost = ' num2str(cost) ' T = ' num2str(T)]);
    cnt = cnt+1;
    
end
disp(min);
plot(costArr);
