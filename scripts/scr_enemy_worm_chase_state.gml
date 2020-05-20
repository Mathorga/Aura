///scr_enemy_worm_chase_state()

// Move.
//scr_move(self.len, self.dir);
//mp_potential_step(id.target.x, id.target.y, 1, false);

// If the path is empty, then populate it.
if (path_get_number(id.ai_path) < 1) {
    scr_define_path(id.x, id.y, id.target.x, id.target.y);
}
