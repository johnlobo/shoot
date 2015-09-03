#include "entities.h"

const TPatternSet pattern01 = {
    .num_CMDs = 4, // 0 movement
    {

        {
            .CMD = TRANSLATE_TO,
            .v = 1,
            .x = 40,
            .y = 60,
            .theta = 0,
            .max =  0,
            .frames = 0
        },
        {
            .CMD = TRANSLATE_TO,
            .v = 3,
            .x = 70,
            .y = 4,
            .theta = 0,
            .max = 0,
            .frames = 0
        },

        {
            .CMD = TRANSLATE_TO,
            .v = 4,
            .x = 70,
            .y = 130,
            .theta = 0,
            .max = 0,
            .frames = 0
        },

        {
            .CMD = TRANSLATE_TO,
            .v = 2,
            .x = 4,
            .y = 4,
            .theta = 0,
            .max = 0,
            .frames = 0
        },
        {
                .CMD = TRANSLATE,
                .v = 10,
                .x = 0,
                .y = 0,
                .theta = 315 ,
                .max = ,
                .frames = 10
            }/*,

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

