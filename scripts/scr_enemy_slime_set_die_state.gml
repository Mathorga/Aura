///scr_enemy_slime_set_die_state()

if (self.state != self.die_state) {
    // Set action.
    self.action = DIE;
    
    self.state = self.die_state;
    
    self.image_index = 0;
    
    // Slow down the animation.
    self.image_speed = 6 / room_speed;
}
