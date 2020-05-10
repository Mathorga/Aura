///scr_enemy_worm_set_fall_state()

if (self.state != self.fall_state) {
    // Set action.
    self.action = FALL;
    
    // Set fallen flag.
    self.fallen = true;
    self.mobility = false;
    
    // Set image speed for fall state.
    // To Fix: image speed should be the same across all sprites.
    image_speed = 20 / room_speed;
    
    // Set state.
    self.state = self.fall_state;
}
