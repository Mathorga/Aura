///scr_draw_shadow_old(alpha, offset)

alpha = argument0;
offset = argument1;

draw_sprite_ext(sprite_index, image_index, x, y + offset, -image_xscale, 0.5, 180, c_black, alpha);
draw_self();
