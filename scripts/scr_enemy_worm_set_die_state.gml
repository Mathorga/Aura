///scr_enemy_worm_set_die_state()

if (self.state != self.die_state) {
    // Set action.
    self.action = DIE;
    
    self.state = self.die_state;

    // Force image index to 0 in order to start animations from the beginning.
    self.image_index = 0;
}
