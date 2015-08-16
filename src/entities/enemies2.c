#include <stdio.h>
#include <cpctelera.h>
#include "entities.h"

TEnemy2 ship0[12];
TEnemy2 ship1[12];

void reset_ship(TEnemy2* enemy){
	enemy->x = 0.0;
    enemy->y = 0.0;
    enemy->v = 0;
    enemy->theta = 0.0;
    enemy->cosine = 0.0;
    enemy->sine = 0.0;
    enemy->dt = 0.0;
    enemy->dtheta = 0.0; 
    enemy->leader = 0;
    enemy->formation_offset = 0;
    enemy->cur_pattern = NULL;
    enemy->cur_cmd = 0; 
    //enemy->patternQueue = NULL;
    enemy->patternQueuePos=0;
    enemy->alive = 0;
}

void mirror_ship(TEnemy2* enemy) {
        TEnemy2 *leader = (TEnemy2) &enemy->leader;
        enemy->theta = leader->theta;
        enemy->x = (enemy->formation_offset * -leader->sine) + leader->x;
        enemy->y = (enemy->formation_offset * leader->cosine) + leader->y;
    }

void update_sbip(TEnemy2* enemy) {
	TPattern *pattern;
	u8 i;

        if (!enemy->alive) {
            return;
        }

        if (enemy->leader) {
            mirror_ship(enemy);
            return;
        }

        pattern = &enemy->cur_pattern;
        i = enemy->cur_cmd;

        switch (pattern[i]->cmd) {
            
            case ENTER_LEFT:
            enemy->v = pattern[i]->v;
            if (enemy->x >= pattern[i]->x) {
                enemy->cur_cmd++;
            }
            break;

            case ENTER_RIGHT:
            enemy->v = pattern[i]->v;
            if (enemy->x <= pattern[i]->x) {
                enemy->cur_cmd++;
            }
            break;

            case EXIT_LEFT:
            enemy->v = pattern[i]->v;
            if (enemy->x <= pattern[i]->x) {
                enemy->cur_cmd++;
            }
            break;

            case EXIT_RIGHT:
            enemy->v = pattern[i]->v;
            if (enemy->x >= pattern[i]->x) {
                enemy->cur_cmd++;
            }
            break;

            case TRANSLATE_TO:
            enemy->v = pattern[i]->v;

            if (enemy->v < 0) {
                if (enemy->x <= pattern[i]->x) {
                    enemy->cur_cmd++;
                }
            }
            else {
                if (enemy->x >= pattern[i]->x) {
                    enemy->cur_cmd++;
                }
            }
            break;
           
            case TRANSLATE:

            enemy->v = pattern[i]->v;
            enemy->dt += enemy->v;

            if (enemy->v < 0) {
                if (enemy->dt <= pattern[i]->frames) {
                    enemy->dt = 0;
                    enemy->cur_cmd++;
                }
            }
            else {
                if (enemy->dt >= pattern[i]->frames) {
                    enemy->dt = 0;
                    enemy->cur_cmd++;
                }
            }
            break;

            case ROTATE:
            enemy->v = pattern[i]->v;
            enemy->dtheta += pattern[i]->theta;
            enemy->theta += pattern[i]->theta;

            if (pattern[i]->max < 0) {
                if (enemy->dtheta <= pattern[i]->max) {
                    enemy->dtheta = 0;
                    enemy->cur_cmd++;
                }
            }
            else {
                if (enemy->dtheta >= pattern[i]->max) {
                    enemy->dtheta = 0;
                    enemy->cur_cmd++;
                }
            }

            break;
        }

        enemy->cosine = Math.cos(enemy->theta);
        enemy->sine = Math.sin(enemy->theta);
        enemy->x = (enemy->v * enemy->cosine) + enemy->x;
        enemy->y = (enemy->v * enemy->sine) + enemy->y;

        if (enemy->cur_cmd >= pattern.length) {
            enemy->patternQueuePos++;
            if (enemy->patternQueuePos >= enemy->patternQueue.length) {
                enemy->alive = false;
                NumShipsLeft--;
            }
            else {
                enemy->cur_pattern = enemy->patternQueue[enemy->patternQueuePos];
                enemy->cur_cmd = 0;
            }
        }
    }

    