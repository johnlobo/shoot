#include "entities.h"

const TPatternSet pattern01 = {
    .num_CMDs = 5, // 0 movement
    {

        {
            .CMD = TRANSPORT_TO,
            .v = 0,
            .x = 165,
            .y = 0,
            .angle = 0,
            .frames = 0
        },
        {
            .CMD = TRANSLATE,
            .v = 5,
            .x = 0,
            .y = 0,
            .angle = 210,
            .frames = 20
        },

        
        {
            .CMD = ROTATE,
            .v = 6,
            .x = 0,
            .y = 0,
            .angle = -19,
            .frames = 18
        },
        /*{
            .CMD = TRANSLATE,
            .v = 5,
            .x = 0,
            .y = 0,
            .angle = 210,
            .frames = 10
        },
        {
            .CMD = ROTATE,
            .v = 5,
            .x = 0,
            .y = 0,
            .angle = -19,
            .frames = 18
        },*/
        {
            .CMD = TRANSLATE,
            .v = 5,
            .x = 0,
            .y = 0,
            .angle = 210,
            .frames = 16
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