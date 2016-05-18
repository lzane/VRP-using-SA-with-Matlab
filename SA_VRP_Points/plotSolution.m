function plotSolution(route,model)
city = model.city;
veh = model.veh;
x0 = model.x0;
y0 = model.y0;
x = model.x;
y = model.y;

oneRoute = find(route>city);
From = [0 oneRoute]+1;
To = [oneRoute city+veh]-1;
routes = cell(veh,1);
subplot(1,2,1);

for i = 1:veh
       routes{i} = route(From(i):To(i)); 
end

colors=hsv(veh);

for r = 1:veh
    X = [x0 x(routes{r}) x0];
    Y = [y0 y(routes{r}) y0];
    color = 0.8*colors(r,:);
    
     plot(X,Y,'-o',...
            'Color',color,...
            'LineWidth',2,...
            'MarkerSize',10,...
            'MarkerFaceColor','white');
     hold on;
end

plot(x0,y0,'ks',...
        'LineWidth',2,...
        'MarkerSize',18,...
        'MarkerFaceColor','yellow');
  
  hold off;
  grid on;
  axis equal;


end