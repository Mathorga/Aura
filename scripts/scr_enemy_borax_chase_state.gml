///scr_enemy_borax_chase_state()

// Decelerate chase.
if (self.len > 0.5) {
    self.len = point_distance(self.x, self.y, target.x, target.y) / 50;
    //self.len -= self.chase_deceleration;
}

scr_move(self.len, self.dir);
