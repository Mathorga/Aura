///scr_player_keyboard()

right = keyboard_check(ord("D"));
left = -keyboard_check(ord("A"));
up = -keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
roll = keyboard_check_pressed(vk_space);
attack_x = keyboard_check_pressed(ord("M"));
attack_y = keyboard_check_pressed(ord("K"));
walk = keyboard_check(vk_lshift);
inventory = keyboard_check(ord("I"));
interact = keyboard_check_pressed(ord("J"));

hor = left + right;
ver = up + down;
