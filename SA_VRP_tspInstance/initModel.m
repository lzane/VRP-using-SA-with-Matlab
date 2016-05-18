function model = initModel()

city = 47 ; % city number
veh = 2 ; % vehicle number
model.city = city;
model.veh = veh;

mapsName = 'hk48.tsp';
maps = fileread(mapsName);
maps = str2num(maps);
for i = 2:veh
   for j = 1:city+veh-1
      maps(j,(city+i)) = maps(j,(city+i-1)); 
      maps((city+i),j) = maps(j,(city+i-1));
   end
end
model.maps = maps;

end