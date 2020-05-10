///scr_enemy_worm_set_wander_state()

if (self.state != self.wander_state) {
    // Set action.
    self.action = WALK;
    
    // Set wander movement speed to walk speed.
    self.len = self.walk_spd;
    
    // Set a random direction between 0 and 360.
    self.dir = random(360);
    
    // Calculate the facing based on the picked direction.
    self.face = scr_dir_to_face(self.dir);
    
    // Start timer to end state.
    alarm[0] = room_speed;
    
    // Set state.
    self.state = self.wander_state;
}
