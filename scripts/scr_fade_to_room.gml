///scr_fade_to_room(room, door)

global.rm = argument0;
global.rm_back = room;
instance_create(0, 0, obj_fade_to);
obj_fade_to.door = argument1;
