///scr_follow_target(spd)

var follow_spd = argument0;

dir = point_direction(x, y, x_target, y_target);
len = point_distance(x, y, x_target, y_target) * follow_spd;

self.x += lengthdir_x(len, dir);
self.y += lengthdir_y(len, dir);
