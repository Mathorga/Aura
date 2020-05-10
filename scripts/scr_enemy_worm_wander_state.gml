///scr_enemy_worm_wander_state()

// Move.
scr_move(self.len, self.dir);

if (self.alarm[0] <= 0) {
    script_execute(self.mode);
}
