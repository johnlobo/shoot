#include "entities.h"

const TPatternSet pattern01 = {
		.num_CMDs=6,   // 0 movement
		{

            {
                .CMD = TRANSLATE_TO,
                .v = 10,
                .x = 20,
                .y = 100,
                .theta = 0.0,
                .max = 0.0, 
                .frames = 0
            },

            {
                .CMD = ROTATE,
                .v = 10,
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
            }

        }
    };

