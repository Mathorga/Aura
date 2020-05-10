///scr_move_state()

image_speed = 8 / room_speed;

if (alarm[2] <= 0 && len != 0) {
    if (scr_chance(50)) {
        var dust = instance_create(x, y, obj_dust_cloud);
        dust.on_alt_floor = on_alt_floor;
    }
    alarm[2] = room_speed / 2;
}

if (hor == 0 && ver == 0) {
    self.action = STAND;
    //self.len = 0;
    if (self.move_spd > 0) {
        self.move_spd -= self.inertia;
    } else {
        self.move_spd = 0;
    }
    self.len = self.move_spd;
} else {
    if (point_distance(0, 0, hor, ver) < 0.6 || walk) {
        action = WALK;
        //len = walk_spd;
        self.move_spd += self.inertia;
        
        if (self.move_spd > self.walk_spd) {
            self.move_spd = self.walk_spd;
        }
        len = self.move_spd;
    } else {
        action = RUN;
        //len = run_spd;
        self.move_spd += self.inertia;
        
        if (self.move_spd > self.run_spd) {
            self.move_spd = self.run_spd;
        }
        len = self.move_spd;
    }
    
    dir = point_direction(0, 0, hor, ver);
    
    face = scr_dir_to_face(dir);
    
    // Stairs control
    scr_get_stairs_dir();
}

scr_move(len, dir);

/*if (self.make_footprints && alarm[5] < 0 && self.len > 0) {
    if (self.footprint != noone) {
        side = self.footprint_side;
        self.footprint = instance_create(self.x, self.y, obj_footprints);
        self.footprint.owner = self.id;
        self.footprint.dir = dir - 90;
        self.footprint.depth = self.depth;
        if (side == LEFT) {
            self.footprint.side = RIGHT;
            self.footprint_side = RIGHT;
        } else {
            self.footprint.side = LEFT;
            self.footprint_side = LEFT;
        }
    } else {
        self.footprint = instance_create(x, y, obj_footprints);
        self.footprint.owner = id;
        self.footprint.dir = dir;
        self.footprint.depth = depth;
    }
    var fx_index = irandom(19);
    audio_play_sound(self.snd_fx[SNOW_FOOTSTEP, fx_index], 10, false);
    alarm[5] = room_speed / 2;
}*/
