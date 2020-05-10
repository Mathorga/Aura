///scr_roll_state 

id.action = ROLL;

id.len = id.roll_spd;

image_speed = 12 / room_speed;

scr_get_stairs_dir();

if (!climbing) {
    id.dir = old_dir;
}

scr_move(id.len, id.dir);
