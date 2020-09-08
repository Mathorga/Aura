///scr_create_parallax_controller()

// Only create controller if not alredy there.
if (global.parallax_controller == noone ||
    !instance_exists(global.parallax_controller)) {
    global.parallax_controller = instance_create(id.x, id.y, obj_parallax_controller);
}
