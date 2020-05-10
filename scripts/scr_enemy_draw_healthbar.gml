///scr_draw_enemy_healthbar(xoffset, yoffset)

xoffset = argument0;
yoffset = argument1;

draw_sprite(spr_enemyhealth_bg, 0, x - xoffset, y - yoffset);
draw_sprite_ext(spr_enemyhealth_life, 0, x - xoffset, y - yoffset, hp / hp_max, 1, 0, c_white, 0.7);
draw_self();
