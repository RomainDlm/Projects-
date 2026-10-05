function [Xmin, Xmax, Ymin, Ymax] = GetFrame(Xr,Yr,Xy,Yy,Xw,Yw)


%Renvoie les coordonnnees maximales et minimales afin de tracer le cadre
Xmin = min([Xr Xy Xw]);
Xmax = max([Xr Xy Xw]);

Ymin = min([Yr Yy Yw]);
Ymax = max([Yr Yy Yw]);

end