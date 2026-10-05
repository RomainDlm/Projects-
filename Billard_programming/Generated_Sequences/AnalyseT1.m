Xr=[668 668 668 652 620 560 532 500 472 420 400 380 362 324 304 288 268 236 220 204 188 156 138 130 144 168 182 192 204 224 234 244 252 272 280 288 298 314 324 332 342 358 368 376 384 402 410 420 427 444 452 462 470 488 496 504 512 530 538 546 555 572 580 588 596 612 620 628 636 648 656 662 668 680 686 692 700 712 718 724 726 716 712 710 706 700 696 692 690 684 680 678 674 668 666 662 660 654 650 646 644 640 636 634 630 624 622 618 616 610 608 604 602 596 594 592 590 584 580 578 576 570 568 566 564 558 556 552 550 546 544 542 538 534 532 530 528 522 520 518 516 512 508
];
Yr=[270 270 270 260 236 192 168 148 130 106 124 140 156 188 200 212 228 252 264 276 288 308 320 332 342 364 376 386 394 376 368 360 354 342 336 330 324 312 306 300 296 283 276 271 266 254 248 242 236 224 220 214 208 196 190 186 180 168 162 156 152 140 136 130 124 112 108 102 102 112 114 116 120 124 126 128 132 136 140 142 144 146 146 148 148 150 150 152 152 154 154 156 156 158 160 160 160 162 164 164 164 166 168 168 168 170 170 172 172 174 174 176 176 178 178 180 180 182 182 182 184 186 186 186 186 188 190 190 190 192 192 194 194 196 196 196 198 198 200 200 200 202 202
];
Xy=[719 NaN NaN 683 693 713 722 724 717 705 699 692 683 665 657 648 638 621 613 605 597 580 572 563 555 538 530 521 514 497 489 481 472 456 448 441 436 425 420 415 410 399 393 388 382 371 366 361 356 345 340 335 329 319 314 308 303 293 288 283 278 268 263 257 253 242 237 232 228 218 213 208 203 193 188 183 179 169 164 159 155 146 141 136 132 129 132 135 138 142 144 147 149 154 155 156 158 160 161 162 163 164 165 166 167 169 169 170 171 171 172 173 173 175 175 176 177 178 179 179 180 181 182 182 183 184 185 185 186 187 187 188 188 189 189 190 191 191 192 192 193 194 194
];
Yy=[356 NaN NaN 268 249 214 197 179 160 125 109 102 117 144 156 168 181 202 211 221 230 248 257 266 275 293 302 311 320 338 347 356 364 383 391 390 382 370 365 360 356 348 344 339 335 327 323 319 315 307 303 299 294 287 283 278 275 267 263 258 255 247 243 239 235 228 224 220 216 208 204 200 196 189 185 182 178 171 167 163 160 152 148 145 141 135 133 130 128 123 121 118 116 111 109 106 104 102 103 104 106 109 110 111 112 116 117 118 119 122 123 124 125 127 128 130 131 133 135 135 136 138 139 141 142 143 144 146 146 148 149 150 151 153 154 154 155 156 157 158 159 160 161
];
Xw=[170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 170 171 172 174 175 176 177 179 180 181 182 184 185 185 186 188 188 189 190 191 192 193 194 195 196 196 196 198 198 199 199 200 201 201 202 203 203 204 204 205 205 206 206 206 207 207 207 207 208
];
Yw=[114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 113 113 113 113 113 113 113 113 113 113 113 113 113 113 113 113 114 114 114 114 115 115 115 115 115 115 115 116 116 116 116 116 116 116 116 116 116 116 116 117 117 117 117 117 117 117 117 118 118 118 118 118 118 118 118 118 118 119 119 119 119 119 119
];

%Variables de style modifiables par l'utilisateur sur Labview
LineStyle = '-';
MarkerStyle = 'd';
ColorchocWin = [0, 1, 1
];
ColorchocLoose = [1, 0, 0
];
Folder = 'T1';
PDF = 'ScoreSheetT1.pdf';
boolean = 1;
SummaryName = 'SummaryT1.txt';
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
