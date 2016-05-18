clc;
clear;
close all;

T0 = 500 ; % initial temperature
r = 0.997 ; % temperature damping rate
Ts = 1 ; % stop temperature
iter = 300;

model = initModel();
set(gcf,'unit','normalized','position',[0,0.35,1,0.7]);

flag = 0;

% initialization
while(1)
route = randomSol(model);
if(isFeasible(route,model)) 
    break; 
end
end

cost = calculateCost(route,model);
T = T0;

cnt = 1;
minCost = cost;
minRoute = route;
    
maxIterate = 2100;
costArray = zeros(maxIterate,1);

% SA
while(T > Ts)
    for k = 1:iter
    mode = randi([1 3]);
    newRoute = createNeibor(route,model,mode);
    newCost = calculateCost(newRoute,model);
    delta = newCost - cost;
    
    if(delta < 0)
        cost = newCost;
        route = newRoute;
    else
        p=exp(-delta/T);
        if rand() <= p 
             cost = newCost;
             route = newRoute;
             
        end
    end
    end
    
    costArray(cnt) = cost;
    if cost<minCost
        minCost = cost;
        minRoute = route;
        flag = 1;
    end
    
    T = T*r; %  annealing
    disp(['Iteration ' num2str(cnt) ': BestCost = ' num2str(minCost) ': CurrentCost = ' num2str(cost) ' T = ' num2str(T)]);
    cnt = cnt+1;
    
   figure(1);
   if(flag == 1)
   plotSolution(minRoute,model);
    flag = 0;
   end
%    figure(2);
   subplot(1,2,2)
   plot(costArray);

   pause(0.0001);
end