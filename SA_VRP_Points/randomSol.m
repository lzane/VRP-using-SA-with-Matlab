function res = randomSol(model)
    res = randperm(model.city+model.veh-1);
end