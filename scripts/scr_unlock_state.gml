///scr_unlock_state()

if (instance_exists(target)) {
    shift_x = hor * shift_spd;
    shift_y = ver * shift_spd;    

    x_target = target.x + x_offset + shift_x;
    y_target = target.y + y_offset + shift_y;
    
    scr_follow_target(spd);
}
