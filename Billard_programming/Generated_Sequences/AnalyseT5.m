Xr=[230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 230 225 221 213 210 206 203 195 192 189 185 179 175 172 168 162 158 155 151 145 142 139 136 129 128 131 131 136 137 139 140 144 145 147 149 151 153 155 156 159 161 163 164 167 168 170 172 175 176 178 179 182 183 184 186 189 190 191 193 195 196 198 199 201 202 203 205 207 209 209 211 213 213
];
Yr=[319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 319 315 312 306 303 301 297 291 290 287 285 280 277 274 271 267 264 261 259 255 252 249 247 242 239 239 237 233 231 229 229 225 223 222 221 217 216 214 213 210 209 207 206 203 202 200 198 195 194 193 191 189 187 187 185 183 181 180 179 176 175 174 173 171 169 168 167 165 163 163 161 159 159
];
Xy=[243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 243 242 242 242 242 242 242 242 242 242 242
];
Yy=[344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344 344
];
Xw=[239 239 239 239 245 265 284 302 340 359 378 397 434 453 472 491 527 545 563 580 616 635 652 670 705 723 720 705 676 663 651 641 621 612 603 595 578 569 560 552 535 526 518 509 492 484 476 467 451 442 434 426 409 401 393 385 368 360 352 344 328 320 312 304 288 280 272 264 248 241 237 234 227 223 219 215 208 204 200 197 189 186 182 178 171 167 164 160 153 149 146 143 136 132 129 128 133 135 137 138 142 144 146 147 151 152 154 156 159 161 162 164 167 168 169 171 173 175 176 178 180 181 182 184 186 187 188 190 192 193 194 195 197 198 199 200 202 203 204 205 207 208
];
Yw=[368 368 368 368 369 370 372 373 377 380 382 383 387 389 391 392 391 390 389 387 386 385 384 383 381 380 382 385 390 392 391 389 386 384 383 382 379 378 376 375 373 371 370 369 367 365 364 362 360 359 357 356 354 352 351 350 347 346 345 343 341 339 338 337 335 333 332 331 328 327 329 332 336 337 339 341 344 346 348 350 353 355 356 358 361 363 365 366 369 371 373 374 378 379 381 382 383 383 384 385 386 387 388 388 390 390 391 391 392 393 393 393 393 393 393 392 391 391 391 390 390 390 389 389 388 388 388 387 387 386 386 386 386 385 385 385 384 384 384 383 383 383
];

%Variables de style modifiables par l'utilisateur sur Labview
LineStyle = '--';
MarkerStyle = '+';
ColorchocWin = [0, 1, 0
];
ColorchocLoose = [1, 0, 0
];
Folder = 'T5';
PDF = 'ScoreSheetT5.pdf';
boolean = 1;
SummaryName = 'SummaryT5.txt';
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
