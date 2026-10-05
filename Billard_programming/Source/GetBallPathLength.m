function PathLength = GetBallPathLength(X,Y)

%Calcule la distance totale parcourue par la balle

PathLength = sum(sqrt(diff(X).^2 + diff(Y).^2));

end


