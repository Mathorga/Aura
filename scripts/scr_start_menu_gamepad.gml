///scr_start_menu_gamepad(device)

var device = argument0;     //usando var lo scope si estende solo allo script

//arrows
right = gamepad_button_check_pressed(device, gp_padr);
left = gamepad_button_check_pressed(device, gp_padl);
up = gamepad_button_check_pressed(device, gp_padu);
down = gamepad_button_check_pressed(device, gp_padd);

select = gamepad_button_check_pressed(device, gp_face1);
