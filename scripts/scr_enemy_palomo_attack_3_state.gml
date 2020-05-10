///scr_enemy_palomo_attack_3_state()

self.action = ATK_3;

if (self.gliding) {
    self.action = ATK_3_1;
    
    // Set target point in order to glide to it.
    self.dir = point_direction(self.x, self.y, self.glide_target_x, self.glide_target_y);
    self.face = scr_dir_to_face(self.dir);
    
    // Move by a fraction of the distance between self and the glide_target.
    scr_move(self.glide_dist / ((1 / self.image_speed) * self.image_number), self.dir);
    
    //TODO Correctly change from frame to collision.
    if (/*position_meeting(self.x, self.y, target)*/floor(self.image_index) == (self.image_number - 2)) {
        var xx = x + lengthdir_x(self.damage_distance, self.dir);
        var yy = y + lengthdir_y(self.damage_distance, self.dir);
        var damage;
    
        if (on_alt_floor) {
            damage = instance_create(xx, yy, obj_alt_damage);
        } else {
            damage = instance_create(xx, yy, obj_main_damage);
        }
        damage.alarm[0] = damage.lifetime;
        damage.creator = self.id;
        damage.damage = self.attack_damage[2];
    }
} else {
    if (instance_exists(target)) {
        // Just point to the target.
        self.dir = point_direction(self.x, self.y, self.target.x, self.target.y);
        self.face = scr_dir_to_face(self.dir);
    }
}
