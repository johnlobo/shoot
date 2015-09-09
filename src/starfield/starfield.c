#include <stdlib.h>
#include <cpctelera.h>
#include "starfield.h"
#include "../sprites/sprites.h"
#include "../util/util.h"

TIPO_ESTRELLA aStars[STARS_NUM];
long last_moved_stars;
const u8 star_colors[3] = {STAR_COLOR1, STAR_COLOR2, STAR_COLOR3};

//******************************************************************************
// Función get_screen_byte(u8 nColor, u8 nPixel)
//
//******************************************************************************

u8 get_screen_byte(u8 nColor, u8 nPixel){
   if (nPixel)
      return cpct_px2byteM0(0,star_colors[nColor]);
   else
      return cpct_px2byteM0(star_colors[nColor],0);
}

//******************************************************************************
// Función inicializarEstrellas()
//
//******************************************************************************
long get_last_moved_starfield(){
   return last_moved_stars;
}

//******************************************************************************
// Función inicializarEstrellas()
//
//******************************************************************************
void init_starfield(){
	u8 randomNumber=0;
	u8 nStar;
	//Inicializar estrellas
	for(nStar = 0; nStar < STARS_NUM; nStar++)
	{
		aStars[nStar].nX = cpct_getRandomUniform_u8_f(0) % 160;
		aStars[nStar].nY = cpct_getRandomUniform_u8_f(0) % 199;
		aStars[nStar].nStarType = cpct_getRandomUniform_u8_f(0) % 3;
	}
   last_moved_stars = 0;
}
//******************************************************************************
// Función void pintarEstrellas()
//
//******************************************************************************
void draw_starfield(u8* screen){
   u8 nStar;
   TIPO_ESTRELLA *pStar;

   for(nStar = 0; nStar < STARS_NUM; nStar++)
   {
      pStar = &aStars[nStar];
      //paint star
      pStar->pCurrentAddress = (u8 *) cpct_getScreenPtr(screen, pStar->nX/2, pStar->nY);
      *pStar->pCurrentAddress = get_screen_byte(pStar->nStarType, pStar->nX % 2);

   }
   last_moved_stars = get_time(); 
}
//******************************************************************************-
// Función void moverEstrellas()
//
//******************************************************************************
void update_starfield(){
   u8 nStar;
   TIPO_ESTRELLA *pStar = NULL;

   // Pintar Estrellas
   for(nStar = 0; nStar < STARS_NUM; nStar++)
   {
      pStar = &aStars[nStar];
      //move star
      switch(pStar->nStarType)
      {
      case 0: //slow star
      pStar->nY += 1;
      break;
      case 1: //medium star
      pStar->nY += 2;
      break;
      case 2: //fast star
      pStar->nY += 4;
      break;
   }

   if(pStar->nY >= 198)
   {
      pStar->nY = 0;
      pStar->nX = cpct_getRandomUniform_u8_f(0) % 160;
      pStar->nStarType = cpct_getRandomUniform_u8_f(0) % 3;
   }
}
}