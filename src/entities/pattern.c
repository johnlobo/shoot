#include "entities.h"


const TPatternSet pattern01 = {
	{
		.num_CMDs=6,   // 0 movement
		{{
        .CMD = ENTER_LEFT,
        .v = 10.0,
        .x = -40
    },

    {
        .CMD = TRANSLATE_TO,
        .v = 10.0,
        .x = -200.0
    },

    {
        .CMD = ROTATE,
        .v = 10.0,
        .theta = -Math.PI / 20,
        .max = -Math.PI / 2 
    },

    {
        .CMD = TRANSLATE,
        .v = 10.0,
        .frames = 10.0
    },

    {
        .CMD = ROTATE,
        .v = 10.0,
        .theta = Math.PI / 20,
        .max = Math.PI / 2 
    },

    {
        .CMD = ROTATE,
        .v = 10.0,
        .theta = -Math.PI / 20,
        .max = -Math.PI / 2 
    },

    {
        .CMD = TRANSLATE,
        .v = 10.0,
        .frames = 20.0
    },

    {
        .CMD = ROTATE,
        .v = 10.0,
        .theta = Math.PI / 20,
        .max = Math.PI / 2 
    },

    {
        .CMD = ROTATE,
        .v = 10.0,
        .theta = -Math.PI / 20,
        .max = (-Math.PI * 2)
    },

    {
        .CMD = EXIT_RIGHT,
        .v = 10.0,
        .x = 40
    }
};

