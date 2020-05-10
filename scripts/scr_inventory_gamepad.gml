///scr_inventory_gamepad(device)

var device = argument0;     //usando var lo scope si estende solo allo script

open = gamepad_button_check_pressed(device, gp_start);

//arrows
right = gamepad_button_check_pressed(device, gp_padr);
left = gamepad_button_check_pressed(device, gp_padl);
up = gamepad_button_check_pressed(device, gp_padu);
down = gamepad_button_check_pressed(device, gp_padd);

move = gamepad_button_check_pressed(device, gp_face1);
toss = gamepad_button_check_pressed(device, gp_face3);
