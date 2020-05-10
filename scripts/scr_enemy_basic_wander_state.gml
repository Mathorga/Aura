///scr_enemy_basic_wander_state()

scr_move(len, dir);

if (self.alarm[0] <= 0) {
    script_execute(self.mode);
}
