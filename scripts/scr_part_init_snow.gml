///scr_part_init_snow()

if (!part_type_exists(global.pt_snow)) {
    global.pt_snow = part_type_create();
}

var pt = global.pt_snow;
//var snow_emitter = part_emitter_create(global.ps_falling);
//part_emitter_stream(global.ps_falling, snow_emitter, pt, 10);

//Fire Settings
part_type_shape(pt, pt_shape_square);
part_type_size(pt, 0.02, 0.06, 0, 0);
part_type_colour1(pt, c_white);
part_type_speed(pt, 2, 5, 0, 0);
part_type_direction(pt, 220, 260, 0, 50);
part_type_gravity(pt, 0.05, 200);
part_type_life(pt, 200, 200);
part_type_alpha2(pt, 1, 0.5);
