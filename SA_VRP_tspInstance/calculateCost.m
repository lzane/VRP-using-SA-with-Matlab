function res = calculateCost(route,model)
    city = model.city;
    veh = model.veh;
    maps = model.maps;
    
    route = [city+veh route city+veh];
    res = 0;
    
    for i = 1:length(route)-1
        res = res + maps(route(i),route(i+1));
    end
    
end