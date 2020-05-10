///scr_aim_state()

if (shoot) {
    var arrow;
    if (on_alt_floor) {
        arrow = instance_create(x, y, obj_alt_projectile);
    } else {
        arrow = instance_create(x, y, obj_main_projectile);
    }
    var xforce = lengthdir_x(40, point_direction(x, y, obj_view.x, obj_view.y));
    var yforce = lengthdir_y(40, point_direction(x, y, obj_view.x, obj_view.y));
    arrow.creator = id;
    arrow.damage = arrow_dmg;
    with (arrow) {
        physics_apply_impulse(x, y, xforce, yforce);
    }
}

var aim_dir = point_direction(x, y, obj_view.x, obj_view.y);

if (hor == 0 && ver == 0) {
    action = AIM_STAND;
    len = 0;
} else {
    dir = point_direction(0, 0, hor, ver);
    
    //Test if the moving direction is opposite to the aim direction
    if (angle_difference(dir, aim_dir) > 90 || angle_difference(dir, aim_dir) < -90) {
        image_speed = 6 / room_speed;
        action = AIM_WALK_BACK;
    } else {
        image_speed = 8 / room_speed;
        action = AIM_WALK;
    }
    
    len = walk_spd;
}

face = scr_dir_to_face(aim_dir);

scr_move(len, dir);

//reset move state
state = self.move_state;
