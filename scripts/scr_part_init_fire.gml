///scr_part_init_fire()

global.pt_fire = part_type_create();
var pt = global.pt_fire;

//Fire Settings
//part_type_sprite(pt, spr_part, false, false, false);
part_type_shape(pt, pt_shape_square);
part_type_size(pt, 0.06, 0.08, 0, 0);
part_type_colour3(pt, c_red, c_orange, c_dkgray);
part_type_alpha2(pt, 0.8, 0.4);
part_type_speed(pt, 0.5, 1, -0.1, 0);
part_type_direction(pt, 0, 360, 0, 0);
part_type_gravity(pt, 0.1, 90);
part_type_life(pt, 25, 100);
