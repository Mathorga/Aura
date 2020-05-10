///scr_stay_mode()

/*
if (aggro && alarm[4] <= 0) {
    //attack aggred enemy
    if (instance_exists(target_enemy) &&
        energy >= ATK_X_COST &&
        point_distance(x, y, target_enemy.x, target_enemy.y) < safe_zone) {
        dir = point_direction(x, y, target_enemy.x, target_enemy.y);
        face = scr_dir_to_face(dir);
        image_index = 0;
        state = scr_attack_x_state;
        energy -= ATK_X_COST;
        alarm[4] = room_speed * 3;
    } else {
        aggro = false;
    }
} else if (aggro && alarm[4] > 0 && state != scr_attack_x_state) {
    var safe_len = point_distance(x, y, mate.x, mate.y);
    var safe_dir = point_direction(x, y, mate.x, mate.y);
    hor = lengthdir_x(safe_len, safe_dir);
    ver = lengthdir_y(safe_len, safe_dir);
    state = scr_move_state;
    if (safe_len <= safe_zone) {
        alarm[4] = -1;
    }
} else if (falling) {
    acceleration = 0.05;
    mobility = false;
    if (!fallen) {
        image_index = 0;
        hor_fall_spd = 2 * walk_spd;
        ver_fall_spd = walk_spd;
    }
    state = scr_fall_state;
} else if (drowning) {
    acceleration = 0.1;
    mobility = false;
    if (!drowned) {
        image_index = 0;
        hor_fall_spd = run_spd;
        ver_fall_spd = walk_spd;
    }
    state = scr_drown_state;
} else {
    //if an enemy comes too close
    nearest_enemy = instance_nearest(x, y, obj_enemy_parent);
    if (instance_exists(nearest_enemy) && point_distance(x, y, nearest_enemy.x, nearest_enemy.y) < safe_zone) {
        target_enemy = nearest_enemy;
        aggro = true;
    } else  if (alarm[3] <= 0) {
        if (scr_chance(10)) {
            // Random between -0.2 and 0.2
            hor = random(0.4) - 0.2;
            ver = random(0.4) - 0.2;
        } else {
            hor = 0;
            ver = 0;
        }
        state = scr_move_state;
        alarm[3] = room_speed;
    }
}
*/
