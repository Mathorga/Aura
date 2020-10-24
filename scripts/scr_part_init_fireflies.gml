///scr_part_init_fireflies()

if (!part_type_exists(global.pt_fireflies)) {
    global.pt_fireflies = part_type_create();
}

var pt = global.pt_fireflies;

//Fire Settings
//part_type_sprite(pt, spr_part, false, false, false);
part_type_shape(pt, pt_shape_square);
part_type_size(pt, 0.02, 0.04, 0, 0);
part_type_colour3(pt, c_yellow, c_orange, c_red);
part_type_alpha3(pt, 0.0, 0.8, 0.4);
part_type_speed(pt, 0.5, 2.4, -0.05, 0);
part_type_direction(pt, 30, 150, 0, 0);
part_type_gravity(pt, 0.05, 270);
part_type_life(pt, 25, 50);
