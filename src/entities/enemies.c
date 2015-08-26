	#include <stdio.h>
	#include <cpctelera.h>
	#include "entities.h"
	#include "../sprites/sprites.h"
	#include "../util/util.h"
	
	
	TEnemy enemies[MAX_ENEMIES];
	u8 active_enemies;
	TEnemy_group groups [MAX_ENEMY_GROUPS];
	u8 active_groups;
	
	
	//******************************************************************************
	// Función: check_collision_enemies(u8 x, u8 y, u8 w, u8 h)
	//
	//******************************************************************************
	u8 check_collision_enemies(u8 x, u8 y, u8 w, u8 h){
		u8 i;
		u8 collision;
	
		i=0;
		collision = 0;
	
		for (i=0;i<MAX_ENEMIES;i++){
			if ((enemies[i].active) && (enemies[i].x>0) && (enemies[i].y>0)){
				if (fast_collision(x,y,w,h,(u8) enemies[i].x,(u8) enemies[i].y, enemies[i].w, enemies[i].h)){
					collision = 1;
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
	void init_enemies(){
		u8 k;
		for (k=0;k<MAX_ENEMIES;k++){
			enemies[k].active=0;
		}
		active_enemies=0;
	}
	
	
	//******************************************************************************
	// Función: create_enemy
	//	basado en trayectorias
	//******************************************************************************
	void create_enemy(i16 x, i16 y, u8 type){
		u8 k;
		if (active_enemies < MAX_ENEMIES){
			k=0;
			while (enemies[k].active){
				k++;
			}
			enemies[k].active=1;
			enemies[k].frame=0;
			switch (type){
	
				case 1:
				enemies[k].x=x;
				enemies[k].y=y;
				enemies[k].w=4;
				enemies[k].h=8;
				enemies[k].num_frames=0;
				enemies[k].sprite[0]= (u8*) G_baddie04_00;
				enemies[k].sprite[1]= (u8*) G_baddie04_01;
				enemies[k].sprite[2]= (u8*) G_baddie04_02;
				enemies[k].sprite[3]= (u8*) G_baddie04_03;
				enemies[k].sprite[4]= (u8*) G_baddie04_04;
				enemies[k].sprite[5]= (u8*) G_baddie04_05;
				enemies[k].sprite[6]= (u8*) G_baddie04_06;
				enemies[k].sprite[7]= (u8*) G_baddie04_07;
				enemies[k].movement=0;
				enemies[k].stage=0;
				enemies[k].stage_step=0;
				enemies[k].step=0;
				break;
				case 2:
				enemies[k].x=x;
				enemies[k].y=y;
				enemies[k].w=4;
				enemies[k].h=8;
				enemies[k].num_frames=0;
				enemies[k].sprite[0]= (u8*) G_baddie03_00;
				enemies[k].sprite[1]= (u8*) G_baddie03_01;
				enemies[k].sprite[2]= (u8*) G_baddie03_02;
				enemies[k].sprite[3]= (u8*) G_baddie03_03;
				enemies[k].sprite[4]= (u8*) G_baddie03_04;
				enemies[k].sprite[5]= (u8*) G_baddie03_05;
				enemies[k].sprite[6]= (u8*) G_baddie03_06;
				enemies[k].sprite[7]= (u8*) G_baddie03_07;
				enemies[k].movement=0;
				enemies[k].stage=0;
				enemies[k].stage_step=0;
				enemies[k].step=0;
				break;
				default:
				enemies[k].x=x;
				enemies[k].y=y;
				enemies[k].w=4;
				enemies[k].h=8;
				enemies[k].num_frames=0;
				enemies[k].sprite[0]= (u8*) G_baddie03_00;
				enemies[k].sprite[1]= (u8*) G_baddie03_01;
				enemies[k].sprite[2]= (u8*) G_baddie03_02;
				enemies[k].sprite[3]= (u8*) G_baddie03_03;
				enemies[k].sprite[4]= (u8*) G_baddie03_04;
				enemies[k].sprite[5]= (u8*) G_baddie03_05;
				enemies[k].sprite[6]= (u8*) G_baddie03_06;
				enemies[k].sprite[7]= (u8*) G_baddie03_07;
				enemies[k].movement=1;
				enemies[k].stage=0;
				enemies[k].stage_step=0;
				enemies[k].step=0;
				break;
			}
			active_enemies++;
		//prota.lastShot = getTime();
		//if (SONIDO_ACTIVADO) cpc_WyzStartEffect(0,0);
		}
	}
	
	void create_enemy_group(i16 x, i16 y, u8 type, u8 num_enemies ){
		u8 k;
		if (active_groups < MAX_ENEMY_GROUPS){
			k=0;
			while (groups[k].active){
				k++;
			}
			groups[k].active=1;
			groups[k].x=x;
			groups[k].y=y;
			groups[k].enemy_type=type;
			groups[k].num_enemies=num_enemies;
			groups[k].sleep=ENEMY_GAP;
			active_groups++;
		}
	}
	
	//******************************************************************************
	// Función: update_enemies2()
	// Update based on patterns
	//******************************************************************************
	void update_enemies2(){
		u8 i=0;
		TPatternSet* pattern_set;
		TPattern* pattern;
		u16 dtx, dty;
	
		if (active_enemies>0){
			for (i=0;i<MAX_ENEMIES;i++){
	
				if (!enemies[i].active) 
	        		return;
	        		
				pattern = (TPattern*) &enemies[i].cur_pattern;
	   			
	   			switch (pattern->CMD) {
	
		        case TRANSLATE_TO:
		        	dtx = pattern->v*cosine(enemies[i].f.angle);
		        	dty = pattern->v*sine(enemies[i].f.angle); 
		        	
		        	if ((absolute(enemies[i].f.x-pattern->x)<(pattern->v*cosine(enemies[i].f.angle))) && 
		        		(absolute(enemies[i].f.y-pattern->y)<(pattern->v*sine(enemies[i].f.angle)))){
		        		enemies[i].f.x=pattern->x;
		        		enemies[i].f.y=pattern->y;
		        		enemies[i].cur_cmd++;
		        	}
		        	else if ((enemies[i].f.x<pattern->x) && (enemies[i].f.y == pattern->y)){
		        			enemies[i].f.x+=pattern->v;
		        			enemies[i].f.angle = 0;
		        		}
		        	else if ((enemies[i].f.x<pattern->x) && (enemies[i].f.y > pattern->y)){
		        			enemies[i].f.x+=pattern->v;
		        			enemies[i].f.y-=pattern->v;
		        			enemies[i].f.angle = 45;
		        		}
		        	else if ((enemies[i].f.x==pattern->x) && (enemies[i].f.y > pattern->y)){
		        			enemies[i].f.y-=pattern->v;
		        			enemies[i].f.angle = 90;
		        		}
		        	else if ((enemies[i].f.x>pattern->x) && (enemies[i].f.y > pattern->y)){
		        			enemies[i].f.x-=pattern->v;
		        			enemies[i].f.y-=pattern->v;
		        			enemies[i].f.angle=135;
		        		}
		        	else if ((enemies[i].f.x>pattern->x) && (enemies[i].f.y == pattern->y)){
		        			enemies[i].f.x-=pattern->v;
		        			enemies[i].f.angle=180;
		        		}
		        	else if ((enemies[i].f.x>pattern->x) && (enemies[i].f.y < pattern->y)){
		        			enemies[i].f.x-=pattern->v;
		        			enemies[i].f.y+=pattern->v;
		        			enemies[i].f.angle=225;
		        		}
		        	else if ((enemies[i].f.x == pattern->x) && (enemies[i].f.y < pattern->y)){
		        			enemies[i].f.y+=pattern->v;
		        			enemies[i].f.angle=270;
		        		}
		        	else if ((enemies[i].f.x<pattern->x) && (enemies[i].f.y < pattern->y)){
		        			enemies[i].f.x+=pattern->v;
		        			enemies[i].f.y+=pattern->v;
		        			enemies[i].f.angle=315;
		        		}
		        break;
		
		        case TRANSLATE:
		        	enemies[i].f.v=pattern->v;
		        	enemies[i].f.x += (enemies[i].f.v * cosine(enemies[i].f.angle));
	        		enemies[i].f.y += (enemies[i].f.v * sine(enemies[i].f.angle));
		        	
		        	if (enemies[i].step==pattern->frames){
		        		enemies[i].step=0;
		        		enemies[i].cur_cmd++;
		        	} else enemies[i].step++;
		
		        break;

		        case TRANSLATE_HOME:
		        enemies[i].f.v = pattern->v;
		
		        if (enemies[i].f.v < 0) {
		            if (enemies[i].f.x <= pattern->x) {
		                enemy->cur_cmd++;
		            }
		        }
		        else {
		            if (enemies[i].f.x >= pattern->x) {
		                enemies[i].cur_cmd++;
		            }
		        }
		        break;
		
		        case ROTATE:
		        enemies[i].f.v = pattern->v;
		        enemies[i].dtheta += pattern->theta;
		        enemies[i].theta += pattern->theta;
		
		        if (pattern->max < 0) {
		            if (enemies[i].dtheta <= pattern->max) {
		                enemies[i].dtheta = 0;
		                enemies[i].cur_cmd++;
		            }
		        }
		        else {
		            if (enemies[i].dtheta >= pattern->max) {
		                enemies[i].dtheta = 0;
		                enemies[i].cur_cmd++;
		            }
		        }
		
		        break;
		    }
		    
	        enemies[i].f.x += (enemies[i].f.v * cosine(enemies[i].theta));
	        enemies[i].f.y += (enemies[i].f.v * sine(enemies[i].theta));

			pattern_set = (TPatternSet*) &enemies[i]->patternQueue;
	        if (enemies[i].cur_cmd >= pattern_set) {
	            enemies[i].patternQueuePos++;
	            if (enemies[i].patternQueuePos >= enemy->patternQueue.length) {
	                enemies[i].active = false;
	                NumShipsLeft--;
	            }
	            else {
	                enemies[i].cur_pattern = enemy->patternQueue[enemy->patternQueuePos];
	                enemies[i].cur_cmd = 0;
	            }
	        }
		
				}
			}
		}
		
		//******************************************************************************
		// Función: update_enemies()
		//	Basado en movimientos
		//******************************************************************************
		void update_enemies(){
			u8 i; 
		
			i=0;
			if (active_enemies>0){
				for (i=0;i<MAX_ENEMIES;i++){
					if (enemies[i].active){
						if (enemies[i].movement<99){
							if (enemies[i].stage_step<movements[enemies[i].movement].stages[enemies[i].stage].num_steps){
								enemies[i].dir = movements[enemies[i].movement].stages[enemies[i].stage].dir;
								enemies[i].x += movements[enemies[i].movement].stages[enemies[i].stage].vx;
								enemies[i].y += movements[enemies[i].movement].stages[enemies[i].stage].vy;
								enemies[i].stage_step++;
							} else {
								enemies[i].stage++;
								enemies[i].stage_step=0;
								if (enemies[i].stage>=movements[enemies[i].movement].num_stages){
									enemies[i].stage=0;
								}
								enemies[i].dir = movements[enemies[i].movement].stages[enemies[i].stage].dir;
								enemies[i].x += movements[enemies[i].movement].stages[enemies[i].stage].vx;
								enemies[i].y += movements[enemies[i].movement].stages[enemies[i].stage].vy;
								enemies[i].stage_step++;
							}
		
						}
					}
				}
			}
		
			if (active_groups>0){
				i=0;
				for (i=0;i<MAX_ENEMY_GROUPS;i++){
					if (groups[i].active){
						if (groups[i].sleep==0){
							groups[i].sleep=ENEMY_GAP;
							if (groups[i].num_enemies==0){
								groups[i].active=0;
								active_groups--;
							}else{
								create_enemy(groups[i].x, groups[i].y, groups[i].enemy_type);
								groups[i].num_enemies--;
							}
						}else{
							groups[i].sleep--;
						}
		
					}
				}
			}
		}
		
		u8 inside_screen(i16 x, i16 y, u8 w, u8 h){
			
			return ((x>=0) && ((x+w)<SCREEN_WIDTH) && (y>=0) && ((y+h)<SCREEN_HEIGHT));
		}
		
		u8 get_active_enemies(){
			return active_enemies;
		}
		
		//******************************************************************************
		// Función: 
		//
		//******************************************************************************
		void draw_enemies(u8* screen){
			u8* pscreen;
			u8 k;
		
			k=0;
			if (active_enemies>0){
				for (k=0;k<MAX_ENEMIES;k++){
					if ((enemies[k].active) && inside_screen(enemies[k].x,enemies[k].y,enemies[k].w,enemies[k].h)){
						pscreen = cpct_getScreenPtr(screen, enemies[k].x, enemies[k].y);
						cpct_drawSprite(enemies[k].sprite[enemies[k].dir],pscreen,enemies[k].w,enemies[k].h);
					}
				}
			}
	}
