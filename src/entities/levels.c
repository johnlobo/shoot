#include <stdio.h>
#include "entities.h"
#include "../util/util.h"

u8 active_level = 0;
u8 level_step = 0;
u8 level_end = 0;
long level_timer = 0;
const u8 level_titles[2][20] = {"PROLOGUE","THE;BEGINNING"};
u8 level_max_enemy_shots = 0;

void start_level(u8 level) {
	u8 aux_txt[60];

	active_level = level;
	level_step = 0;
	level_end = 0;
	sprintf(aux_txt, "LEVEL;%d", active_level);
	create_message(31, 96, 0, 10, aux_txt);
	create_message(31, 96, 10, 10, (u8*) &level_titles[active_level-1]);
	create_message(31, 96, 20, 10, "SHOOT");
	switch (active_level){
		case 1:
			level_max_enemy_shots = 2;
		break;
	}
}

void update_level() {

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
			create_enemy_group(100, 150, 1, 5);
			//create_star(cpct_getRandomUniform_u8_f(0) % 75, cpct_getRandomUniform_u8_f(0) % 191);
			level_step++;
			break;
		case 3:
			level_timer = get_time();
			level_step++;
			break;
		case 4:
			if ((get_time() - level_timer) > 200) {
				level_step++;
			}
			break;
		case 5:
			if ((!get_active_groups()) && (!get_active_enemies())) {
				create_enemy_group(80, 0, 5	, 5);
				level_step++;
			}
			break;
		case 6:
			level_timer = get_time();
			level_step++;
			break;
		case 7:
			if ((get_time() - level_timer) > 200) {
				level_step++;
			}
			break;
		case 8:
			if ((!get_active_groups()) && (!get_active_enemies())) {
				create_enemy(5,0,1,5,0);
				create_enemy(0,5,1,0,5);
				level_step++;
			}
			break;
		case 9:
			if ((!get_active_groups()) && (!get_active_enemies())) {
				create_message(18, 96, 0, 10, "WELL;DONE;PILOT");
				level_end = 1;
			}
			break;
		case 10:
			level_timer = get_time();
			level_step++;
			break;
		case 11:
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

u8 get_level_max_enemy_shots() {
	return level_max_enemy_shots;
}