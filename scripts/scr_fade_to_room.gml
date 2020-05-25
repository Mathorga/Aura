///scr_fade_to_room(room, door)

global.rm = argument[0];
global.rm_back = room;
var fader = instance_create(0, 0, obj_fade_to);
fader.door = argument[1];
