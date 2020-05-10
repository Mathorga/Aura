///scr_enemy_worm_set_chase_state()

if (self.state != self.chase_state) {
    var next_step = self.tile_position.next;
    
    // Set action.
    self.action = RUN;
    
    // Set direction of movement and facing.
    self.dir = point_direction(self.x, self.y, next_step.x, next_step.y);
    self.face = scr_dir_to_face(self.dir);
    
    // Set movement speed.
    self.len = self.run_spd;
    
    // Set state.
    self.state = self.chase_state;
}
