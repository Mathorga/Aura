///scr_view_input(device, deadzone)

var device = argument0;
var deadzone = argument1;

if (gamepad_is_connected(device)) {    
    gamepad_set_axis_deadzone(device, deadzone);
    hor = gamepad_axis_value(device, gp_axisrh);  //-1 <-> 1
    ver = gamepad_axis_value(device, gp_axisrv);
    lock = gamepad_button_check_pressed(device, gp_shoulderl);
    //c_switch = gamepad_button_check_pressed(device, gp_stickr);
} else {
    lock = keyboard_check_pressed(vk_rshift);
    //c_switch = keyboard_check_pressed(vk_lshift);
}
