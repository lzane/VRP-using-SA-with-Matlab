function newRoute = createNeibor(route,model,mode)
while(1)
    switch mode
        case 1
            newRoute = Swap(route);
        case 2
            % Do Reversion
            newRoute=Reversion(route);
            
        case 3
            % Do Insertion
            newRoute=Insertion(route);
    end
    
    if(isFeasible(newRoute,model)) 
        break; 
    end
end
end

function newRoute = Swap(route)
    n = numel(route);
    
    i = randsample(n,2);
    i1 = i(1);
    i2 = i(2);
    newRoute = route;
    newRoute([i1 i2]) = route([i2 i1]);
end

function newRoute = Reversion(route)
    n=numel(route);
    
    i=randsample(n,2);
    i1=min(i(1),i(2));
    i2=max(i(1),i(2));
    
    newRoute=route;
    newRoute(i1:i2)=route(i2:-1:i1);

end


function newRoute = Insertion(route)
    n=numel(route);
    
    i=randsample(n,2);
    i1=i(1);
    i2=i(2);
    
    if i1<i2
        newRoute=[route(1:i1-1) route(i1+1:i2) route(i1) route(i2+1:n)];
    else
        newRoute=[route(1:i2) route(i1) route(i2+1:i1-1) route(i1+1:n)];
    end

end
