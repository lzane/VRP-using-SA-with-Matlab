function res = isFeasible(route,model)
    len = length(route);
    if route(1)>model.city||route(len)>model.city
        res = 0; return
    end 
    
    for i = 2:len
        if route(i)>model.city && route(i-1)>model.city  % not use all vehicles
            res = 0; return
        end
    end
    
    res = 1;
end