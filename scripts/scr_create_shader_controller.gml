///scr_create_shader_controller()

// Check if shader controller exists: if it's alredy present don't recreate it.
if (global.shader_controller == noone ||
    !instance_exists(global.shader_controller)) {
    global.shader_controller = instance_create(id.x, id.y, obj_shader_controller);
    
    // Check if the current room is a menu.
    if (room == rm_start_menu ||
        room == rm_settings_menu) {
        // If so, disable shaders by default.
        global.shader_controller.shaders_enabled = false;
    } else {
        // Otherwise adapt to global setting.
        global.shader_controller.shaders_enabled = global.shaders_enabled;
    }
}
