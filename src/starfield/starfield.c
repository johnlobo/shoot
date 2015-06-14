#include <stdlib.h>
#include <cpctelera.h>
#include "starfield.h"
#include "../random/random.h"
#include "../sprites/sprites.h"

TIPO_ESTRELLA aStars[STARS_NUM];

//******************************************************************************
// Función pixelEstrella()
//
//******************************************************************************
u8 pixelEstrella(u8 nPixel){
   unsigned char nByte = 0;
   
   if(nPixel == 0)
   {
      nByte = 32;
   }
   else{
      nByte = 16;
   }
   
   return nByte;
}
//******************************************************************************
// Función GetMode0PixelColorByte(unsigned char nColor, unsigned char nPixel)
//
//******************************************************************************
u8 GetMode0PixelColorByte(u8 nColor, u8 nPixel)
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
void inicializarEstrellas(){
	u8 randomNumber=0;
	u8 nStar;
	//Inicializar estrellas
	for(nStar = 0; nStar < STARS_NUM; nStar++)
	{
		//cpc_random((u8*)randomNumber);
		aStars[nStar].nX = rand() % 160;
		//cpc_random((u8*)randomNumber);
		aStars[nStar].nY = (rand() % 184)+16;
		//cpc_random((u8*)randomNumber);
		aStars[nStar].nStarType = rand() % 3;
		//aStars[nStar].pLineAddress = (int *) direccionLinea[aStars[nStar].nY];
		//aStars[nStar].pLineAddress = (int *) getScreenAddress(0,aStars[nStar].nY);
		aStars[nStar].columnOffset = aStars[nStar].nY/2;
		//aStars[nStar].pCurrentAddress = aStars[nStar].pLineAddress+aStars[nStar].columnOffset;
	}
}
//******************************************************************************
// Función void borrarEstrellas()
//
//******************************************************************************
void borrarEstrellas(){
	u8 nStar;
	TIPO_ESTRELLA *pStar;

	for(nStar = 0; nStar < STARS_NUM; nStar++)
	{
		pStar = &aStars[nStar];
		//delete star
		//		if (*pStar->pCurrentAddress==GetMode0PixelColorByte(pStar->nStarType + 1, pStar->nX % 2))
		//			*pStar->pCurrentAddress = 0;
		*pStar->pCurrentAddress ^= GetMode0PixelColorByte(pStar->nStarType + 1, pStar->nX % 2);
		//*pStar->pCurrentAddress ^= pixelEstrella(pStar->nX % 2);
	}
}
//******************************************************************************
// Función void pintarEstrellas()
//
//******************************************************************************
void pintarEstrellas(u8* screen){
   u8 nStar;
   TIPO_ESTRELLA *pStar;

   for(nStar = 0; nStar < STARS_NUM; nStar++)
   {
      pStar = &aStars[nStar];
      //paint star
      //pStar->pLineAddress = direccionLinea[pStar->nY];
      //pStar->pCurrentAddress = (int *) direccionLinea[pStar->nY] + pStar->columnOffset;
      pStar->pCurrentAddress = (u8 *) cpct_getScreenPtr(screen, pStar->nX, pStar->nY);
      //    if (*pStar->pCurrentAddress==0)
      *pStar->pCurrentAddress ^= GetMode0PixelColorByte(pStar->nStarType + 1, pStar->nX % 2);
      //*pStar->pCurrentAddress ^= pixelEstrella(pStar->nX % 2);
      //pscreen = cpct_getScreenPtr(screen, user.x, user.y);
      //cpct_drawSprite(bullet01,(u8 *) pStar->pCurrentAddress,0x02,0x07);
   }
}
//******************************************************************************-
// Función void moverEstrellas()
//
//******************************************************************************
void moverEstrellas(){
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
         pStar->nY += 3;
         break;
      case 2: //fast star
         pStar->nY += 6;
         break;
      }
      
      if(pStar->nY >= 200)
      {
         pStar->nY = 16;
         pStar->nX = rand() % 160;
         pStar->nStarType = rand() % 3;
      }
   }
}