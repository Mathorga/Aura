///scr_rapter_atk_1_state()

action = ATK_1;

if (image_index == 2 && !attacked) {
    var xx = x + lengthdir_x(self.damage_distance, dir);
    var yy = y + lengthdir_y(self.damage_distance, dir);
    var damage;
    if (on_alt_floor) {
        damage = instance_create(xx, yy, obj_alt_damage);
    } else {
        damage = instance_create(xx, yy, obj_main_damage);
    }
    damage.alarm[0] = 5;
    damage.creator = id;
    damage.damage = attack_x_dmg;
    attacked = true;
}
