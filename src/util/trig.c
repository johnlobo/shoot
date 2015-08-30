#include <cpctelera.h>
#include "util.h"

const i16 sine_table[91]={
     0,4,9,13,18,22,27,31,36,
     40,44,49,53,58,62,66,71,75,
     79,83,88,92,96,100,104,108,112,
     116,120,124,128,132,136,139,143,147,
     150,154,158,161,165,168,171,175,178,
     181,184,187,190,193,196,199,202,204,
     207,210,212,215,217,219,222,224,226,
     228,230,232,234,236,237,239,241,242,
     243,245,246,247,248,249,250,251,252,
     253,254,254,255,255,255,256,256,256,256
     };

i16 sine(i16 angle){
     if (angle<64){
          return sine_table[angle];
     } else if (angle<128){
          return sine_table[128-angle];
     } else if (angle<192){
          return -sine_table[angle-128];
     } else {
          return -sine_table[255-angle];
     }
}

i16 cosine(i16 angle){
     if (angle<=64)
          return (sine(64-angle));
     else
          return(-sine(angle-64));
}