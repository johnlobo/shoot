#include "entities.h"

const TPatternSet pattern01_left = {
    .num_CMDs = 5, // 0 movement
    .repeat = 1,
    {
        {
            .CMD = TRANSLATE,
            .v = 5,
            .x = 0,
            .y = 0,
            .angle = 270,
            .frames = 8
        },
        {
            .CMD = ROTATE,
            .v = 6,
            .x = 0,
            .y = 0,
            .angle = 19,
            .frames = 18
        },
        {
            .CMD = TRANSLATE,
            .v = 5,
            .x = 0,
            .y = 0,
            .angle = 225,
            .frames = 12
        },
        {
            .CMD = SLEEP,
            .v = 0,
            .x = 0,
            .y = 0,
            .angle = 0,
            .frames = 40
        },
        {
            .CMD = TRANSPORT_TO,
            .v = 0,
            .x = 75,
            .y = -5,
            .angle = 0,
            .frames = 0
        }
    }
};

const TPatternSet pattern01_right = {
    .num_CMDs = 5, // 0 movement
    .repeat = 1,
    {
        {
            .CMD = TRANSLATE,
            .v = 5,
            .x = 0,
            .y = 0,
            .angle = 270,
            .frames = 8
        },
        {
            .CMD = ROTATE,
            .v = 6,
            .x = 0,
            .y = 0,
            .angle = -19,
            .frames = 18
        },
        {
            .CMD = TRANSLATE,
            .v = 5,
            .x = 0,
            .y = 0,
            .angle = 315,
            .frames = 12
        },
        {
            .CMD = SLEEP,
            .v = 0,
            .x = 0,
            .y = 0,
            .angle = 0,
            .frames = 40
        },
        {
            .CMD = TRANSPORT_TO,
            .v = 0,
            .x = 75,
            .y = -5,
            .angle = 0,
            .frames = 0
        }
    }
};

const TPatternSet pattern02 = {
    .num_CMDs = 5, // 0 movement
    .repeat = 0,
    {
        {
            .CMD = TRANSLATE,
            .v = 5,
            .x = 0,
            .y = 0,
            .angle = 150,
            .frames = 9
        },
        {
            .CMD = ROTATE,
            .v = 6,
            .x = 0,
            .y = 0,
            .angle = -19,
            .frames = 18
        },
        {
            .CMD = TRANSLATE,
            .v = 5,
            .x = 0,
            .y = 0,
            .angle = 150,
            .frames = 5
        },
        {
            .CMD = TRANSLATE_HOME,
            .v = 4,
            .x = 0,
            .y = 0,
            .angle = 0,
            .frames = 0
        },
        {
            .CMD = ROTATE_TO,
            .v = 0,
            .x = 0,
            .y = 0,
            .angle = 270,
            .frames = 0
        }
    }
};


const TPatternSet pattern03 = {
    .num_CMDs = 4, // 0 movement
    .repeat = 1,
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

const TPatternSet pattern04 = {
    .num_CMDs = 5, // 0 movement
    .repeat = 0,
    {
        {
            .CMD = TRANSLATE,
            .v = 5,
            .x = 0,
            .y = 0,
            .angle = 30,
            .frames = 9
        },
        {
            .CMD = ROTATE,
            .v = 6,
            .x = 0,
            .y = 0,
            .angle = 19,
            .frames = 18
        },
        {
            .CMD = TRANSLATE,
            .v = 5,
            .x = 0,
            .y = 0,
            .angle = 30,
            .frames = 5
        },
        {
            .CMD = TRANSLATE_HOME,
            .v = 4,
            .x = 0,
            .y = 0,
            .angle = 0,
            .frames = 0
        },
        {
            .CMD = ROTATE_TO,
            .v = 0,
            .x = 0,
            .y = 0,
            .angle = 270,
            .frames = 0
        }
    }
};

const TPatternSet attack01 = {
    .num_CMDs = 6, // 0 movement
    .repeat = 0,
    {
        {
            .CMD = ROTATE,
            .v = 3,
            .x = 0,
            .y = 0,
            .angle = 19,
            .frames = 18
        },
        {
            .CMD = TRANSLATE,
            .v = 5,
            .x = 0,
            .y = 0,
            .angle = 315,
            .frames = 20
        },
        {
            .CMD = TRANSPORT_TO,
            .v = 0,
            .x = 80,
            .y = -10,
            .angle = 270,
            .frames = 0
        },

        {
            .CMD = TRANSLATE_HOME,
            .v = 2,
            .x = 0,
            .y = 0,
            .angle = 0,
            .frames = 0
        },
        {
            .CMD = ROTATE_TO,
            .v = 0,
            .x = 0,
            .y = 0,
            .angle = 270,
            .frames = 0
        },
        {
            .CMD = SLEEP,
            .v = 0,
            .x = 0,
            .y = 0,
            .angle = 0,
            .frames = 20
        }
    }
};