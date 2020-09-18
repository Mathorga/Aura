///scr_input_menu_keyboard()

// Set directions to false in order not to have them pressed indefinitely for the duration of the alarm.
id.right = false;
id.left = false;
id.up = false;
id.down = false;

// Directions.
if (keyboard_check_released(vk_right) ||
    keyboard_check_released(vk_left) ||
    keyboard_check_released(vk_up) ||
    keyboard_check_released(vk_down) ||
    keyboard_check_released(ord("W")) ||
    keyboard_check_released(ord("A")) ||
    keyboard_check_released(ord("S")) ||
    keyboard_check_released(ord("D"))) {
    // Zero out the wait time if any direction button is released.
    id.alarm[0] = 0;
}

// Only take direction if time passed.
if (id.alarm[0] <= 0) {
    // Actually get input.
    id.right = keyboard_check(vk_right) || keyboard_check(ord("D"));
    id.left = keyboard_check(vk_left) || keyboard_check(ord("A"));
    id.up = keyboard_check(vk_up) || keyboard_check(ord("W"));
    id.down = keyboard_check(vk_down) || keyboard_check(ord("S"));
    
    // Only set alarm if a direction was pressed.
    if (id.right || id.left || id.up || id.down) {
        id.alarm[0] = id.direction_hold_delay;
    }
}

id.select = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);
id.back = keyboard_check_pressed(vk_backspace) || keyboard_check_pressed(vk_escape);
