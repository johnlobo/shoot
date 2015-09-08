#include "entities.h"

const TPatternSet pattern01 = {
    .num_CMDs = 4, // 0 movement
    {

        {
            .CMD = TRANSLATE_TO,
            .v = 2,
            .x = 1,
            .y = 180,
            .angle = 0,
            .frames = 0
        },
        {
            .CMD = TRANSLATE,
            .v = 2,
            .x = 0,
            .y = 0,
            .angle = 0,
            .frames = 15
        },
        {
            .CMD = ROTATE,
            .v = 4,
            .x = 0,
            .y = 0,
            .angle = 12,
            .frames = 15
        },
        {
            .CMD = ROTATE,
            .v = 4,
            .x = 0,
            .y = 0,
            .angle = -15,
            .frames = 18
        }

    }
};

const TPatternSet pattern02 = {
    .num_CMDs = 3, // 0 movement
    {

        {
            .CMD = TRANSLATE_TO,
            .v = 3,
            .x = 75,
            .y = 5,
            .angle = 0,
            .frames = 0
        },
        {
            .CMD = TRANSLATE_TO,
            .v = 3,
            .x = 40,
            .y = 100,
            .angle = 0,
            .frames = 0
        },
        {
            .CMD = TRANSLATE_TO,
            .v = 3,
            .x = 75,
            .y = 190,
            .angle = 0,
            .frames = 0
        }
    }
};

