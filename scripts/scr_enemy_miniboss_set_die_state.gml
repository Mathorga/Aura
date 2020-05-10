///scr_enemy_miniboss_set_die_state()

if (self.state != self.die_state) {
    // Set action.
    self.action = DIE;
    
    self.state = self.die_state;
    
    self.image_index = 0;
}
