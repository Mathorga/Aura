///scr_player_control_mode()

// Every state has his way to get back to the move state.
if (interact && state == self.move_state) {
    
    var xdir = lengthdir_x(interacting_sight, dir);
    var ydir = lengthdir_y(interacting_sight, dir);
    
    // Interact.
    var interacting = instance_place(x + xdir, y + ydir, obj_interacting_parent);
    if (interacting != noone && interacting.on_alt_floor == on_alt_floor) { //there's an interacting
        if (interacting.object_index == obj_entering) {
            next_x = interacting.next_x;
            next_y = interacting.next_y;
        }
        with (interacting) {
            if (object_get_parent(object_index) == obj_speaker_parent) {
                scr_start_dialog();
            } else if (object_get_parent(object_index) == obj_player_passive_parent) {
                scr_start_player_dialog();
                self.mobility = false;
            } else if (object_index == obj_bonfire) {
                scr_save_game();
            } else if (object_index == obj_entering) {
                scr_enter();
            } else if (object_get_parent(object_index) == obj_chest_parent) {
                scr_open_chest();
            }
        }
    }
}
if (roll && state == self.move_state) {
        if (energy >= ROLL_COST) {
            //roll
            image_index = 0;
            state = scr_roll_state;
            //alarm[0] = room_speed / 1.5;
            energy -= ROLL_COST;
            if (climbing) {
                old_dir = scr_face_to_dir(face);
            } else {
                old_dir = dir;
            }
        }
    //}
} else if (attack_x && state == self.move_state && energy >= ATK_X_COST) {
    //light attack
    image_index = 0;
    self.move_spd = 0;
    state = scr_attack_x_state;
    energy -= ATK_X_COST;
} else if (attack_y && state == self.move_state && energy >= ATK_Y_COST) {
    //heavy_attack
    image_index = 0;
    self.move_spd = 0;
    state = scr_attack_y_state;
    energy -= ATK_Y_COST;
} else if (aim && state == self.move_state) {
    state = scr_aim_state;
} else if (falling) {
    acceleration = 0.05;
    mobility = false;
    if (!fallen) {
        image_index = 0;
        hor_fall_spd = 2 * walk_spd;
        ver_fall_spd = walk_spd;
    }
    state = scr_fall_state;
} else if (drowning) {
    acceleration = 0.1;
    mobility = false;
    if (!drowned) {
        image_index = 0;
        hor_fall_spd = run_spd;
        ver_fall_spd = walk_spd;
    }
    state = scr_drown_state;
}
