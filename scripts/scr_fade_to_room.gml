///scr_fade_to_room(room, door, fast)

var rm = argument[0];
var door = argument[1];
var fast = argument[2];

global.rm = rm;
global.rm_back = room;
var fader = instance_create(0, 0, obj_fade_to);
fader.door = door;
if (fast) {
    fader.fade_speed *= 5;
}
