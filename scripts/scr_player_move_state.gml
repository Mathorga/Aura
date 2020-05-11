///scr_player_move_state()

var create_footprint = false;
image_speed = 8 / room_speed;

if (alarm[2] <= 0 && len != 0) {
    if (scr_chance(50)) {
        var dust = instance_create(x, y, obj_dust_cloud);
        dust.on_alt_floor = self.on_alt_floor;
    }
    alarm[2] = room_speed / 2;
}

if (self.mobility) {
    if (self.hor == 0 && self.ver == 0) {
        if (self.move_spd > 0) {
            self.move_spd -= self.inertia;
        } else {
            self.move_spd = 0;
        }
    } else {
        //self.move_spd += self.inertia;
        if (point_distance(0, 0, self.hor, self.ver) < 0.6 || self.walk) {
            if (round(self.move_spd) > self.walk_spd) {
                //self.move_spd = self.walk_spd;
                self.move_spd -= self.inertia;
            } else if (round(self.move_spd) < self.walk_spd) {
                self.move_spd += self.inertia;
            }
        } else {
            if (round(self.move_spd) > self.run_spd) {
                //self.move_spd = self.run_spd;
                self.move_spd -= self.inertia;
            } else if (round(self.move_spd) < self.run_spd) {
                self.move_spd += self.inertia;
            }
        }
        
        self.dir = point_direction(0, 0, self.hor, self.ver);
        
        self.face = scr_dir_to_face(self.dir);
        
        // Stairs control
        scr_get_stairs_dir();
    }
}

// Set move length.
self.len = self.move_spd;

// Set action.  
if (self.len > self.walk_spd) {
    self.action = RUN;
    image_speed = 12 / room_speed;
} else if (self.len > 0 && self.len <= self.walk_spd) {
    self.action = WALK;
    image_speed = 8 / room_speed;
} else {
    self.action = STAND;
}

scr_move(self.len, self.dir);

if (self.make_footprints && self.len > 0) {    
    switch (self.action) {
        case RUN:
            if (floor(self.image_index) == 5 || floor(self.image_index) == 11) {
                create_footprint = true;
            } else {
                create_footprint = false;
            }
            break;
        case WALK:
            if (floor(self.image_index) == 5 || floor(self.image_index) == 11) {
                create_footprint = true;
            } else {
                create_footprint = false;
            }
            break;
        default:
            create_footprint = false;
            break;
    }
    
    if (create_footprint) {
        if (self.footprint != noone && self.footprint != undefined && instance_exists(self.footprint)) {
            if (self.footprint.activation_frame != floor(self.image_index)) {
                side = self.footprint_side;
                self.footprint = instance_create(self.x, self.y, obj_footprints);
                self.footprint.owner = self.id;
                self.footprint.dir = dir - 90;
                self.footprint.depth = self.depth;
                self.footprint.activation_frame = floor(self.image_index);
                if (side == LEFT) {
                    self.footprint.side = RIGHT;
                    self.footprint_side = RIGHT;
                } else {
                    self.footprint.side = LEFT;
                    self.footprint_side = LEFT;
                }
            }
        } else {
            self.footprint = instance_create(x, y, obj_footprints);
            self.footprint.owner = id;
            self.footprint.dir = dir;
            self.footprint.depth = depth;
            self.footprint.activation_frame = floor(self.image_index);
        }
        var fx_index = irandom(19);
        audio_play_sound(self.snd_fx[SNOW_FOOTSTEP, fx_index], 10, false);
    } else {
        self.footprint = noone;
    }
}
