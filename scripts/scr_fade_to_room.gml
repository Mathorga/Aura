///scr_fade_to_room(room, door)

// Check if there's any other fader in order not to create many of them.
if (instance_number(obj_fade_to) <= 0) {
    global.rm = argument0;
    global.rm_back = room;
    var fader = instance_create(0, 0, obj_fade_to);
    fader.door = argument1;
}
