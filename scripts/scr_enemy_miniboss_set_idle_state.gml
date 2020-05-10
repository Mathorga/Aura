///scr_enemy_miniboss_set_idle_state()

if (self.state != self.idle_state) {
    // Set action.
    self.action = STAND;
    
    // Start timer to end state.
    alarm[0] = room_speed;
    
    // Set state.
    self.state = self.idle_state;
    
    self.image_index = 0;
}
