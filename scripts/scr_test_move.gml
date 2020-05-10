///scr_test_move(hspd, vspd, prec)

var hspd = round(argument0);
var vspd = round(argument1);
var precise = argument2;

var h = abs(hspd);
var v = abs(vspd);

var step = 1;

while (h > 0 && v > 0) {        
    if (place_free(id.x + sign(hspd), id.y + sign(vspd))) {
        id.x += sign(hspd) * step;
        id.y += sign(vspd) * step;
    } else {
        break;
    }
    h -= step;
    v -= step;
}

if (precise) {
    while (h > 0) {        
        if (place_free(id.x + sign(hspd), id.y)) {
            id.x += sign(hspd) * step;
        } else {
            break;
        }
        h -= step;
    }
    while (v > 0) {        
        if (place_free(id.x, id.y + sign(vspd))) {
            id.y += sign(vspd) * step;
        } else {
            break;
        }
        v -= step;
    }
}

// Returns whether the movement was made or not.
return h < abs(hspd) || v < abs(vspd);
