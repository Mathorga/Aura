///scr_enemy_worm_set_chase_state()

if (id.state != id.chase_state) {    
    // Set action.
    id.action = RUN;
    
    // Set direction of movement and facing.
    id.dir = point_direction(id.x, id.y, id.target.x, id.target.y);
    id.face = scr_dir_to_face(id.dir);
    
    // Set movement speed.
    id.len = id.run_spd;
    
    // Set state.
    id.state = id.chase_state;
    
    // Populate the path.
    scr_define_path(id.x, id.y, id.target.x, id.target.y);
    
    // Set the initial position on the path.
    id.ai_path_pos = 1;
    
    // Set the coordinate to go to.
    id.next_x = path_get_point_x(id.ai_path, id.ai_path_pos);
    id.next_y = path_get_point_y(id.ai_path, id.ai_path_pos);
}
