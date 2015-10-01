#include "entities.h"

const TPatternSet pattern01 = {
    .num_CMDs = 3, // 0 movement
    {

        {
            .CMD = TRANSLATE_TO,
            .v = 3,
            .x = 100,
            .y = 140,
            .angle = 0,
            .frames = 0
        },
/*        {
            .CMD = TRANSLATE,
            .v = 3,
            .x = 0,
            .y = 0,
            .angle = 0,
            .frames = 5
        },
*/        {
            .CMD = ROTATE,
            .v = 4,
            .x = 0,
            .y = 0,
            .angle = 20,
            .frames = 5
        },
        {
            .CMD = ROTATE,
            .v = 4,
            .x = 0,
            .y = 0,
            .angle = -20,
            .frames = 5
        }

    }
};

const TPatternSet pattern02 = {
    .num_CMDs = 3, // 0 movement
    {

        {
            .CMD = TRANSLATE_TO,
            .v = 3,
            .x = 150,
            .y = 5,
            .angle = 0,
            .frames = 0
        },
        {
            .CMD = TRANSLATE_TO,
            .v = 3,
            .x = 80,
            .y = 100,
            .angle = 0,
            .frames = 0
        },
        {
            .CMD = TRANSLATE_TO,
            .v = 3,
            .x = 150,
            .y = 190,
            .angle = 0,
            .frames = 0
        }
    }
};

const TPatternSet pattern03 = {
    .num_CMDs = 4, // 0 movement
    {

        {
            .CMD = TRANSLATE_TO,
            .v = 4,
            .x = 40,
            .y = 40,
            .angle = 0,
            .frames = 0
        },
        {
            .CMD = TRANSLATE_TO,
            .v = 4,
            .x = 40,
            .y = 100,
            .angle = 0,
            .frames = 0
        },
        {
            .CMD = TRANSLATE_TO,
            .v = 4,
            .x = 120,
            .y = 100,
            .angle = 0,
            .frames = 0
        },
        {
            .CMD = TRANSLATE_TO,
            .v = 4,
            .x = 120,
            .y = 40,
            .angle = 0,
            .frames = 0
        }
    }
};