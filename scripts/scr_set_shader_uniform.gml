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
} //else if (shader == shd_gaussian_blur) {
    //shader_set_uniform_f(gaussian_blur_size,
    //                     view_wview[0],
    //                     view_hview[0],
    //                     2);
//}
