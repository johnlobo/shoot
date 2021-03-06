#include <stdio.h>
#include <stdlib.h>
#include <cpctelera.h>
#include "entities.h"
#include "../sprites/sprites.h"
#include "../util/util.h"


TEnemy enemies[MAX_ENEMIES];
u8 active_enemies;
u8 enemies_in_movement;
TEnemy_group groups [MAX_ENEMY_GROUPS];
u8 active_groups;
TPatternSet* pattern_set;
TPattern* pattern;
long open_attack_timer = 0;
u8 hostility;
u8* const baddie_fly[8] = { (u8*) G_baddie_fly_0, (u8*) G_baddie_fly_1, (u8*) G_baddie_fly_2, (u8*) G_baddie_fly_3, 
						   (u8*) G_baddie_fly_4, (u8*) G_baddie_fly_5, (u8*) G_baddie_fly_6, (u8*) G_baddie_fly_7};
u8* const baddie_ship[8] = { (u8*) G_baddie_ship_0, (u8*) G_baddie_ship_1, (u8*) G_baddie_ship_2, (u8*) G_baddie_ship_3, 
						   (u8*) G_baddie_ship_4, (u8*) G_baddie_ship_5, (u8*) G_baddie_ship_6, (u8*) G_baddie_ship_7};
u8* const baddie_bird[8] = { (u8*) G_baddie_bird_0, (u8*) G_baddie_bird_1, (u8*) G_baddie_bird_2, (u8*) G_baddie_bird_3, 
						   (u8*) G_baddie_bird_4, (u8*) G_baddie_bird_5, (u8*) G_baddie_bird_6, (u8*) G_baddie_bird_7};
u8* const baddie_ball[8] = { (u8*) G_baddie_ball_0, (u8*) G_baddie_ball_1, (u8*) G_baddie_ball_2, (u8*) G_baddie_ball_3, 
						   (u8*) G_baddie_ball_4, (u8*) G_baddie_ball_5, (u8*) G_baddie_ball_6, (u8*) G_baddie_ball_7};
u8* const baddie_05[8] = { (u8*) G_baddie05_00, (u8*) G_baddie05_01, (u8*) G_baddie05_02, (u8*) G_baddie05_03, 
						   (u8*) G_baddie05_04, (u8*) G_baddie05_05, (u8*) G_baddie05_06, (u8*) G_baddie05_07};

//******************************************************************************
// Función: check_collision_enemies(u8 x, u8 y, u8 w, u8 h)
//
//******************************************************************************
u8 check_collision_enemies(u8 x, u8 y, u8 w, u8 h) {
	u8 i;
	u8 collision;

	i = 0;
	collision = 0;

	for (i = 0; i < MAX_ENEMIES; i++) {
		if ((enemies[i].active) && (enemies[i].x > 0) && (enemies[i].y > 0)) {
			if (fast_collision(x, y, (w * 2) - 1, h, (u8) enemies[i].x, (u8) enemies[i].y, (enemies[i].w * 2) - 1, enemies[i].h)) {
				collision = 1;
				create_explosion(enemies[i].x, enemies[i].y, 0);
				enemies[i].active = 0;
				active_enemies--;
			}
		}
	}
	return collision;
}

//******************************************************************************
// Función: init_enemies()
//
//******************************************************************************
void init_enemies() {
	u8 k;
	for (k = 0; k < MAX_ENEMIES; k++) {
		enemies[k].active = 0;
	}
	active_enemies = 0;
	enemies_in_movement = 0;
	open_attack_timer = 0;
}

void switch_movement(u8 enemy, u8 state) {
	if ((state == ENEMY_MOVING) && (enemies[enemy].state != ENEMY_MOVING)) {
		enemies[enemy].state = ENEMY_MOVING;
		enemies_in_movement++;
	} else if ((state != ENEMY_MOVING) && (enemies[enemy].state == ENEMY_MOVING)) {
		enemies[enemy].state = state;
		enemies_in_movement--;
	}
}

//******************************************************************************
// Función: create_enemy
//	basado en trayectorias
//******************************************************************************
void create_enemy(i16 x, i16 y, u8 type, i16 home_x, i16 home_y, u8 pattern) {
	u8 k;
	if (active_enemies < MAX_ENEMIES) {
		k = 0;
		while (enemies[k].active) {
			k++;
		}
		enemies[k].active = 1;
		enemies[k].frame = 0;
		enemies[k].x = x;
		enemies[k].y = y;

		enemies[k].home_x = home_x;
		enemies[k].home_y = home_y;
		enemies[k].num_frames = 0;
		enemies[k].step = 0;
		enemies[k].f.x = (i32) x * (i32) SCALE_FACTOR;
		enemies[k].f.y = (i32) y * (i32) SCALE_FACTOR;
		enemies[k].f.v = 0;
		enemies[k].f.dir = 0;
		enemies[k].f.angle = 270;
		enemies[k].f.acum_angle = 0;
		enemies[k].f.sleep = 0;
		enemies[k].cur_cmd = 0;
		enemies[k].state = ENEMY_STILL;

		switch (type) {

		case 1:
			enemies[k].w = 4;
			enemies[k].h = 8;
			cpct_memcpy(&enemies[k].sprite[0], &baddie_fly, 16);
			enemies[k].patternQueue = (TPatternSet*) &pattern01_left;
			break;
		case 2:
			enemies[k].w = 4;
			enemies[k].h = 7;
			cpct_memcpy(&enemies[k].sprite[0], &baddie_ship, 16);
			enemies[k].patternQueue = (TPatternSet*) &pattern02_left;
			break;
		case 3:
			enemies[k].w = 4;
			enemies[k].h = 7;
			cpct_memcpy(&enemies[k].sprite[0], &baddie_bird, 16);
			enemies[k].patternQueue = (TPatternSet*) &pattern03;
			break;
		case 4:
			enemies[k].w = 4;
			enemies[k].h = 7;
			cpct_memcpy(&enemies[k].sprite[0], &baddie_ball, 16);
			enemies[k].patternQueue = (TPatternSet*) &pattern04;
			break;
		case 5:
			enemies[k].w = 5;
			enemies[k].h = 9;
			cpct_memcpy(&enemies[k].sprite[0], &baddie_05, 16);
			enemies[k].patternQueue = (TPatternSet*) &pattern02_right;
			break;
		}
		if (pattern > 0) {
			switch (pattern) {
			case 1 :
				enemies[k].patternQueue = (TPatternSet*) &pattern01_left;
				break;
			case 2 :
				enemies[k].patternQueue = (TPatternSet*) &pattern01_right;
				break;
			case 3 :
				enemies[k].patternQueue = (TPatternSet*) &pattern02_left;
				break;
			case 4 :
				enemies[k].patternQueue = (TPatternSet*) &pattern02_right;
				break;
			case 5 :
				enemies[k].patternQueue = (TPatternSet*) &pattern03;
				break;
			case 6 :
				enemies[k].patternQueue = (TPatternSet*) &pattern04;
				break;
			case 7 :
				enemies[k].patternQueue = (TPatternSet*) &attack01;
				break;

			}

		}
		active_enemies++;
	}

}

void create_enemy_group(i16 x, i16 y, u8 type, u8 num_enemies ) {
	u8 k;
	if (active_groups < MAX_ENEMY_GROUPS) {
		k = 0;
		while (groups[k].active) {
			k++;
		}
		groups[k].active = 1;
		groups[k].x = x;
		groups[k].y = y;
		groups[k].enemy_type = type;
		groups[k].num_enemies = num_enemies;
		groups[k].sleep = ENEMY_GAP;
		active_groups++;
	}
}

//******************************************************************************
// Función:
//
//******************************************************************************

void update_enemy_groups() {
	u8 i;

	if (active_groups > 0) {
		i = 0;
		for (i = 0; i < MAX_ENEMY_GROUPS; i++) {
			if (groups[i].active) {
				if (groups[i].sleep == 0) {
					groups[i].sleep = ENEMY_GAP;
					if (groups[i].num_enemies == 0) {
						groups[i].active = 0;
						active_groups--;
					} else {
						create_enemy(groups[i].x, groups[i].y, groups[i].enemy_type, 4 + groups[i].num_enemies * 20, 70, 0);
						groups[i].num_enemies--;
					}
				} else {
					groups[i].sleep--;
				}

			}
		}
	}
}


//******************************************************************************
// Función: translate_to()
// Updates the physics module of an enemy to move towards the x,y in the pattern
//******************************************************************************
u8 translate_to(TPhysics *f, i16 x, i16 y, u8 v) {
	u8 advance_step;
	i16 x_comp, y_comp;
	i16 x_prev, y_prev;
	i16 x_close, y_close;

	advance_step = 0;

	x_prev = (f->x >> 8);
	y_prev = (f->y >> 8);

	f->x += (i32) (f->v * cosine(f->angle));
	//multiply by two two mantain aspect ration in the speed
	//multiply by the sigh of the y coord to act properly when y is less than 0
	//f->y = ((f->y<0) - (f->y>=0)) * (f->v * sine(f->angle) * 2);
	f->y -= (i32)(f->v * sine(f->angle) * 2);

	x_comp = (f->x >> 8);
	y_comp = (f->y >> 8);

	x_close = 0;
	y_close = 0;

	//if ((x_comp == x) || ((MIN(x_prev, x_comp) <= x) && ((MAX(x_prev, x_comp) >= x)))) {
	if ((x_comp == x) || ((mini16(x_prev, x_comp) <= x) && ((maxi16(x_prev, x_comp) >= x)))) {
		x_close = 1;
		f->x = (i32) x * (i32) SCALE_FACTOR;
		x_comp = x;
	}

	if ((y_comp == y) || ((mini16(y_prev, y_comp) <= y) && ((maxi16(y_prev, y_comp) >= y)))) {
		y_close = 1;
		f->y = (i32) y * (i32) SCALE_FACTOR;
		y_comp = y;
	}

	if (x_close && y_close) {
		f->x = (i32) x * (i32) SCALE_FACTOR;
		f->y = (i32) y * (i32) SCALE_FACTOR;
		advance_step = 1;
	} else if (y_close) {
		if (x_comp < x) {
			f->angle = 0;
			f->dir = 0;
		}
		else {
			f->angle = 180;
			f->dir = 4;
		}

	} else if (x_close) {
		if (y_comp < y) {
			f->angle = 270;
			f->dir = 6;
		} else {
			f->angle = 90;
			f->dir = 2;
		}
	} else if (x_comp < x) {
		if (y_comp < y) {
			f->angle = 315;
			f->dir = 7;
		} else {
			f->angle = 45;
			f->dir = 1;
		}
	} else if (y_comp < y) {
		f->angle = 225;
		f->dir = 5;
	} else {
		f->angle = 135;
		f->dir = 3;
	}

	f->v = v;

	return advance_step;
}

//******************************************************************************
// Función: update_enemies2()
// Update based on patterns
//******************************************************************************
void update_enemies() {
	u8 i = 0;

	update_enemy_groups();

	if (active_enemies > 0) {
		for (i = 0; i < MAX_ENEMIES; i++) {

			if (enemies[i].active) {

				pattern_set = (TPatternSet*) & (*enemies[i].patternQueue);


				if (enemies[i].cur_cmd < pattern_set->num_CMDs) {

					pattern = (TPattern*) & (*pattern_set->patterns[enemies[i].cur_cmd]);

					switch (pattern->CMD) {

					case TRANSLATE_TO:
						if (translate_to((TPhysics*) & (enemies[i].f), pattern->x, pattern->y, pattern->v)) {
							enemies[i].cur_cmd++;
						}
						break;

					case TRANSLATE:
						switch_movement(i, ENEMY_MOVING);
						enemies[i].f.v = pattern->v;
						enemies[i].f.angle = pattern-> angle;
						enemies[i].f.dir = (pattern -> angle + 15) / 45;
						enemies[i].f.x += (enemies[i].f.v * cosine(enemies[i].f.angle));
						//multiply by two two mantain aspect ration in the speed
						//multiply by the sigh of the y coord to act properly when y is less than 0
						//enemies[i].f.y = ((enemies[i].f.y<0) - (enemies[i].f.y>=0)) * (enemies[i].f.v * sine(enemies[i].f.angle) * 2);
						enemies[i].f.y -= (enemies[i].f.v * sine(enemies[i].f.angle)) * 2;

						if (enemies[i].step == pattern->frames) {
							enemies[i].step = 0;
							enemies[i].cur_cmd++;
						} else enemies[i].step++;

						break;

					case TRANSLATE_HOME:
						switch_movement(i, ENEMY_MOVING);
						if (translate_to((TPhysics*) & (enemies[i].f), enemies[i].home_x, enemies[i].home_y, pattern->v))
							enemies[i].cur_cmd++;
						break;

					case ROTATE:
						switch_movement(i, ENEMY_MOVING);
						enemies[i].f.v = pattern->v;
						enemies[i].f.angle += pattern->angle;

						if (enemies[i].f.angle > 360)
							enemies[i].f.angle -= 360;
						else if (enemies[i].f.angle < 0)
							enemies[i].f.angle = 360 + enemies[i].f.angle;
						else if (enemies[i].f.angle == 360)
							enemies[i].f.angle = 0;

						enemies[i].f.dir = (enemies[i].f.angle + 15) / 45;
						if (enemies[i].f.dir > 7) enemies[i].f.dir = 0;

						enemies[i].f.x += (i32) (enemies[i].f.v * cosine(enemies[i].f.angle));
						//multiply by two two mantain aspect ration in the speed
						//multiply by the sigh of the y coord to act properly when y is less than 0
						//enemies[i].f.y = ((enemies[i].f.y<0) - (enemies[i].f.y>=0)) * (enemies[i].f.v * sine(enemies[i].f.angle) * 2);
						enemies[i].f.y -= (i32) (enemies[i].f.v * sine(enemies[i].f.angle)) * 2;
						if (enemies[i].step == pattern->frames) {
							enemies[i].step = 0;
							enemies[i].cur_cmd++;
						} else enemies[i].step++;


						break;
					case ROTATE_TO:
						switch_movement(i, ENEMY_MOVING);
						enemies[i].f.v = pattern->v;
						enemies[i].f.angle = pattern->angle;
						enemies[i].f.dir = (enemies[i].f.angle + 15) / 45;
						enemies[i].cur_cmd++;
						break;

					case TRANSPORT_TO:
						switch_movement(i, ENEMY_SLEEP);
						enemies[i].f.x = (i32) pattern->x * (i32) SCALE_FACTOR;
						enemies[i].f.y = (i32) pattern->y * (i32) SCALE_FACTOR;
						enemies[i].f.angle = pattern->angle;
						enemies[i].f.dir = (enemies[i].f.angle + 15) / 45;
						enemies[i].cur_cmd++;
						break;

					case SLEEP:
						switch_movement(i, ENEMY_SLEEP);
						if (enemies[i].f.sleep == pattern->frames) {
							enemies[i].f.sleep = 0;
							enemies[i].cur_cmd++;
						} else
							enemies[i].f.sleep++;
					}

					enemies[i].x = enemies[i].f.x >> 8;
					enemies[i].y = enemies[i].f.y >> 8;

					if (check_collision_user(enemies[i].x, enemies[i].y, enemies[i].w, enemies[i].h)) {
						create_explosion(enemies[i].x, enemies[i].y, 0);
						enemies[i].active = 0;
						active_enemies--;
					} else {
						if ((pattern_set->repeat) && (enemies[i].cur_cmd >= pattern_set->num_CMDs)) {
							enemies[i].cur_cmd = 0;
						} else if (enemies[i].cur_cmd >= pattern_set->num_CMDs) {
							switch_movement(i, ENEMY_STILL);
						}
						if ((get_active_enemy_shots() < get_level_max_enemy_shots()) &&
						        (enemies[i].state == ENEMY_MOVING) &&
						        (cpct_rand() < 60) &&
						        (enemies[i].f.dir > 4) &&
						        (hostility)) {
							create_enemy_shot(enemies[i].x, enemies[i].y, 0, 270, 4);
						}
					}
				}
			}
		}
	}
}

void enemies_full_attack() {
	u8 i, found;

	if ((hostility) && ((get_time() - open_attack_timer) > 500) && (enemies_in_movement < 3) && (active_enemies > 0)) {
		found = 0;
		for (i = 0; i < MAX_ENEMIES; i++)
			if ((enemies[i].active) && (enemies[i].state == ENEMY_STILL)) {
				found = 1;
				break;
			}
		if (found) {
			enemies[i].patternQueue = (TPatternSet*) &attack01;
			enemies[i].cur_cmd = 0;
			open_attack_timer = get_time();
		}
	}
}


u8 get_active_enemies() {
	return active_enemies;
}

u8 get_active_groups() {
	return active_groups;
}

//******************************************************************************
// Función:
//
//******************************************************************************
void draw_enemies(u8* screen) {
	u8* pscreen;
	u8 k;

	k = 0;
	if (active_enemies > 0) {
		for (k = 0; k < MAX_ENEMIES; k++) {

			if ((enemies[k].active) && inside_screen(enemies[k].x, enemies[k].y, enemies[k].w, enemies[k].h)) {
				pscreen = cpct_getScreenPtr(screen, enemies[k].x / 2, enemies[k].y);

				if (enemies[k].x & 1) {
					shiftSpritePixelsRightToBuffer((u8*) enemies[k].sprite[enemies[k].f.dir], enemies[k].w * enemies[k].h);
					cpct_drawSprite( (u8*) sprite_buffer, pscreen, enemies[k].w, enemies[k].h);
				} else
					cpct_drawSprite( (u8*) enemies[k].sprite[enemies[k].f.dir], pscreen, enemies[k].w, enemies[k].h);
			}
		}
	}
}

void set_hostility(u8 onoff) {
	hostility = onoff;
}

u8 get_hostility() {
	return hostility;
}