///scr_enemy_slime_attack_1_state()

if (id.image_index == 2) {
    var xx = x + lengthdir_x(id.damage_distance, id.dir);
    var yy = y + lengthdir_y(id.damage_distance, id.dir);
    var damage;
    if (id.on_alt_floor) {
        damage = instance_create(xx, yy, obj_alt_damage);
    } else {
        damage = instance_create(xx, yy, obj_damage_s);
    }
    damage.alarm[0] = damage.lifetime;
    damage.creator = id;
    damage.damage = id.attack_damage[0];
}
