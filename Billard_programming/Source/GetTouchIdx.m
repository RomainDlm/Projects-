function [IdxTouch, offset]=GetTouchIdx(X, Y, Xmin, Xmax, Ymin, Ymax, BallBorderDist)

IdxTouch = [];

%Creation d'un offset, utile si le premier indice correspond a un conact
offset = 0;


%Supprime le premier indice si celui ci correspond à un contact
if X(1) + BallBorderDist >= Xmax || X(1) - BallBorderDist <= Xmin 
    X(1) = [];
    Y(1) = [];
    offset = 1;
 

else 
    if Y(1) + BallBorderDist >= Ymax || Y(1) - BallBorderDist <= Ymin
        Y(1) = [];
        X(1) = [];
        offset = 1;


    end
end


%Etude de chaque bord
LeftTouch = (X - BallBorderDist) <= Xmin;
RigthTouch = (X + BallBorderDist) >= Xmax;
TopTouch = (Y - BallBorderDist) <= Ymin;
BottomTouch = (Y + BallBorderDist) >= Ymax;




%Left border
IdxTouchL = find(LeftTouch);
if numel(IdxTouchL) >= 2
    IdxTouchL = IdxTouchL([true, diff(IdxTouchL) > 1]);
end

%Right border
IdxTouchR = find(RigthTouch);
if numel(IdxTouchR) >= 2
    IdxTouchR = IdxTouchR([true, diff(IdxTouchR) > 1]);
end

%Top border
IdxTouchT = find(TopTouch);
if numel(IdxTouchT) >= 2
    IdxTouchT = IdxTouchT([true, diff(IdxTouchT) > 1]);
end

%Bottom border
IdxTouchB = find(BottomTouch);
if numel(IdxTouchB) >= 2
    IdxTouchB = IdxTouchB([true, diff(IdxTouchB) > 1]);
end


%Renvoie tous les indices des chocs dans l'ordre croissant
IdxTouch = sort(unique([IdxTouchL, IdxTouchR, IdxTouchT, IdxTouchB]));


end 