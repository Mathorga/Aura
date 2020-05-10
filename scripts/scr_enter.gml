///scr_enter()

// Enter.
//show_debug_message("Entered door");
instance_destroy(signal);
signal = noone;
scr_fade_to_room(new_room, true);
//instance_create(x, y + 50, obj_entering);
