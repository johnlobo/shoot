#include "entities.h"

const TPatternSet pattern01 = {
    .num_CMDs = 5, // 0 movement
    {

        {
            .CMD = TRANSLATE_TO,
            .v = 2,
            .x = 40,
            .y = 100,
            .angle = 0,
            .frames = 0
        },
        {
            .CMD = ROTATE,
            .v = 3,
            .x = 0,
            .y = 0,
            .angle = 10,
            .frames = 36
        },
        {
            .CMD = TRANSLATE_TO,
            .v = 3,
            .x = 70,
            .y = 80,
            .angle = 0,
            .frames = 0
        },
        {
            .CMD = TRANSLATE_TO,
            .v = 3,
            .x = 20,
            .y = 50,
            .angle = 0,
            .frames = 0
        },
        {
            .CMD = TRANSLATE,
            .v = 2,
            .x = 0,
            .y = 0,
            .angle = 270,
            .frames = 10
        },
    }
};

