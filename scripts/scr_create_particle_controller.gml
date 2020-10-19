///scr_create_particle_controller()

// Only create controller if not alredy there.
if (!instance_exists(global.particle_controller)) {
    global.particle_controller = instance_create(id.x, id.y, obj_particle_controller);
}
