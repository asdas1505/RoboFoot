X_Vis = csvread('M064_zz4.csv');   % Read the CSV File

% Segeregate the data in x, y, z

x = X_Vis(:,1:64);    

y = X_Vis(:,65:128);

z = X_Vis(:,129:192);
z = (z + abs(z))/2;       

len = size(z);

% Reshaping the data into (8, 8, number of time steps).

x = reshape(x',[8,8,len(1)]);
y = reshape(y',[8,8,len(1)]);
z = reshape(z',[8,8,len(1)]);

% Max value for each component.
m_x = max(x(:));
m_y = max(y(:));
m_z = max(z(:));

% Preprocessing the data, so that all the values lie between 0 and 1.
x = (x/m_x)*3;
y = y/m_y;
z = z/m_z;

a = 1:8;
b = 1:8;
[A,B] = meshgrid(a,b);


h = figure;
axis tight manual % this ensures that getframe() returns a consistent size
for n = 1:len(1)
    surf(A,B,y(:,:,n))           % Choose for which component x, y, z you want visaulize data. 
    zlim([-4 4]);                % For x and y chose limit -4 to 4 and for z chose 0 to 8.  
    view(90,0)                   % To visualise Y component use view(90,0) after surf function.
                                 % To visualise X component use view(180,0) after surf functio
     
    drawnow
    
end
