/*
Pix2Pos.c

Programme C du projet billard 2025

Ce programme lit une image binaire contenant les pixels du billard et recherche la position des boules Jaune, Rouge et Blanche grace
a l'analyse de leur couleur. Puis il ecrit un fichier de sortie, Pos.txt, contenant les coordonnees de chaque boule sous la forme :

Red: Xrouge, Yrouge, ScoreRouge
Yellow: Xjaune, Yjaune, ScoreJaune
White: Xblanc, Yblanc, ScoreBlanc

Auteurs:
    Thomas Bancken : 393134
    Jules Diebold : 393356 
    Romain Delamare : 373041
 */


#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <errno.h>
#include <string.h>
#define BallminScore 15


/*
1 : Erreur : nombre d'arguments incorrect
2 : Erreur : diametre incorrect
3 : Erreur : fichier Pixmap.bin non ouvrable
4 : Erreur : largeur manquante
5 : Erreur : hauteur manquante
6 : Erreur : dimensions hors bornes
7 : Erreur : attribution de memoire impossible
8 : Erreur : pas assez de pixels dans PIXMAP
9 : Erreur : fichier Pos.txt non ouvrable
10 : Erreur : ecriture dans Pos.txt impossible
11 : Erreur: fermeture du fichier Pos.txt impossible
*/



// Structure contenant les intervalles RGB des couleurs
struct range { 
    int Rmin, Rmax;
    int Gmin, Gmax;
    int Bmin, Bmax;
};

// Structure contenant la position et le score max des boules
struct donnees {
    int x;
    int y;
    int score;
};

// Structure contenant la veleur RGB des pixels
struct pixel {
    unsigned int R, G, B;
};




/** 
Conversion 

Description courte :
    Convertit une valeur de pixel au format hexadecimal (0xRRGGBB)
    en ses composantes RGB.

Description complete :
    Extrait les composantes Rouge, Vert et Bleu par shifting et masking de la valeur entiere Pix qui encode un pixel sous la forme 0x00RRGGBB.
    Les composantes sont ensuite stockees dans la structure pointee par RGB.

Entrees :
    Pix : entier contenant la valeur RGB
    *RGB : pointeur vers une structure pixel a remplir

Sorties :
    RGB->R : composante rouge
    RGB->G : composante verte
    RGB->B : composante bleue

Retour : 
    Aucun

*/
void conversion(unsigned int Pix, struct pixel *RGB) { // utilisation d'un pointeur car c'est une seule structure qu'on modifie
    RGB -> R = (Pix & 0x00FF0000) >> 16;
    RGB -> G = (Pix & 0x0000FF00) >> 8;
    RGB -> B = (Pix & 0x000000FF);
}





/**
verification_couleur

Dexcription courte :
    Vérifie si un pixel appartient à une plage de couleur donnée.

Description complete : 
    Utilise les composantes RGB donnees par conversion puis compare chaque composante aux bornes min/max definies dans la strucutre "couleur".

Entrees :
    Pix : valeur du pixel au format 0x00RRGGBB
    couleur : plage autorisee (min/max pour R, G et B)

Sorties :
    Aucune

Retour :
    1 si le pixel est dans la plage de couleur, 0 sinon

*/
int verification_couleur (unsigned int Pix, struct range couleur){
    struct pixel RGB = {0, 0, 0};
    conversion(Pix, &RGB); // la fonction conversion a rempli la struct locale pixel RGB avec les valeurs de R,G et B de la couleur du pixel en question

    return (RGB.R <= couleur.Rmax && RGB.R >= couleur.Rmin &&
            RGB.G <= couleur.Gmax && RGB.G >= couleur.Gmin &&
            RGB.B <= couleur.Bmax && RGB.B >= couleur.Bmin);
}





/**
score

Description courte :
    Calcule combien de pixels correspondent aux couleurs jaune, rouge et blanche dans une zone carree de l’image.

Description complete :
    Analyse un carre de taille BallDiameter × BallDiameter dont le coin superieur gauche est situé en (x, y).
    Pour chaque pixel de cette zone, la fonction verifie son appartenance à la plage RGB de chaque couleur et incremente
    les compteurs associes.

Entrees :
    Pix : tableau contenant tous les pixels de l’image
    JauneR : plage RGB de la boule jaune
    BlancR : plage RGB de la boule blanche
    RougeR : plage RGB de la boule rouge
    x, y : coordonnees du coin supérieur gauche de la zone analysee
    largeur : largeur de l’image en pixels
    BallDiameter : taille (en pixels) du carre à analyser

Sorties :
    *ScoreJaune : nombre de pixels detectes comme jaunes
    *ScoreRouge : nombre de pixels detectes comme rouges
    *ScoreBlanc : nombre de pixels detectes comme blancs

Retour :
    Aucun 
*/
void score(unsigned int *Pix, struct range JauneR, struct range BlancR, struct range RougeR, int x, int y, unsigned int largeur, int *ScoreJaune,int *ScoreRouge, int *ScoreBlanc, int BallDiameter) {

*ScoreJaune = 0;
*ScoreRouge = 0;
*ScoreBlanc = 0;

// Balayage de tout le carre
for (int i = y; i < y + BallDiameter; i++) {
    for (int j = x; j < x + BallDiameter; j++) {

        *ScoreJaune += verification_couleur(*(Pix + j + i*largeur), JauneR); 
        *ScoreRouge += verification_couleur(*(Pix + j + i*largeur), RougeR); 
        *ScoreBlanc += verification_couleur(*(Pix + j + i*largeur), BlancR);

    }
}
}





/**
ScoreMax

Description courte :
    Recherche la position et le score maximal de chaque boule dans l'image.

Description complete :
    Balaye la zone definie par les limites Lmin–Lmax et Cmin–Cmax. Pour chaque position possible du carre de taille BallDiameter,
    la fonction calcule les scores de couleurs via la fonction "score". Les meilleurs scores pour chaque couleur sont enregistres avec la position
    associee dans les structures JauneSP, RougeSP et BlancSP. Si aucune zone ne depasse le score minimal BallminScore, la boule est consideree comme 
    "non detectee" et ses coordonnees sont fixees a (-1, -1).

Entrees :
    Pix : tableau des pixels de l'image
    largeur : largeur de l'image en pixels
    JauneR : plage RGB pour la boule jaune
    BlancR : plage RGB pour la boule blanche
    RougeR : plage RGB pour la boule rouge
    Lmin, Lmax : limites verticales
    Cmin, Cmax : limites horizontales
    BallDiameter : taille du carre 
    JauneSP : pointeur vers la structure contenant les donnees jaune
    BlancSP : pointeur vers la structure contenant les donnees blanche
    RougeSP : pointeur vers la structure contenant les donnees rouge

Sorties :
    JauneSP->x, JauneSP->y, JauneSP->score
    BlancSP->x, BlancSP->y, BlancSP->score
    RougeSP->x, RougeSP->y, RougeSP->score

Retour :
    Aucun 
*/
void ScoreMax(unsigned int *Pix, unsigned int largeur, struct range JauneR, struct range BlancR, struct range RougeR, int Lmin, int Lmax, int Cmin, int Cmax, int BallDiameter, struct donnees *JauneSP, struct donnees *BlancSP, struct donnees *RougeSP) {

    int ScoreJaune, ScoreRouge, ScoreBlanc;

    // Balayage de la zone du billard
    for (int y = Lmin; y <= Lmax - BallDiameter; y++) {

        for (int x = Cmin; x <= Cmax - BallDiameter; x++) {

            // Calcul du score pour ce carre (x, y)
            score(Pix, JauneR, BlancR, RougeR, x, y, largeur, &ScoreJaune, &ScoreRouge, &ScoreBlanc, BallDiameter); 

            // Test des scores pour mise à jour du maximum
            if (ScoreJaune > JauneSP->score) {
                JauneSP->score = ScoreJaune;
                JauneSP->x = x;     
                JauneSP->y = y;
            }

            if (ScoreRouge > RougeSP->score) {
                RougeSP->score = ScoreRouge;
                RougeSP->x = x;
                RougeSP->y = y;
            }

            if (ScoreBlanc > BlancSP->score) {
                BlancSP->score = ScoreBlanc;
                BlancSP->x = x;
                BlancSP->y = y;
            }
        }
    }

    // Vérification des scores minimums
    if (JauneSP->score < BallminScore) {
        fprintf(stderr, "Warning: pas de boule jaune détectée\n");
        JauneSP->x = -1;
        JauneSP->y = -1;
        JauneSP->score = 0;
    }

    if (RougeSP->score < BallminScore) {
        fprintf(stderr, "Warning: pas de boule rouge détectée\n");
        RougeSP->x = -1;
        RougeSP->y = -1;
        RougeSP->score = 0;
    }

    if (BlancSP->score < BallminScore) {
        fprintf(stderr, "Warning: pas de boule blanche détectée\n");
        BlancSP->x = -1;
        BlancSP->y = -1;
        BlancSP->score = 0;
    }
}









int main(int argc, char *argv[]) {

    if (argc != 30) {// Nom du fichier + 29 parametres
        fprintf(stderr, "Erreur : nombre d'arguments incorrect\n");
        return 1; 
    }

    int Lmin, Lmax, Cmin, Cmax, BallDiameter; 

    
    struct range BleuR, JauneR, BlancR, RougeR; // Structures contenant les plages RGB
    struct donnees JauneSP = {-1, -1, 0}, BlancSP = {-1, -1, 0}, RougeSP = {-1, -1, 0}; // Initialisation des structures contenant les positions x, y des boules et leur score max

    // Recuperation des limites de la table dans la ligne de commande
    Lmin = atoi(argv[1]); 
    Lmax = atoi(argv[2]);
    Cmin = atoi(argv[3]);
    Cmax = atoi(argv[4]);

    // Recuperation des valeurs min/max des RGB
    RougeR.Rmin = atoi(argv[5]);
    RougeR.Rmax = atoi(argv[6]);
    RougeR.Gmin = atoi(argv[7]);
    RougeR.Gmax = atoi(argv[8]);
    RougeR.Bmin = atoi(argv[9]);
    RougeR.Bmax = atoi(argv[10]);

    
    JauneR.Rmin = atoi(argv[11]);
    JauneR.Rmax = atoi(argv[12]);
    JauneR.Gmin = atoi(argv[13]);
    JauneR.Gmax = atoi(argv[14]);
    JauneR.Bmin = atoi(argv[15]);
    JauneR.Bmax = atoi(argv[16]);

    BlancR.Rmin = atoi(argv[17]);
    BlancR.Rmax = atoi(argv[18]);
    BlancR.Gmin = atoi(argv[19]);
    BlancR.Gmax = atoi(argv[20]);
    BlancR.Bmin = atoi(argv[21]);
    BlancR.Bmax = atoi(argv[22]);

    BleuR.Rmin = atoi(argv[23]);
    BleuR.Rmax = atoi(argv[24]);
    BleuR.Gmin = atoi(argv[25]);
    BleuR.Gmax = atoi(argv[26]);
    BleuR.Bmin = atoi(argv[27]);
    BleuR.Bmax = atoi(argv[28]);

    // Recuperation du diametre des boules
    BallDiameter = atoi(argv[29]);



    // Verification de la taille des boules
    if (BallDiameter < 10 || BallDiameter > 15) { 
        fprintf(stderr, "Erreur: diametre incorrect\n");
        return 2;
    } 



    FILE* PIXMAP;
    
    // Ouverture de Pixmap.bin en lecture binaire 
    PIXMAP = fopen("pixmap.bin", "rb");


    // Verifie si le fichier est ouvrable
    if (PIXMAP == NULL) {
        fprintf(stderr, "Erreur: fichier non ouvrable\n"); 
        return 3;
    }



    unsigned int largeur, hauteur;

    // Lis la largeur depuis PIXMAP, puis décale le curseur d'un unsigned int
    if (fread(&largeur, sizeof(unsigned int), 1, PIXMAP) != 1) { // Verifie qu'il y a bien une largeur

            fprintf(stderr, "Erreur: largeur manquante\n"); 
            return 4; 
    }

    // Lis la hauteur depuis PIXMAP
    if (fread(&hauteur, sizeof(unsigned int), 1, PIXMAP) != 1) { // Verifie qu'il y a bien une hauteur

            fprintf(stderr, "Erreur: hauteur manquante\n"); 
            return 5; 
    }

    // Verifie les dimenssions
    if (largeur < 100 || largeur > 1000 || hauteur < 100 || hauteur > 1000) {
        fprintf(stderr, "Erreur: dimensions hors bornes\n"); 
        return 6;
    }
    




    // Allocation de l'espace memoire pour Pix
    unsigned int *Pix = malloc(hauteur*largeur*sizeof(unsigned int));

    if (Pix == NULL) { // Verifie si le pointeur est valide
        fprintf(stderr, "Erreur: attribution de memoire impossible\n"); 
        return 7;
    }

    if (fread(Pix, sizeof(unsigned int), largeur*hauteur, PIXMAP) < largeur*hauteur) { // Verifie qu'il n'y a pas moins de pixel que attendu
        fprintf(stderr, "Erreur: pas assez de pixels dans PIXMAP\n"); 
        return 8; 
    }


    unsigned int a = 0;

    if (fread(&a, sizeof(unsigned int), 1, PIXMAP)) { // Regarde s'il y a au moins un element de trop
        fprintf(stderr, "Warning: trop de pixels\n");
    }
    



    ScoreMax(Pix, largeur, JauneR, BlancR, RougeR, Lmin, Lmax, Cmin, Cmax, BallDiameter, &JauneSP, &BlancSP, &RougeSP);
    FILE *Pos;

    // Ouverture du fichier Pos.txt en mode ecriture
    Pos = fopen("pos.txt", "w");

    // Verifie si le fichier est ouvrable
    if (Pos == NULL) {
        fprintf(stderr, "Erreur: fichier non ouvrable\n"); 
        return 9;
    }

    // Verifie si l'ecriture dans Pos est possible et ecrit dans Pos.txt les valeurs qu'il faut retourner 
    if(fprintf(Pos, "Red: %d, %d, %d\nYellow: %d, %d, %d\nWhite: %d, %d, %d\n", RougeSP.x, RougeSP.y, RougeSP.score, JauneSP.x, JauneSP.y, JauneSP.score, BlancSP.x, BlancSP.y, BlancSP.score) < 0) {
        fprintf(stderr, "Erreur: ecriture dans Pos impossible\n"); 
        return 10;
    }

    // verifie si la fermeture du fichier Pos.txt se fait sans probleme
    if(fclose(Pos)) { 
        fprintf(stderr, "Erreur: fermeture du fichier Pos.txt impossible\n");
        return 11;
    }


    free(Pix); 
    fclose(PIXMAP); 


return 0;
}



