function [X,Y] = RemoveOutlier(X,Y)


X_out = isoutlier (X,'movmedian', 10);
Y_out = isoutlier (Y,'movmedian', 10);

%On utilise RemoveOutlier si et seulement si X ET Y sont abberants
Out_Idx = find(X_out & Y_out);


%Cas ou la premiere valeur est aberrante
if ~isempty(Out_Idx) && Out_Idx(1) == 1 
    Out_Idx(1) = [];
end


%Remplacement des valeurs aberrantes
if ~isempty(Out_Idx)
    X(Out_Idx) = X(Out_Idx - 1);
    Y(Out_Idx) = Y(Out_Idx - 1);
end


end 

