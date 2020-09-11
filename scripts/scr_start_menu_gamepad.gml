///scr_start_menu_gamepad(device)

var device = argument0;

gamepad_set_axis_deadzone(device, ANALOG_DEADZONE);

//arrows
id.right = gamepad_button_check_pressed(device, gp_padr) || (gamepad_axis_value(device, gp_axislh) < 0);
id.left = gamepad_button_check_pressed(device, gp_padl) || (gamepad_axis_value(device, gp_axislh) > 0);
id.up = gamepad_button_check_pressed(device, gp_padu) || (gamepad_axis_value(device, gp_axislv) > 0);
id.down = gamepad_button_check_pressed(device, gp_padd) || (gamepad_axis_value(device, gp_axislv) < 0);

id.select = gamepad_button_check_pressed(device, gp_face1);
id.back = gamepad_button_check_pressed(device, gp_face2);
