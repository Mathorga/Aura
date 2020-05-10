///scr_enemy_borax_attack_2_state()

if (self.image_index == 2) {
    var xx = x + lengthdir_x(self.damage_distance, self.dir);
    var yy = y + lengthdir_y(self.damage_distance, self.dir);
    var damage;
    if (self.on_alt_floor) {
        damage = instance_create(xx, yy, obj_alt_damage);
    } else {
        damage = instance_create(xx, yy, obj_main_damage);
    }
    damage.alarm[0] = 5;
    damage.creator = self.id;
    damage.damage = self.attack_damage[1];
}
