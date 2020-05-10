///scr_debug_draw_line(x1, y1, x2, y2, col1, col2, alpha)

var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var col1 = argument4;
var col2 = argument5;
var alpha = argument6;

if (global.debug) {
    draw_set_alpha(alpha);
    draw_line_colour(x1, y1, x2, y2, col1, col2);
    draw_set_alpha(1);
}
