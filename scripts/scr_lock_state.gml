///scr_lock_state()

if (instance_exists(target)) {
    //go between target and target.nearest_enemy
    x_target = target.x + x_offset + (target.nearest_enemy.x - target.x) / 2;
    y_target = target.y + y_offset + (target.nearest_enemy.y - target.y) / 2;
    
    scr_follow_target(self.spd);
}
