///scr_player_gamepad(device, deadzone)

var device = argument0;

gamepad_set_axis_deadzone(device, ANALOG_DEADZONE);

// Arrows.
right = gamepad_button_check_pressed(device, gp_padr);
left = gamepad_button_check_pressed(device, gp_padl);

// Movement.
hor = gamepad_axis_value(device, gp_axislh);  //-1 <-> 1
ver = gamepad_axis_value(device, gp_axislv);


// Attack.
attack_x = gamepad_button_check_pressed(device, gp_face3);
attack_y = gamepad_button_check_pressed(device, gp_face4);

//TODO 
if (attack_y) {
    attacked_y = attack_y;
}
attack_y_release = gamepad_button_check_released(device, gp_face4);
if (attack_y_release) {
    attack_y_released = attack_y_release;
}
// aim = gamepad_button_check(device, gp_shoulderlb);
// shoot = gamepad_button_check_pressed(device, gp_shoulderrb);

// Movement.
roll = gamepad_button_check_pressed(device, gp_face2);
walk = gamepad_button_check(device, gp_shoulderr);

// Interact.
interact = gamepad_button_check_pressed(device, gp_face1);
