///scr_enemy_worm_fall_state()

// Move horizontally.
self.hor_fall_spd -= self.acceleration;
if (self.hor_fall_spd < 0) {
    self.hor_fall_spd = 0;
}
scr_move(self.hor_fall_spd, self.dir);

// Move vertically.
self.ver_fall_spd += self.acceleration / 2;
scr_move(self.ver_fall_spd, 270);
