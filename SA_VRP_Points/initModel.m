function model = initModel()

city = 100 ; % city number except depot
veh = 4 ; % vehicle number
model.city = city;
model.veh = veh;

xmin=0;
xmax=200;

ymin=0;
ymax=200;



maps = zeros(city+veh,city+veh);

x=randi([xmin xmax],1,city);
y=randi([ymin ymax],1,city);

x0 = 100;
y0 = 100;
model.x0 = x0;
model.y0 = y0;


% for showing multiple vehicles
offset = 30;
x1=randi([xmin xmax/2-offset],1,city/4);
x2=randi([xmin xmax/2-offset],1,city/4);
x3=randi([xmax/2+offset xmax],1,city/4);
x4=randi([xmax/2+offset xmax],1,city/4);

y1=randi([ymin ymax/2-offset],1,city/4);
y2=randi([ymin ymax/2-offset],1,city/4);
y3=randi([ymax/2+offset ymax],1,city/4);
y4=randi([ymax/2+offset ymax],1,city/4);
x = [x1 x2 x3 x4];
y = [y1 y3 y2 y4];


for k = 1:veh
x = [x x0];
y = [y y0];
end

model.x = x;
model.y = y;

n = city+veh;

for i = 1:n
   for j = i:n
      maps(j,i) = sqrt((x(i)-x(j))^2+(y(i)-y(j))^2); 
      maps(i,j) = maps(j,i);
   end
end

model.maps = maps;

end