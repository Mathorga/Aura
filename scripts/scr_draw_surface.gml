///scr_draw_surface()

surface_set_target(surface);

//paint all black
draw_clear(c_black);

//draw the player
d3d_set_fog(true, c_white, 0, 1);
with(obj_player_parent){
    draw_self();
}
d3d_set_fog(false, c_white, 0, 0);

//draw the tree
with(obj_tree_one){
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_black, 0.5);
}

surface_reset_target();

shader_set(shd_leave_grey);
draw_surface(surface, 0, 0);
shader_reset();
