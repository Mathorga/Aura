///scr_part_init_slime_blood()

global.pt_slime_blood = part_type_create();
var pt = global.pt_slime_blood;

//Fire Settings
part_type_shape(pt, pt_shape_square);
part_type_size(pt, 0.06, 0.08, 0, 0);
part_type_colour1(pt, SLIME_GREEN);
part_type_speed(pt, 2, 3, -0.1, 0);
part_type_direction(pt, 0, 180, 0, 0);
part_type_gravity(pt, 0.1, 270);
part_type_life(pt, 20, 30);
part_type_death(pt, 1, global.pt_slime_blood_stains);
