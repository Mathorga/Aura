///scr_enemy_basic_mode()

// Mode scripts only check for conditions to set states: state ending is set in each state setter.

var dis = undefined;

// Check if dead.
if (self.hp <= 0) {
    // State is die, since there's no more health.
    script_execute(self.set_die_state);
    return self.state;
} else {
    // Check if falling.
    if (self.falling) {
        // Falling is set to true, so state is falling.
        script_execute(self.set_fall_state);
        return self.state;
    } else {
        // Check if any player instance exists.
        if (instance_exists(obj_player_parent)) {
            // Set target as the nearest player.
            self.target = instance_nearest(x, y, obj_player_parent);
            
            // Get distance to target.
            dis = point_distance(x, y, target.x, target.y);
        
            // Activate trigger if target is within sight.
            if (!self.triggered) {
                // Check if target is within sight.
                if (dis <= self.sight) {
                    // Start trigger alarm in order to stay triggered even if target is not in sight anymore.
                    self.alarm[2] = self.trigger_time;
                    self.triggered = true;
                } else {
                    // Target is not in sight and enemy is not triggered, so state is idle/wander.
                    script_execute(choose(self.set_idle_state, self.set_wander_state));
                    return self.state;
                }
            }
            
            if (self.triggered) {
                // Check if target is within attack sight.
                if (dis <= self.atk_sight) {
                    // Palomo wants a parameter for attack setting, which is attack index.
                    script_execute(self.set_attack_state, -1);
                } else {
                    // If target is out of attack sight, then chase or idle/wander.
                    // Set next step.
                    if (self.tile_position != undefined && instance_exists(self.tile_position)) {                
                        // Check if there is a next step.
                        //TODO Fix: change instance_exists to a direct check on next_step's value.
                        if (instance_exists(self.tile_position.next)) {
                            // There is a next step, so chase the target.
                            script_execute(self.set_chase_state);
                        } else {
                            // There is no next_step, so state is idle/wander.
                            script_execute(choose(self.set_idle_state, self.set_wander_state));
                        }
                    } else {
                        // For some reason there is no next step, so state is idle/wander.
                        script_execute(choose(self.set_idle_state, self.set_wander_state));
                    }
                }
            } else {
                // Not triggred, so state is idle/wander.
                script_execute(choose(self.set_idle_state, self.set_wander_state));
            }
        }
    }
}
