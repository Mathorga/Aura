///scr_part_init_snow()

global.pt_snow = part_type_create();
var pt = global.pt_snow;

//Fire Settings
part_type_shape(pt, pt_shape_square);
part_type_size(pt, 0.05, 0.1, 0, 0);
part_type_colour1(pt, c_gray);
part_type_speed(pt, 2, 3, 0, 0);
part_type_direction(pt, 270, 270, 0, 10);
part_type_gravity(pt, 0.05, 200);
part_type_life(pt, 300, 300);
part_type_alpha2(pt, 1, 0.5);
