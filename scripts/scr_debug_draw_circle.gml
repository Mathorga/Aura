///scr_debug_draw_circle(x, y, r, col1, col2, outline, alpha)

var x_pos = argument0;
var y_pos = argument1;
var r = argument2;
var col1 = argument3;
var col2 = argument4;
var outline = argument5;
var alpha = argument6;

if (global.debug) {
    draw_set_alpha(alpha);
    draw_circle_colour(x_pos, y_pos, r, col1, col2, outline);
    draw_set_alpha(1);
}
