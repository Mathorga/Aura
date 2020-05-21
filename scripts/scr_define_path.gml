///scr_define_path(start_x, start_y, end_x, end_y)

var start_x = argument[0];
var start_y = argument[1];
var end_x = argument[2];
var end_y = argument[3];

var res = false;

// Try and find a path. If a path is found, set its kind and precision to make it smoother.
if (!mp_grid_path(global.ai_grid, id.ai_path, start_x, start_y, end_x, end_y, true)) {
    show_debug_message("ERROR: scr_define_path() - No path created");
} else {
    path_set_kind(id.ai_path, 1);
    path_set_precision(id.ai_path, 8);
    res = true;
}

return res;
