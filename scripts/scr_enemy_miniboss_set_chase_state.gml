///scr_enemy_miniboss_set_chase_state()

if (self.state != self.chase_state) {
    var next_step = self.tile_position.next;
    
    // Set action.
    self.action = RUN;
    
    // Set image speed to a higher rate (to be removed: animation should be drawn according to the right speed).
    self.image_speed = 8 / room_speed;
    
    // Set direction of movement and facing.
    self.dir = point_direction(self.x, self.y, next_step.x, next_step.y);
    self.face = scr_dir_to_face(self.dir);
    
    // Set movement speed to match the distance to the target.
    //self.len = point_distance(self.x, self.y, self.target.x, self.target.y) / (sprite_get_number(self.sprite[self.action, self.face]) / self.image_speed);
    // Set movement speed.
    self.len = self.run_spd;
    
    self.state = self.chase_state;
    
    self.image_index = 0;
}
