///scr_enemy_miniboss_mode()

// Mode scripts only check for conditions to set states: state ending is set in each state setter.

var dis = undefined;
var next_step = undefined;

// Check if dead.
if (self.hp <= 0) {
    // State is die, since there's no more health.
    script_execute(self.set_die_state);
} else {
    // Check if falling.
    if (self.falling) {
        // Falling is set to true, so state is falling.
        script_execute(self.set_fall_state);
    } else {
        // Check if any player instance exists.
        if (instance_exists(obj_player_parent)) {
            // Set target as the nearest player.
            self.target = instance_nearest(self.x, self.y, obj_player_parent);
        
            // Get distance to target.
            dis = point_distance(self.x, self.y, self.target.x, self.target.y);
        
            // Activate trigger if target is within sight.
            if (!self.triggered) {
                // Check if target is within sight.
                if (dis <= self.sight) {
                    // Start trigger alarm in order to stay triggered even if target is not in sight anymore.
                    self.alarm[2] = self.trigger_time;
                    self.triggered = true;
                } else {
                    // Target is not in sight and enemy is not triggered, so state is idle.
                    script_execute(self.set_idle_state);
                    return self.state;
                }
            }
            
            // Check if target is within attack sight.
            if (dis <= self.atk_sight) {
                script_execute(self.set_attack_state);
            } else {
                // If target is out of attack sight, then chase it or idle.
    
                // Set next step.
                if (self.tile_position != undefined && instance_exists(self.tile_position)) {                
                    // Check if there is a next step.
                    //TODO Fix: change instance_exists to a direct check on next_step's value.
                    if (instance_exists(self.tile_position.next)) {
                        // There is a next step, so follow it.
                        script_execute(self.set_chase_state);
                    } else {
                        // There is no next_step, so state is idle.
                        script_execute(self.set_idle_state);
                    }
                } else {
                    // For some reason there is no next step, so state is idle.
                    script_execute(self.set_idle_state);
                }
            }
            return self.state;
        }
    }
}

return self.state;
