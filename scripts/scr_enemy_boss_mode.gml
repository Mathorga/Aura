///scr_enemy_boss_mode()

if (falling) {
    fallen = false;
    mobility = false;
    alarm[0] = room_speed * (2 / 3);
    state = scr_fall_state;
} else if (instance_exists(obj_player_parent)) {
    target = instance_nearest(x, y, obj_player_parent);
    var dis = point_distance(x, y, target.x, target.y);
    if (dis <= sight) {
        dir = point_direction(x, y, target.x, target.y);
        if (dis <= atk_sight && !attacked && energy >= ATK_X_COST) {
            image_index = 0;
            // Randomly choose the attack within the attacks of the enemy.
            var state_num = irandom(ds_list_size(attacks) - 1);
            state = ds_list_find_value(attacks, state_num);
            energy -= ATK_X_COST;
        } else {
            state = scr_enemy_basic_chase_state;
        }
    } else {
        if (alarm[0] <= 0) {
            state = choose(scr_enemy_basic_wander_state, scr_enemy_basic_idle_state);
            alarm[0] = room_speed;
        
            if (state == scr_enemy_basic_wander_state) {
                dir = random(360);
            }
        }
    }
} else {
    if (alarm[0] <= 0) {
        state = choose(scr_enemy_basic_wander_state, scr_enemy_basic_idle_state);
        alarm[0] = room_speed;
    
        if (state == scr_enemy_basic_wander_state) {
            dir = random(360);
        }
    }
}
