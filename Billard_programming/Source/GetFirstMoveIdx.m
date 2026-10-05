function [FirstMoveIdx, MoveDist] = GetFirstMoveIdx(X,Y, MoveDistPx)

    %On modifie toutes les coordonnées par rapport à l'origine
    X = X - X(1);
    Y = Y - Y(1);

    d = sqrt(X.^2 + Y.^2);

    %Donne le premier indice de dplacement
    FirstMoveIdx = find(d > MoveDistPx, 1);

    %Si aucun deplacement, attribution d'une valeur aberrante
    if isempty(FirstMoveIdx)
       
        FirstMoveIdx = length(X) + 1;
        MoveDist = 0;

    else

        %Calcul de la distance voulue
        MoveDist = d(FirstMoveIdx);
        
    end
end
