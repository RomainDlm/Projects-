Xr=[685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685 685
];
Yr=[237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237 237
];
Xy=[180 180 180 180 177 171 157 151 144 138 127 127 129 133 142 146 150 154 161 164 168 171 178 182 185 189 196 199 202 206 212 216 219 222 229 232 235 238 245 248 251 253 256 257 259 260 263 264 257 248 232 224 218 212 200 193 187 181 169 163 157 151 139 133 127 128 137 140 143 146 152 155 158 161 167 170 173 176 182 185 187 190 196 199 202 205 210 213 216 219 224 227 230 232 236 238 240 243 247 249 251 253 258 259 261 263 267 269 271 273 278 280 283 284 288 290 292 293 297 299 301 302 306 308 310 312 315 317 319
];
Yy=[299 299 299 299 294 272 231 210 191 173 137 120 105 103 126 137 147 156 173 182 190 198 215 223 231 240 255 263 272 280 296 304 312 320 336 344 352 360 375 383 391 389 378 373 369 365 356 352 346 339 328 322 316 310 299 293 287 282 271 265 259 254 243 237 231 227 220 216 212 208 200 196 192 188 181 177 173 169 161 158 154 150 143 139 135 132 124 121 117 113 106 103 100 102 107 109 111 113 117 119 120 122 126 128 130 132 136 138 139 142 145 147 149 151 155 156 158 159 163 165 167 168 171 173 175 177 180 182 183
];
Xw=[131 131 148 170 194 223 281 309 338 365 422 449 476 504 558 585 609 631 675 697 719 718 680 662 644 627 595 580 565 551 524 512 500 487 463 451 439 426 402 390 378 367 345 335 324 313 291 281 279 279 277 275 273 271 266 263 261 259 254 252 250 247 243 241 239 236 232 230 228 225 221 219 217 215 211 208 206 204 200 198 196 194 190 188 186 184 180 178 176 174 171 169 167 165 161 160 158 156 152 151 149 147 144 142 140 139 135 133 132 130 127 128 129 130 131 132 133 133 135 136 136 137 138 139 140 140 141 142 143
];
Yw=[391 391 368 335 310 299 274 261 247 233 203 187 171 154 121 104 108 122 148 160 172 183 204 214 224 234 253 261 270 279 295 303 311 318 334 342 349 357 372 380 387 391 382 377 373 369 360 356 354 353 349 347 345 342 338 336 334 332 327 325 323 321 317 315 313 311 307 305 303 301 297 295 293 291 287 286 284 282 278 276 274 272 269 267 266 264 260 259 257 255 252 250 248 247 243 241 240 238 235 234 232 230 227 226 224 223 220 218 217 216 213 211 209 207 203 201 199 197 194 192 190 188 184 183 181 179 176 174 173
];

%Variables de style modifiables par l'utilisateur sur Labview
LineStyle = '--';
MarkerStyle = '*';
ColorchocWin = [0, 0, 0
];
ColorchocLoose = [0, 0, 0
];
Folder = 'T4';
PDF = 'ScoreSheetT4.pdf';
boolean = 1;
SummaryName = 'SummaryT4.txt';
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
