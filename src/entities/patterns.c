#include "entities.h"

const TPatternSet pattern01 = {
    .num_CMDs = 7, // 0 movement
    {

        {
            .CMD = TRANSPORT_TO,
            .v = 0,
            .x = -5,
            .y = 100,
            .angle = 0,
            .frames = 0
        },
        {
            .CMD = TRANSLATE_TO,
            .v = 5,
            .x = 40,
            .y = 100,
            .angle = 0,
            .frames = 0
        },
        {
            .CMD = ROTATE,
            .v = 4,
            .x = 0,
            .y = 0,
            .angle = 10,
            .frames = 35
        },
        {
            .CMD = TRANSLATE,
            .v = 5,
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
            .angle = 10,
            .frames = 35
        },
        {
            .CMD = TRANSLATE_TO,
            .v = 5,
            .x = 165,
            .y = 100,
            .angle = 0,
            .frames = 0
        },
        {
            .CMD = SLEEP,
            .v = 0,
            .x = 0,
            .y = 0,
            .angle = 0,
            .frames = 30
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
            .x = 10,
            .y = 10,
            .angle = 0,
            .frames = 0
        },
        {
            .CMD = TRANSLATE_TO,
            .v = 4,
            .x = 10,
            .y = 190,
            .angle = 0,
            .frames = 0
        },
        {
            .CMD = TRANSLATE_TO,
            .v = 4,
            .x = 150,
            .y = 190,
            .angle = 0,
            .frames = 0
        },

        {
            .CMD = TRANSLATE_TO,
            .v = 4,
            .x = 150,
            .y = 10,
            .angle = 0,
            .frames = 0
        }
    }
};