#include "entities.h"

const TPatternSet pattern01 = {
		.num_CMDs=1,   // 0 movement
		{

            {
                .CMD = TRANSLATE_TO,
                .v = 1*SCALE_FACTOR,
                .x = 20*SCALE_FACTOR,
                .y = 100*SCALE_FACTOR,
                .theta = 0.0,
                .max = 0.0, 
                .frames = 0
            }  /*,

            {
                .CMD = ROTATE,
                .v = 1*SCALE_FACTOR,
                .x = 0,
                .y = 0,
                .theta = - PI / 20,
                .max = - PI / 2,
                .frames = 0 
            },

            {
                .CMD = TRANSLATE,
                .v = 10,
                .x = 0,
                .y = 0,
                .theta = 0.0,
                .max = 0.0,
                .frames = 10
            },

            {
                .CMD = ROTATE,
                .v = 10,
                .x = 0,
                .y = 0,
                .theta = PI / 20,
                .max = PI / 2,
                .frames = 0
            },

            {
                .CMD = ROTATE,
                .v = 10,
                .x = 0,
                .y = 0,
                .theta = -PI / 20,
                .max = -PI/ 2,
                .frames = 0
            },

            {
                .CMD = TRANSLATE,
                .v = 10,
                .x = 0,
                .y = 0,
                .theta = 0.0,
                .max = 0.0,
                .frames = 20
            },

            {
                .CMD = ROTATE,
                .v = 10,
                .x = 0,
                .y = 0,
                .theta = PI / 20,
                .max = PI / 2,
                .frames = 0
            },

            {
                .CMD = ROTATE,
                .v = 10,
                .x = 0,
                .y = 0,
                .theta = PI / 20,
                .max = (PI * 2),
                .frames = 0
            },

            {
                .CMD = TRANSLATE_HOME,
                .v = 10,
                .x = 0,
                .y = 0,
                .theta = 0.0,
                .max = 0.0,
                .frames = 0
            }*/

        }
    };

