///scr_input_menu_gamepad(device)

var device = argument0;

// Set minimal deadzone in order to check if analog is released.
gamepad_set_axis_deadzone(device, ANALOG_DEADZONE / 2);

// Set directions to false in order not to have them pressed indefinitely for the duration of the alarm.
id.right = false;
id.left = false;
id.up = false;
id.down = false;

// Directions.
if (gamepad_button_check_released(device, gp_padr) ||
    gamepad_button_check_released(device, gp_padl) ||
    gamepad_button_check_released(device, gp_padu) ||
    gamepad_button_check_released(device, gp_padd) ||
    -ANALOG_DEADZONE > gamepad_axis_value(device, gp_axislh) < ANALOG_DEADZONE ||
    -ANALOG_DEADZONE > gamepad_axis_value(device, gp_axislv) < ANALOG_DEADZONE) {
    // Zero out the wait time if any direction button is released.
    id.alarm[0] = 0;
}

// Only take direction if time passed.
if (id.alarm[0] <= 0) {
    // Set analog deadzone to standard value to correctly detect movement.
    gamepad_set_axis_deadzone(device, ANALOG_DEADZONE);
    
    // Actually get input.
    id.right = gamepad_button_check(device, gp_padr) || (gamepad_axis_value(device, gp_axislh) > 0);
    id.left = gamepad_button_check(device, gp_padl) || (gamepad_axis_value(device, gp_axislh) < 0);
    id.up = gamepad_button_check(device, gp_padu) || (gamepad_axis_value(device, gp_axislv) < 0);
    id.down = gamepad_button_check(device, gp_padd) || (gamepad_axis_value(device, gp_axislv) > 0);
    
    // Only set alarm if a direction was pressed.
    if (id.right || id.left || id.up || id.down) {
        id.alarm[0] = id.direction_hold_delay;
    }
}

id.select = gamepad_button_check_pressed(device, gp_face1);
id.back = gamepad_button_check_pressed(device, gp_face2);
