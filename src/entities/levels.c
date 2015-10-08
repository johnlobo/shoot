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
			level_max_enemy_shots = 3;
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
			create_enemy(15,180,1,34,50,1);
			create_enemy(8,195,3,45,30,1);
			create_enemy(0,180,1,55,50,1);
			level_step++;
			break;
		case 3:
			level_timer = get_time();
			level_step++;
			break;
		case 4:
			if ((get_time() - level_timer) > 1500) {
				level_step++;
			}
			break;
		case 5:
			create_enemy(145,180,1,95,50,2);
			create_enemy(152,195,3,105,30,2);
			create_enemy(160,180,1,115,50,2);
			level_step++;
			break;
		case 6:
			level_timer = get_time();
			level_step++;
			break;
		case 7:
			if ((get_time() - level_timer) > 1500) {
				level_step++;
			}
			break;
		case 8:
			/*create_enemy(0,195,1,24,70,1);
			create_enemy(-20,215,1,44,70,1);
			create_enemy(-40,235,1,64,70,1);
			create_enemy(-60,255,1,84,70,1);
			create_enemy(-80,235,1,104,70,1);
			create_enemy(-100,255,1,124,70,1);*/
			create_enemy_group(0,195,4,6);
			level_step++;
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