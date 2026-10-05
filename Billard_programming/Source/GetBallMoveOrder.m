function [FirstBall, SecondBall, LastBall, NbBallsMoved] = GetBallMoveOrder(Xr, Yr, Xy, Yy, Xw, Yw, MoveDistPx)

%Pour rappel : 
% Red : 1
% Yellow : 2
% White : 3




[RedFirstMove, MoveDistR] = GetFirstMoveIdx(Xr, Yr, MoveDistPx);
[YellowFirstMove, MoveDistY] = GetFirstMoveIdx(Xy, Yy, MoveDistPx);
[WhiteFirstMove, MoveDistW] = GetFirstMoveIdx(Xw, Yw, MoveDistPx);



%Creation d'une matrice 3x3
A = [RedFirstMove, YellowFirstMove, WhiteFirstMove; MoveDistR, MoveDistY, MoveDistW; 1, 2, 3];

%Assignation d'une valeur trop grande pour les FirstMove dans le cas où la
%distanc parcourure est nulle (2eme ligne de la matrice)
A(1, A(2,:) == 0) = length(Xr) + 1; %Xr par exemple (tous identiques)


%Tri dans l'ordre croissant les FirstMove de chaque boule
[~, idx] = sort(A(1,:)); 
Matrix = A(:, idx);



%Cas RedFirstMove == YellowFirstMove == WhiteFirstMove
if Matrix(1,1) == Matrix(1,2) && Matrix(1,2) == Matrix(1,3)

%MaxValue innutilisee

%Trie par apport a la distance initiale maximum parcourue
[MaxValue, IdxMax] = max(Matrix(2,:));

    Matrix(:, [IdxMax, 1]) = Matrix(:, [1, IdxMax]);


     if Matrix(2,2) < Matrix(2,3)
        Matrix(:, [2,3]) = Matrix(:, [3,2]);

     end
   

else

    if Matrix(1,1) == Matrix(1,2)
        if Matrix(2,1) < Matrix(2,2)
        Matrix(:, [1,2]) = Matrix(:, [2,1]);

        end
    end

    if Matrix(1,2) == Matrix(1,3)
        if Matrix(2,2) < Matrix(2,3)
        Matrix(:, [2,3]) = Matrix(:, [3,2]);

        end
    end

    if Matrix(1,1) == Matrix(1,3)
        if Matrix(2,1) < Matrix(2,3)
        Matrix(:, [1,3]) = Matrix(:, [3,1]);

        end
    end

end
    


%La 3eme ligne contenant le chiffre assigne a chaque boule aura ete trie
%lorsqu'on a trie les 2 premieres lignes, elle nous donne l'ordre de
%deplacement des boules
FirstBall = Matrix(3,1);
SecondBall = Matrix(3,2);
LastBall = Matrix(3,3);

%Nous donne le nombre de boules qui ont bouge
NbBallsMoved = sum(Matrix(1, :) <= length(Xr));



end