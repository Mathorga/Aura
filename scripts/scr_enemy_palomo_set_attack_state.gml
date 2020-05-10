///scr_enemy_palomo_set_attack_state(atk_index)

// Check if current state is an attack state. if so don't reset it.
if (ds_list_find_index(self.attacks, self.state) == -1) {
    var atk_index = argument[0];
    
    if (ds_list_size(self.attacks) > 0) {
        if (atk_index < 0) {
            // Randomly choose the attack within the attacks of the enemy if the given index is less than 0.
            atk_index = irandom(ds_list_size(self.attacks) - 1);
        }
        
        self.state = ds_list_find_value(self.attacks, atk_index);
    } else {
        // If the enemy only has one attack, pick that one.
        self.state = ds_list_find_value(self.attacks, atk_index);
    }
    
    // Force image index to 0 in order to start animetions from the beginning.
    self.image_index = 0;
    
    // Set action.
    self.action = self.attack_actions[atk_index];
    
    // Set direction and facing for attack.
    self.dir = point_direction(self.x, self.y, self.target.x, self.target.y);
    self.face = scr_dir_to_face(self.dir);
    
    // Reduce energy
    self.energy -= self.attack_cost;
}
