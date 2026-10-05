function[X,Y] = InterpolateNan(X,Y)


X_= [0,X,0];
Y_  = [0,Y,0];

%Recherche des positions des NaN et des positions valides
NanX = isnan(X_);
PosNanX = find(NanX);
NotNanX = ~isnan(X_);
PosNotNanX = find(NotNanX);

%Change tous les NaN par la methode Next
X_(NanX) = interp1(PosNotNanX, X_(NotNanX), PosNanX, 'next');
%Enleve le premier et le dernier element 
X = X_(2 : end-1);


NanY = isnan(Y_);
PosNanY = find(NanY);
NotNanY = ~isnan(Y_);
PosNotNanY = find(NotNanY);

Y_(NanY) = interp1(PosNotNanY, Y_(NotNanY), PosNanY, 'next');
Y = Y_(2 : end-1);

end
