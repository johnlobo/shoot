#include "entities.h"

const TPatternSet pattern01 = {
    .num_CMDs = 4, // 0 movement
    {

        {
            .CMD = TRANSLATE_TO,
            .v = 3,
            .x = 1,
            .y = 180,
            .angle = 0,
            .frames = 0
        },
        {
            .CMD = TRANSLATE,
            .v = 3,
            .x = 0,
            .y = 0,
            .angle = 0,
            .frames = 25
        },
        {
            .CMD = ROTATE,
            .v = 5,
            .x = 0,
            .y = 0,
            .angle = 15,
            .frames = 10
        },
        {
            .CMD = ROTATE,
            .v = 5,
            .x = 0,
            .y = 0,
            .angle = -15,
            .frames = 10
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

const TPatternSet pattern03 = {
    .num_CMDs = 3, // 0 movement
    {

        {
            .CMD = TRANSLATE,
            .v = 5,
            .x = 0,
            .y = 0,
            .angle = 315,
            .frames = 8
        },
        {
            .CMD = TRANSLATE_TO,
            .v = 10,
            .x = 0,
            .y = 200,
            .angle = 0,
            .frames = 0
        },
        {
            .CMD = TRANSLATE_HOME,
            .v = 10,
            .x = 0,
            .y = 0,
            .angle = 0,
            .frames = 0
        }
    }
};