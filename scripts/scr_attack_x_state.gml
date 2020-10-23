///scr_attack_x_state()

action = ATK_X;

image_speed = 20 / room_speed;

//do what you've been created for
if (image_index == 2 && !attacked) {
    var xx = 0; 
    var yy = 0;
    switch (face) {
        case LEFT:
            xx = x - DMG_DISTANCE;
            yy = y;
            break;
        case RIGHT:
            xx = x + DMG_DISTANCE;
            yy = y;
            break;
        case UP:
            xx = x;
            yy = y - DMG_DISTANCE;
            break;
        case DOWN:
            xx = x;
            yy = y + DMG_DISTANCE;
            break; 
    }
    var damage;
    /*if (on_alt_floor) {
        damage = instance_create(xx, yy, obj_alt_damage);
    } else {
        damage = instance_create(xx, yy, obj_main_damage);
    }*/
    damage = instance_create(xx, yy, obj_damage_s);
    damage.alarm[0] = 5;
    damage.creator = id;
    if (scr_chance(crit_rate)) {
        damage.damage = attack_x_dmg * crit_damage;
        damage.critical = true;
        // Show crit.
        //spec = instance_create(xx, yy, obj_special_damage);
        //spec.crit = true;
    } else if (scr_chance(fail_rate)) {
        damage.damage = attack_x_dmg * fail_damage;
        damage.fail = true;
        // Show fail.
        //spec = instance_create(xx, yy, obj_special_damage);
        //spec.crit = false;
    } else {
        damage.damage = attack_x_dmg;
    }
    attacked = true;
}

if ((image_index > image_number / 2) && attack_x) {
    xx_combo = true;
    attacked = false;
}
