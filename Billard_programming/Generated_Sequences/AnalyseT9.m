Xr=[267 267 266 255 251 241 235 227 223 215 211 203 199 192 188 184 183 181 179 177 175 173 174 169 168 165 165 163 161 159 157 155 153 151 149 147 145 143 143 140 139 137 137 135 135 134 134 132 131 131 130 129 128 127 127 129 129 129 130 129 130 131 131 131 131 133 133 134 134 135 135 136 136 136 136 137 137 138 138 139 139 139 140 141 140 141 141 142 143 143 143 143 144 144 144 145 145 146 146 146 147 147 147 147 147 147 147 147 147 148 149 149 149 149 149 149 150 150 150 151 151 151 151 151 151 151 151 151 151 152 152 152 152 152 152 152 153 153 152 153 153 153 153 153 154 153
];
Yr=[103 103 103 131 151 187 206 239 255 283 299 327 341 371 385 379 369 349 339 323 315 299 291 277 271 255 249 235 227 211 205 191 183 169 163 149 141 127 121 107 101 112 116 125 128 135 141 149 151 159 163 171 175 182 186 193 195 203 207 213 217 223 227 234 237 243 247 253 257 263 267 273 276 282 285 291 294 300 303 309 313 318 321 327 329 335 338 343 347 352 355 359 363 368 371 375 379 383 387 390 390 390 390 387 385 383 382 379 378 375 373 371 370 367 367 363 363 361 359 357 355 353 353 351 349 347 347 345 344 343 341 340 339 337 337 335 335 333 333 331 330 329 328 327 327 325
];
Xy=[712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 127 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 712 713 716 718 721 722 725 726 724 724 722 721 720 719 718 717 716 715 714 714 713 712 711 710 709 709 708 708 707 706 705
];
Yy=[313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 286 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 313 314 314 314 314 314 314 314 314 314 314 314 314 314 314 314 314 314 314 314 314 314 314 314 314 314 314 313 312 310 309 308 307 306 305 304 303 303 302 301 301 300 299 299 298 298 297 297 296 295 295 294 294 294 293 293 292
];
Xw=[251 251 267 316 342 394 419 469 493 539 563 609 632 678 701 721 694 657 639 606 590 560 546 520 508 485 473 451 439 417 405 383 371 348 337 314 302 279 268 245 234 211 200 177 166 144 132 139 148 164 171 183 189 201 207 219 225 237 243 254 260 272 278 289 295 307 312 324 330 341 347 358 364 375 380 392 397 408 413 424 430 441 446 457 462 473 478 489 494 505 510 520 526 536 541 551 556 566 572 581 587 597 602 612 616 626 631 641 646 655 660 670 675 684 689 698 702 707 710 716 718 724 726 725 723 720 719 716 715 711 709 705 703 699 697 694 692 688 686 683 681 677 675 672 670 667
];
Yw=[152 151 121 100 107 119 125 135 140 147 151 157 160 167 170 177 191 211 220 238 248 266 274 291 300 317 325 342 350 367 375 390 390 378 373 364 359 351 347 338 333 324 320 311 308 299 295 283 276 264 258 246 240 227 222 210 204 192 186 174 168 156 150 139 133 121 116 104 101 110 113 120 123 129 133 139 143 149 152 158 162 168 171 177 181 187 190 196 199 206 208 215 218 224 227 233 236 242 245 251 254 259 262 268 271 277 280 286 288 294 297 303 305 311 314 319 323 330 334 342 345 353 356 364 367 375 378 385 389 390 388 385 383 379 377 373 371 367 365 362 360 356 354 351 349 345
];

%Variables de style modifiables par l'utilisateur sur Labview
LineStyle = '--';
MarkerStyle = '+';
ColorchocWin = [0, 1, 0
];
ColorchocLoose = [1, 0, 0
];
Folder = 'T9';
PDF = 'ScoreSheetT9.pdf';
boolean = 1;
SummaryName = 'SummaryT9.txt';
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
