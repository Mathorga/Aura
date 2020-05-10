///scr_astar(start, goal)

start = argument0;
goal = argument1;

var frontier = ds_priority_create();
ds_priority_add(frontier, start, 0);

var come_from = ds_map_create();
var cost_so_far = ds_map_create();

ds_map_add(come_from, start, noone);
ds_map_add(cost_so_far, start, 0);

while (not ds_priority_empty(frontier)) {
    var current = ds_priority_find_min(frontier);
    
    // Stop if the goal is reached.
    if (current == goal) {
        break;
    }
    
    var neighbors;
    neighbors[0] = ds_grid_get(global.room_grid, current.grid_x - 1, current.grid_y);
    neighbors[1] = ds_grid_get(global.room_grid, current.grid_x - 1, current.grid_y - 1);
    neighbors[2] = ds_grid_get(global.room_grid, current.grid_x,     current.grid_y - 1);
    neighbors[3] = ds_grid_get(global.room_grid, current.grid_x + 1, current.grid_y - 1);
    neighbors[4] = ds_grid_get(global.room_grid, current.grid_x + 1, current.grid_y);
    neighbors[5] = ds_grid_get(global.room_grid, current.grid_x + 1, current.grid_y + 1);
    neighbors[6] = ds_grid_get(global.room_grid, current.grid_x,     current.grid_y + 1);
    neighbors[7] = ds_grid_get(global.room_grid, current.grid_x - 1, current.grid_y + 1);
    for (i = 0; i < 8; i++) {
        var new_cost = cost_so_far[current] + 1;
        var next = neighbors[i];
        if (not is_undefined(ds_map_find_value(cost_so_far, next)) or
            new_cost < ds_map_find_value(cost_so_far, next)) {
            // Manhattan distance on a square grid.
            var priority = abs(goal.x - next.x) + abs(goal.y - next.y);
            ds_priority_add(frontier, next, priority);
            ds_map_add(come_from, next, current);
        }
    }   
}
