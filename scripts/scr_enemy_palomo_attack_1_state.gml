///scr_enemy_palomo_attack_1_state()

self.action = ATK_1;

if (image_index == 7) {
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
    damage.damage = self.attack_damage[0];
}
