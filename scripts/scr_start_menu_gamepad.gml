///scr_start_menu_gamepad(device)

var device = argument0;     //usando var lo scope si estende solo allo script

//arrows
id.right = gamepad_button_check_pressed(device, gp_padr);
id.left = gamepad_button_check_pressed(device, gp_padl);
id.up = gamepad_button_check_pressed(device, gp_padu);
id.down = gamepad_button_check_pressed(device, gp_padd);

id.select = gamepad_button_check_pressed(device, gp_face1);
id.back = gamepad_button_check_pressed(device, gp_face2);
