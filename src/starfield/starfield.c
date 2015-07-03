#include <stdlib.h>
#include <cpctelera.h>
#include "starfield.h"
#include "../random/random.h"
#include "../sprites/sprites.h"

TIPO_ESTRELLA aStars[STARS_NUM];
u8 pixelColors[3];

//******************************************************************************
// Función GetMode0PixelColorByte(unsigned char nColor, unsigned char nPixel)
//
//******************************************************************************
u8 get_mode0_pixel_color_byte(u8 nColor, u8 nPixel)
{
   unsigned char nByte = 0;

   if(nPixel == 0)
   {
      nByte &= 85;

      if(nColor & 1)
         nByte |= 128;

      if(nColor & 2)
         nByte |= 8;

      if(nColor & 4)
         nByte |= 32;

      if(nColor & 8)
         nByte |= 2;
   }
   else
   {
      nByte &= 170;

      if(nColor & 1)
         nByte |= 64;

      if(nColor & 2)
         nByte |= 4;

      if(nColor & 4)
         nByte |= 16;

      if(nColor & 8)
         nByte |= 1;
   }

   return nByte;
}

//******************************************************************************
// Función inicializarEstrellas()
//
//******************************************************************************
void init_stars(){
	u8 randomNumber=0;
	u8 nStar;
	//Inicializar estrellas
	for(nStar = 0; nStar < STARS_NUM; nStar++)
	{
		aStars[nStar].nX = rand() % 160;
		aStars[nStar].nY = rand() % 199;
		aStars[nStar].nStarType = rand() % 3;
	}
   pixelColors[0]=1;
   pixelColors[1]=2;
   pixelColors[2]=3;
}
//******************************************************************************
// Función void pintarEstrellas()
//
//******************************************************************************
void draw_stars(u8* screen){
   u8 nStar;
   TIPO_ESTRELLA *pStar;

   for(nStar = 0; nStar < STARS_NUM; nStar++)
   {
      pStar = &aStars[nStar];
      //paint star
      pStar->pCurrentAddress = (u8 *) cpct_getScreenPtr(screen, pStar->nX, pStar->nY);
      *pStar->pCurrentAddress ^= get_mode0_pixel_color_byte(pStar->nStarType + 1, pStar->nX % 2);
   }
}
//******************************************************************************-
// Función void moverEstrellas()
//
//******************************************************************************
void update_stars(){
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
      pStar->nY += 1;
      break;
      case 2: //fast star
      pStar->nY += 2;
      break;
   }

   if(pStar->nY >= 198)
   {
      pStar->nY = 0;
      pStar->nX = rand() % 160;
      pStar->nStarType = rand() % 3;
   }
}
}