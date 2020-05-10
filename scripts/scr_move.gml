///scr_move(len, dir)

var len = argument0
var dir = argument1;

if (len > 0) {

    // Compute components of the passed vector.
    var hspd = lengthdir_x(len, dir);
    var vspd = lengthdir_y(len, dir);
    
    // Set precise to true by default.
    var precise = true;
    
    // Counter variables.
    var h = abs(hspd);
    var v = abs(vspd);
    
    // Set step to 0.01 by default.
    var step = 0.1;
    
    // Move horizontally and vertically at the same time.
    while (h > 0 && v > 0) {        
        if (place_free(id.x + sign(hspd) * step, id.y + sign(vspd) * step)) {
            id.x += sign(hspd) * step;
            id.y += sign(vspd) * step;
        } else {
            break;
        }
        h -= step;
        v -= step;
        
        if (h < 0) {
            h = 0;
        }
        if (v < 0) {
            v = 0;
        }
    }
    
    if (precise) {
        // Move horizontally.
        while (h > 0) {        
            if (place_free(id.x + sign(hspd) * step, id.y)) {
                id.x += sign(hspd) * step;
            } else {
                break;
            }
            h -= step;
            if (h < 0) {
                h = 0;
            }
        }
        
        // Move vertically.
        while (v > 0) {        
            if (place_free(id.x, id.y + sign(vspd) * step)) {
                id.y += sign(vspd) * step;
            } else {
                break;
            }
            v -= step;
            if (v < 0) {
                v = 0;
            }
        }
    }
    
    // Return whether the movement was made or not.
    //return h < abs(hspd) || v < abs(vspd);
    
    var i = 0;
    var j = 0;
    
    /*h *= sign(hspd);
    v *= sign(vspd);
    
    while (abs(i) < abs(h)) {
        if (sign(vspd) != 0) {
            if (place_free(x + (h - i), y + (abs(i) * sign(vspd) * -1))) {
                x += (h - i);
                y += (abs(i) * sign(vspd) * -1);
                break;
            }
        } else {
            if (place_free(x + (h - i), y + abs(i))) {
                x += (h - i);
                y += abs(i);
                break;
            } else if (place_free(x + (h - i), y + (-abs(i)))) {
                x += (h - i);
                y += (-abs(i));
                break;
            }
        }
        i += sign(h) * step;
    }
    
    while (abs(j) < abs(v)) {
        if (sign(hspd) != 0) {
            if (place_free(x + (abs(j) * sign(hspd) * -1), y + (v - j))) {
                x += (abs(j) * sign(hspd) * -1);
                y += (v - j);
                break;
            }
        } else {
            if (place_free(x + abs(j), y + (v - j))) {
                x += abs(j);
                y += (v - j);
                break;
            } else if (place_free(x + (-abs(j)), y + (v - j))) {
                x += (-abs(j));
                y += (v - j);
                break;
            }
        }
        j += sign(v) * step;
    }*/
    











    var xtarg = id.x + hspd;
    var ytarg = id.y + vspd;
    
    if (!(h < abs(hspd) || v < abs(vspd))) {
        var sweep_interval = 10;
        var angle_limit = 50;
        
        for (var angle = sweep_interval; angle <= angle_limit; angle += sweep_interval) {
            for (var multiplier = -1; multiplier <= 1; multiplier += 2) {      
                var angle_to_check = dir + angle * multiplier;
                
                xtarg = x + lengthdir_x(len/* - ((len / angle_limit) * angle)*/, angle_to_check);
                ytarg = y + lengthdir_y(len/* - ((len / angle_limit) * angle)*/, angle_to_check);  
                if (place_free(xtarg, ytarg)) {
                    x = xtarg;
                    y = ytarg;  
                    exit;
                }
                
                //hspd = lengthdir_x(len, angle_to_check);
                //vspd = lengthdir_y(len, angle_to_check);
                //if (scr_test_move(hspd, vspd, false)) {
                //    exit;
                //}
            }
        }
    }
}
