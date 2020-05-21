///scr_enemy_worm_chase_state()

// Move.
//scr_move(self.len, self.dir);
//mp_potential_step(id.target.x, id.target.y, 1, false);

var dir_diff = 0;

// MAGIC NUMBER!!!
if (point_distance(id.x, id.y, id.next_x, id.next_y) < 8) {
    id.ai_path_pos++;
    
    if (id.ai_path_pos == path_get_number(id.ai_path)) {
        //TODO
    } else {
        id.next_x = path_get_point_x(id.ai_path, id.ai_path_pos);
        id.next_y = path_get_point_y(id.ai_path, id.ai_path_pos);
    }
}

mp_potential_step(id.next_x, id.next_y, id.run_spd, false);

dir_diff = angle_difference(point_direction(id.x, id.y, id.next_x, id.next_y), id.dir);

// MAGIC NUMBER!!!
id.dir += clamp(dir_diff, -3, 3);
