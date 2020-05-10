///scr_attack_xx_state()

action = ATK_XX;

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

if (floor(image_index) == 2 && !attacked) {
    // First hit
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
} else if (floor(image_index) > 2 && floor(image_index) < 8) {
    // Not hitting
    attacked = false;
} else if (floor(image_index) == 8 && !attacked) {
    // Second hit
    var damage;
    if (on_alt_floor) {
        damage = instance_create(xx, yy, obj_alt_damage);
    } else {
        damage = instance_create(xx, yy, obj_main_damage);
    }
    damage.alarm[0] = 20;
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

scr_get_stairs_dir();
if (!climbing) {
    dir = old_dir;
}
len -= slowing;

if (len < 0) {
    len = 0;
}

scr_move(len, dir);
