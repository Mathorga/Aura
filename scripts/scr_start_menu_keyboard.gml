///scr_start_menu_keyboard()

//arrows
id.right = keyboard_check_pressed(vk_right);
id.left = keyboard_check_pressed(vk_left);
id.up = keyboard_check_pressed(vk_up);
id.down = keyboard_check_pressed(vk_down);

id.select = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);
id.back = keyboard_check_pressed(vk_backspace);
