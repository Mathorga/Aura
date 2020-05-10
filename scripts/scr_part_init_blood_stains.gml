///scr_part_init_blood_puddles()

global.pt_blood_stains = part_type_create();
var pt = global.pt_blood_stains;

//Blood Puddles Settings
part_type_shape(pt, pt_shape_disk);
part_type_colour1(pt, c_maroon);
part_type_scale(pt, 1, 0.5);
//part_type_sprite(pt, spr_blood_stain, false, false, false);
part_type_size(pt, 0.15, 0.18, 0, 0);
part_type_alpha2(pt, 1, 0.3);
part_type_life(pt, 30, 50);
