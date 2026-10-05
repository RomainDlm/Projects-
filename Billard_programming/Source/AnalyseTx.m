
%Attribution d'un indentifiant a chaque boule
% Red : 1
% Yellow : 2
% White : 3


%Definition des constantes
MoveDistPx = 9;
BallBorderDist = 9;
BorderHitStyle = 'o';


%initialisation des autres variables
BandTouched = 0;
Score = 'lose';
Colorchoc = ColorchocLoose;




%Trouver et remplacer tous les NAN grace a la fontion InterpolateNan
[Xr,Yr] = InterpolateNan(Xr,Yr);
[Xy,Yy] = InterpolateNan(Xy,Yy);
[Xw,Yw] = InterpolateNan(Xw,Yw);

%Trouver et remplacer tous les Outliers
[Xr,Yr] = RemoveOutlier(Xr,Yr);
[Xy,Yy] = RemoveOutlier(Xy,Yy);
[Xw,Yw] = RemoveOutlier(Xw,Yw);



%Trouver le cadre du billard
[Xmin, Xmax, Ymin,Ymax] = GetFrame(Xr,Yr,Xy,Yy,Xw,Yw);

%Hauteur de notre billard
H = Ymax-Ymin;


X_frame = [Xmin Xmax Xmax Xmin Xmin];
Y_frame = [Ymin Ymin Ymax Ymax Ymin];


%Donne le nombre et l'ordre des balles qui ont bouge
[FirstBall, SecondBall, LastBall, NbBallsMoved] = GetBallMoveOrder(Xr, Yr, Xy, Yy, Xw, Yw, MoveDistPx);

%Nous donne l'indice a laquelle chaque boule commence a bouger
[FirstMoveIdxR, MoveDistR] = GetFirstMoveIdx(Xr,Yr, MoveDistPx);
[FirstMoveIdxY, MoveDistY] = GetFirstMoveIdx(Xy,Yy, MoveDistPx);
[FirstMoveIdxW, MoveDistW] = GetFirstMoveIdx(Xw,Yw, MoveDistPx);
OrderIdx = sort([FirstMoveIdxR, FirstMoveIdxY, FirstMoveIdxW]);




%Distance totale parcourue par chaque balle
PathLengthR = GetBallPathLength(Xr,Yr);
PathLengthY = GetBallPathLength(Xy,Yy);
PathLengthW = GetBallPathLength(Xw,Yw);





%Partie visuelle
figure

hold on

axis off

%Tracer la trajectoire de chaque boule en n'oubliant pas d'inverser les coordonees Y
plot(Xr, H-Yr, 'r', 'LineStyle', LineStyle, 'Marker', MarkerStyle);
plot(Xy, H-Yy, 'Color', [0.9 0.7 0],'LineStyle', LineStyle, 'Marker', MarkerStyle); %couleur : jaune fonce 
plot(Xw, H-Yw, 'b','LineStyle', LineStyle, 'Marker', MarkerStyle);
plot(X_frame, H-Y_frame, 'k');

%Illustration des positions initiales des boules
plot(Xr(1), H-Yr(1), 'Marker', 'h', 'MarkerSize', 15, 'MarkerEdgeColor', 'r');
plot(Xy(1), H-Yy(1), 'Marker', 'h', 'MarkerSize', 15, 'MarkerEdgeColor', [0.9 0.7 0]);
plot(Xw(1), H-Yw(1), 'Marker', 'h', 'MarkerSize', 15, 'MarkerEdgeColor', 'b');


%Dans le cas ou la balle rouge est tappee en premier
if FirstBall == 1

    [IdxTouchR, offset] = GetTouchIdx(Xr,Yr,Xmin, Xmax, Ymin, Ymax, BallBorderDist);

    %Masque servant a isoler les rebonds valides
    MaskBetween = IdxTouchR > OrderIdx(2) & IdxTouchR < OrderIdx(3);
    IdxTouchR_between = IdxTouchR(MaskBetween);    

    %Renvoie le nombre de bord qui sont touches par la boule principale apres avoir tape la premiere boule
    %et avant d'avoir tappe la 2eme
    ValidBoarderTouch = length(IdxTouchR_between);

     %Conditions necessaires pour gagner
    if NbBallsMoved == 3 && ValidBoarderTouch >= 3
        Score = 'Win';
        Colorchoc = ColorchocWin;
    end

    %Trace les contacts entre les bords et la boule
    %plot(Xr(IdxTouchR + offset), H-Yr(IdxTouchR + offset), 'Marker', BorderHitStyle, 'MarkerSize', 15, 'MarkerEdgeColor', Colorchoc, 'LineStyle', 'none');
    plot(Xr(IdxTouchR_between + offset), H - Yr(IdxTouchR_between + offset), 'Marker', BorderHitStyle, 'MarkerSize', 15, 'MarkerEdgeColor', Colorchoc, 'LineStyle', 'none');


    %Ecriture sur d'une partie des resultats
    text(Xmin, (H-Ymax)-0.05*H,'Score sheet for "red"');
    text(Xmin + (Xmax - Xmin)*0.8, (H-Ymax)-0.07*H,{[num2str(NbBallsMoved) ' ball(s) touched'],[num2str(ValidBoarderTouch) ' band(s) touched']})


   
end

%Idem si c'est la boule jaune qui est tappee en premier
if FirstBall == 2

    [IdxTouchY, offset] = GetTouchIdx(Xy,Yy,Xmin, Xmax, Ymin, Ymax, BallBorderDist);

    MaskBetween = IdxTouchY > OrderIdx(2) & IdxTouchY < OrderIdx(3);
    IdxTouchY_between = IdxTouchY(MaskBetween);
   
    ValidBoarderTouch = length(IdxTouchY_between);

    if NbBallsMoved == 3 && ValidBoarderTouch >= 3
        Score = 'Win';
        Colorchoc = ColorchocWin;
    end

    plot(Xy(IdxTouchY_between + offset), H - Yy(IdxTouchY_between + offset), 'Marker', BorderHitStyle, 'MarkerSize', 15, 'MarkerEdgeColor', Colorchoc, 'LineStyle', 'none');

    text(Xmin, (H-Ymax)-0.05*H,'Score sheet for "yellow"');
    text(Xmin + (Xmax - Xmin)*0.8,(H-Ymax)-0.07*H,{[num2str(NbBallsMoved) ' ball(s) touched'],[num2str(ValidBoarderTouch) ' band(s) touched']})


end



%Idem si c'est la boule blanche qui est tappee en premier
if FirstBall == 3

    [IdxTouchW, offset] = GetTouchIdx(Xw,Yw,Xmin, Xmax, Ymin, Ymax, BallBorderDist);

    MaskBetween = IdxTouchW > OrderIdx(2) & IdxTouchW < OrderIdx(3);
    IdxTouchW_between = IdxTouchW(MaskBetween);
   
    ValidBoarderTouch = length(IdxTouchW_between);

    if NbBallsMoved == 3 && ValidBoarderTouch >= 3
        Score = 'Win';
        Colorchoc = ColorchocWin;
    end

    plot(Xw(IdxTouchW_between + offset), H - Yw(IdxTouchW_between + offset), 'Marker', BorderHitStyle, 'MarkerSize', 15, 'MarkerEdgeColor', Colorchoc, 'LineStyle', 'none');
   
    text(Xmin, (H-Ymax)-0.05*H,'Score sheet for "white"');
    text(Xmin + (Xmax - Xmin)*0.8,(H-Ymax)-0.07*H,{[num2str(NbBallsMoved) ' ball(s) touched'],[num2str(ValidBoarderTouch) ' band(s) touched']})


end


%Ecriture du titre et du reste des resultats de la partie
title(['Scores sheet - ' Folder ' - (' char(datetime('now')) ')'], 'FontSize', 15)

%Utilisation de num2str pour convertir en string et int32 pour convertir en
%int
text(Xmin + (Xmax - Xmin)*0.2, (H-Ymax)-0.2*H,['red_d:' num2str(int32(PathLengthR)) 'px']);
text(Xmin + (Xmax - Xmin)*0.45, (H-Ymax)-0.2*H,['yellow_d:' num2str(int32(PathLengthY)) 'px']);
text(Xmin + (Xmax - Xmin)*0.7,(H-Ymax)-0.2*H,['white_d:' num2str(int32(PathLengthW)) 'px']);



%Ecriture du score
text(Xmin, (H-Ymax)-0.1*H, ['---' Score '---']);

hold off


%Ecriture dans le PDF

%F(irstball)
if FirstBall == 1
    f_char = 'r';
elseif FirstBall == 2
    f_char = 'y';
elseif FirstBall == 3
    f_char = 'w';
else
    f_char = '?';
end


%S(core)
if strcmpi(Score,'Win')
    s_char = 'w';
else
    s_char = 'l';
end


%Sauvegarde du PDF ScoreSheetXX.pdf
filenamePDF = sprintf('ScoreSheet%s.pdf', Folder);
saveas(gcf, filenamePDF);


if boolean
open(PDF);
end


%Chaine finale
Message = sprintf("f:%s; s:%s; n:%d; b:%d; rb:%d; yb:%d; wb:%d;", f_char, s_char, NbBallsMoved, ValidBoarderTouch, int32(PathLengthR), int32(PathLengthY), int32(PathLengthW));


%Sauvegarde du SummaryXX.txt
filenameTXT = sprintf(SummaryName, Folder);
fid = fopen(filenameTXT, 'w');
fprintf(fid, "%s\n", Message);
fclose(fid);
