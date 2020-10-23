///scr_set_shader_uniform(shader)

var shader = argument0;

// Find the right shader and apply uniforms.
if (shader == shd_chromatic_aberration) {
    shader_set_uniform_f(aberration_intensity,
                         global.shake_intensity);
} else if (shader == shd_motion_blur) {
    shader_set_uniform_f(motion_blur_origin,
                         (obj_view.target.x - view_xview) / view_wview,
                         (obj_view.target.y - view_yview) / view_hview);
} else if (shader == shd_gaussian_blur) {
    shader_set_uniform_f(gaussian_blur_screen_size,
                         display_get_width(),
                         display_get_height());

    // Set default center to screen center.
    var center_x = display_get_width() / 2;
    var center_y = display_get_height() / 2;
    
    // If camera exists, set center to camera position.
    if (instance_exists(global.camera)) {
        // Camera position needs to be mapped to screen coordinates as follows.
        center_x = ((global.camera.x - view_xview[0]) * display_get_width()) / view_wview[0];
        center_y = ((global.camera.y - view_yview[0]) * display_get_height()) / view_hview[0];
    }
    shader_set_uniform_f(gaussian_blur_center,
                         center_x,
                         center_y);
    
    if (global.ambient == AMBIENT_SAFE) {
        shader_set_uniform_f(gaussian_blur_intensity,
                             2.0);
    } else {
        shader_set_uniform_f(gaussian_blur_intensity,
                             6.0);
    }
}
