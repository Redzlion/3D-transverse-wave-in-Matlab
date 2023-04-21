close all;
clearvars,clc
mymap = [ 0,0.3, 0.9
    0 0 1];
[X,Y] = meshgrid(-5:5);
filename = 'animation.gif';
v = input('Enter speed v: ');
axis equal  % Equal axis aspect ratio
for n=1:v*0.01:5
    Z = sin(n*X+n*Y);
    s = surf(X,Y,Z);
    view(120,40);  % Setting viewing angle
    %shading interp
    xlabel('X axis'),ylabel('Y axis')
    zlabel('Z = sin(X+Y)')
    colormap(mymap);
    s.CData = Y;
    colorbar
    zlim([-5 5])
    pause(0.01)
    frame = getframe(gcf);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if n == 1
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf,...
        'DelayTime',0.1);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append',...
        'DelayTime',0.1);
    end
end