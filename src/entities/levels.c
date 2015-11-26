#include <stdio.h>
#include "entities.h"
#include "../util/util.h"

u8 active_level = 0;
u8 level_step = 0;
u8 level_end = 0;
long level_timer = 0;
const u8 level_titles[2][20] = {"PROLOGUE", "THE;BEGINNING"};
const u8 level_enemies[20] = {4, 12};
u8 level_max_enemy_shots = 0;

void start_level(u8 level) {
	u8 aux_txt[60];

	active_level = level;
	level_step = 0;
	level_end = 0;
	sprintf(aux_txt, "LEVEL;%d", active_level);
	create_centered_message(96, 0, 15, aux_txt,0);
	create_centered_message(96, 15, 15, (u8*) &level_titles[active_level - 1],0);
	sprintf(aux_txt, "ENEMIES;%d", level_enemies[active_level-1]);
	create_centered_message(96, 30, 15, aux_txt,1);
	switch (active_level) {
	case 1:
		level_max_enemy_shots = 3;
		break;
	case 2:
		level_max_enemy_shots = 5;
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
			if ((get_time() - level_timer) > 300) {
				level_step++;
			}
			break;
		case 2:
			create_enemy(75, 0, 1, 55, 50, 1);
			create_enemy(85, 0, 1, 65, 50, 2);
			level_step++;
			break;
		case 3:
			if (!get_active_enemies()) {
				level_timer = get_time();
				level_step++;
			}
			break;
		case 4:
			if ( (get_time() - level_timer) > 300) {
				level_step++;
			}
			break;
		case 5:
			create_enemy(75, 0, 1, 55, 50, 2);
			create_enemy(85, 0, 1, 65, 50, 1);
			level_step++;
			break;
		case 6:
			if (!get_active_enemies()) {
				level_timer = get_time();
				level_step++;
			}
			break;
		case 7:
			if ( (get_time() - level_timer) > 300) {
				level_step++;
			}
			break;
		case 8:
			level_end = 1;
			break;
		}

		break;

	case 2:

		switch (level_step) {

		case 0:
			level_timer = get_time();
			level_step++;
			break;
		case 1:
			if ((get_time() - level_timer) > 300) {
				level_step++;
			}
			break;
		case 2:
			create_enemy(15, 180, 2, 34, 50, 3);
			create_enemy(8, 195, 3, 45, 30, 3);
			create_enemy(0, 180, 2, 55, 50, 3);
			level_step++;
			break;
		case 3:
			level_timer = get_time();
			level_step++;
			break;
		case 4:
			if ((get_time() - level_timer) > 1000) {
				level_step++;
			}
			break;
		case 5:
			create_enemy(145, 180, 2, 95, 50, 4);
			create_enemy(152, 195, 3, 105, 30, 4);
			create_enemy(160, 180, 2, 115, 50, 4);
			level_step++;
			break;
		case 6:
			level_timer = get_time();
			level_step++;
			break;
		case 7:
			if ((get_time() - level_timer) > 1000) {
				level_step++;
			}
			break;
		case 8:
			create_enemy_group(0, 195, 4, 6);
			level_step++;
			break;
		case 9:
			level_timer = get_time();
			level_step++;
			break;
		case 10:
			if ( (get_time() - level_timer) > 300) {
				level_step++;
			}
			break;
		case 11:
			if ((!get_active_groups()) && (!get_active_enemies())) {
				level_step++;
			} else {
				enemies_full_attack();
			}
			break;
		case 12:
			level_timer = get_time();
			level_step++;
			break;
		case 13:
			if ( (get_time() - level_timer) > 300) {
				level_step++;
			}
			break;
		case 14:
			level_end = 1;
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