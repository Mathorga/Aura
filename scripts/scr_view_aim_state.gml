///scr_view_aim_state()

if (instance_exists(target)) {
    if (hor == 0 && ver == 0) {
        dir = last_dir;
    } else {
        dir = point_direction(0, 0, hor, ver);
        last_dir = dir;
    }

    x_target = target.x + lengthdir_x(shift_spd, dir);
    y_target = target.y + lengthdir_y(shift_spd, dir);
    
    scr_follow_target(spd * 2);
}

state = scr_unlock_state;
