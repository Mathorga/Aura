///scr_draw_world()

/*
 * Draw application_surface to buffer with shader 1.
 * Draw buffer to application_surface with shader 2.
 * Draw application_surface to buffer with shader 3.
 * Draw buffer to application_surface with shader 4.
 * ...
 */

// Draw the current surface with the 1st shader.
surface_set_target(global.buffer);
if (global.shader_a != noone) {
    shader_set(global.shader_a);
    scr_set_shader_uniform(global.shader_a);
    draw_surface(application_surface, 0, 0);
    //draw_surface_stretched(application_surface, 0, 0, window_get_width(), window_get_height());
}
shader_reset();
surface_reset_target();

// Draw the current surface with the 2nd shader.
surface_set_target(application_surface);
if (global.shader_b != noone) {
    shader_set(global.shader_b);
    scr_set_shader_uniform(global.shader_b);
    draw_surface(global.buffer, 0, 0);
    //draw_surface_stretched(global.buffer, 0, 0, window_get_width(), window_get_height());
}
shader_reset();
surface_reset_target();

// Draw the current surface with the 3rd shader.
surface_set_target(global.buffer);
if (global.shader_c != noone) {
    shader_set(global.shader_c);
    scr_set_shader_uniform(global.shader_c);
    draw_surface(application_surface, 0, 0);
    //draw_surface_stretched(application_surface, 0, 0, window_get_width(), window_get_height());
}
shader_reset();
surface_reset_target();

// Draw the final result.
draw_surface(global.buffer, 0, 0);
//draw_surface_stretched(global.buffer, 0, 0, window_get_width(), window_get_height());
