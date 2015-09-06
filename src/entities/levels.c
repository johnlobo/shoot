#include <stdio.h>
#include "entities.h"
#include "../util/util.h"

u8 active_level, level_step, level_end = 0;

void start_level(u8 level) {
	u8 aux_txt[60];

	active_level = level;
	level_step = 0;
	level_end = 0;
	sprintf(aux_txt, "LEVEL;%d", active_level);
	create_message(31, 96, 0, 10, aux_txt);
	create_message(31, 96, 10, 10, "SHOOT");
}

void update_level() {
	static long level_timer = 0;

	switch (active_level) {

	case 1:

		switch (level_step) {

		case 0:
			level_timer = get_time();
			level_step++;
			break;
		case 1:
			if ((get_time() - level_timer) > 600) {
				level_step++;
			}
			break;
		case 2:
			create_enemy_group(0, 92, 1, 5);
			level_step++;
			break;
		case 3:
			level_timer = get_time();
			level_step++;
			break;
		case 4:
			if ((get_time() - level_timer) > 300) {
				level_step++;
			}
			break;
		case 5:
			if ((!get_active_groups()) && (!get_active_enemies())) {
				create_enemy_group(80, 0, 2, 5);
				level_step++;
			}
			break;
		case 6:
			if ((!get_active_groups()) && (!get_active_enemies())) {
				create_message(18, 96, 0, 10, "WELL;DONE;PILOT");
				level_end = 1;
			}
			break;
		case 7:
			level_timer = get_time();
			level_step++;
			break;
		case 8:
			if ( (get_time() - level_timer) > 3000) {
				level_step++;
			}
			break;
		}

		break;
	}
}

u8 get_end_level() {
	return level_end;
}