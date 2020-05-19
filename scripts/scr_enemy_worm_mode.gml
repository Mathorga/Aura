///scr_enemy_worm_mode_new()

// Mode scripts only check for conditions to set states: state ending is set in each state setter.

var dis = undefined;

// Check if dead.
if (id.hp <= 0) {
    // State is die, since there's no more health.
    script_execute(id.set_die_state);
    return id.state;
} else {
    // Check if falling.
    if (id.falling) {
        // Falling is set to true, so state is falling.
        script_execute(id.set_fall_state);
        return id.state;
    } else {
        // Check if any player instance exists.
        if (instance_exists(global.active_character)) {
            // Set target as the nearest player.
            id.target = global.active_character;
            
            // Get distance to target.
            dis = point_distance(x, y, target.x, target.y);
        
            // Activate trigger if target is within sight.
            if (!id.triggered) {
                // Check if target is within sight.
                if (dis <= id.sight) {
                    // Start trigger alarm in order to stay triggered even if target is not in sight anymore.
                    id.alarm[2] = id.trigger_time;
                    id.triggered = true;
                } else {
                    // Target is not in sight and enemy is not triggered, so state is idle/wander.
                    script_execute(choose(id.set_idle_state, id.set_wander_state));
                    return id.state;
                }
            }
            
            // Check if target is within attack sight.
            if (dis <= id.atk_sight) {
                script_execute(id.set_attack_state);
            } else {
                // If target is out of attack sight, then chase it or idle/wander.
                if (scr_chance(60)) {
                    // There is a next step, so chase the target.
                    script_execute(id.set_chase_state);
                } else {
                    // There is no next_step, so state is idle/wander.
                    script_execute(choose(id.set_idle_state, id.set_wander_state));
                }
            }
        }
    }
}
