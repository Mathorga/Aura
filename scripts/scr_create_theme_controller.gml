///scr_create_theme_controller()

// Only create controller if not alredy there.
if (global.theme_controller == noone ||
    !instance_exists(global.theme_controller)) {
    global.theme_controller = instance_create(id.x, id.y, obj_theme_controller);
}
