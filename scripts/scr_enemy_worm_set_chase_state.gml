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
}
