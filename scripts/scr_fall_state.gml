///scr_fall_state()

action = FALL;

fallen = true;

image_speed = 20 / room_speed;
self.hor_fall_spd -= self.acceleration;
if (self.hor_fall_spd < 0) {
    self.hor_fall_spd = 0;
}
scr_move(self.hor_fall_spd, dir);

self.ver_fall_spd += self.acceleration / 2;
scr_move(self.ver_fall_spd, 270);
