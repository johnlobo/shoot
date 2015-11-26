#include <cpctelera.h>

cpct_keyID wait_for_keypress() {
  // Recorreremos el vector de teclas desde el final hacia el principio,
  // para poder hacer que el bucle acabe en 0 (así el compilador podrá optimizarlo)
  u8 i = 10, *keys = cpct_keyboardStatusBuffer + 9;
  u16 keypressed;

  // Esperamos hasta que se pulse una tecla
  do { cpct_scanKeyboard(); } while ( ! cpct_isAnyKeyPressed() );

  // Detectamos cuál tecla ha sido pulsada
  do {
    // Si en este grupo de 8 teclas hay una pulsada, alguno de los bits estará a 0
    // En caso contrario, todos estarán a 1, y un XOR con 0xFF dará 0 (false) como resultado
    keypressed = *keys ^ 0xFF;
    if (keypressed)
      return (keypressed << 8) + (i - 1);  // Formato cpct_keyID: 8 primeros bits = máscara de tecla, 8 siguientes fila del teclado (0-9)
    keys--;
  } while (--i);
  return 0;
}

void wait_clean_key(cpct_keyID key) {
  do
    cpct_scanKeyboard_f();
  while ( ! cpct_isKeyPressed(key) );
}

void pause(u8 cycles){
  u8 i;
  for (i=0;i<cycles;i++){
    __asm
      halt
    __endasm;
  }
}