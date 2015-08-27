#include <cpctelera.h>
#include "../entities/entities.h"

//////////////////////////////////////////////////////////////////////////////////////////
// Shift all pixels of a sprite to the right
//
void shiftSpritePixelsRight(u8* sprite, u8 size) {
   u8 prev_rightpixel,
      rightpixel;       // Values of the right-pixel of a byte, and the right-pixel of the previous byte

   // Shift all bits to the right, to move sprite 1 pixel to the right    
   prev_rightpixel = 0;
   do {
      // Save the right pixel value of this byte (even bits)
      rightpixel      = *sprite & 0b01010101;
      // Mix the right pixel of the previous byte (that now is left pixel) with 
      // the left pixel of the present byte (that now should be right pixel)
      *sprite         = (prev_rightpixel << 1) | ((*sprite & 0b10101010) >> 1);
      // Saved right pixel is stored as the previous byte right pixel, for next iteration
      prev_rightpixel = rightpixel;
      ++sprite;
   } while(--size);
}

/*
//////////////////////////////////////////////////////////////////////////////////////////
// Shift all pixels of a sprite to the left
//
void shiftSpritePixelsLeft(u8* sprite, u8 size) {
   u8* next_byte = sprite + 1; // Maintain a pointer to the next byte of the sprite 
   
   // Shift all bits to the left, to move sprite 1 pixel to the left
   // Assuming leftmost column is free (zeroed)
   // Iterate up to the next-to-last byte, as the last byte is a special case
   while (--size) {
      // Each byte is the mix of its right pixel (even bits) shifted to the left
      // to become left pixel, and the left pixel of the next byte shifted to the right,
      // to become right pixel.
      *sprite = ((*sprite & 0b01010101) << 1) | ((*(next_byte) & 0b10101010) >> 1);
      ++sprite; ++next_byte;
   }
   // Last byte has its right pixel shifted to the left to become left pixel, and
   // zeros added as new right pixel
   *sprite = (*sprite & 0b01010101) << 1;
}

//////////////////////////////////////////////////////////////////////////////////////////
// Shift an sprite to draw it at an even or odd location
//
void shiftSprite(TEntity *e) {
   // Depending on its present status, shifting will be to the left or to the right
   // We always assume that the original sprite had its rightmost pixel column free (zeroed)
   if (e->shift == ON_EVEN_PIXEL) {     
      // Shift sprite right & update shifting status
      shiftSpritePixelsRight(e->sprite, e->w * e->h);
      e->shift = ON_ODD_PIXEL;
   } else {
      // Shift sprite left & update shifting status
      shiftSpritePixelsLeft(e->sprite, e->w * e->h);
      e->shift = ON_EVEN_PIXEL;
   }
}
*/