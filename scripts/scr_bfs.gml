///scr_bfs(goal)

// Breadth-first search algorithm to find shortest path to goal from every valid point in the map.

var goal = argument0;

var frontier = ds_queue_create();
ds_queue_enqueue(frontier, goal);
var visited = ds_list_create();
ds_list_add(visited, goal);

while (not ds_queue_empty(frontier)) {
    var current = ds_queue_dequeue(frontier);
    var neighbors_num = ds_list_size(current.neighbors);
    for (i = 0; i < neighbors_num; i++) {
        var neighbor = ds_list_find_value(current.neighbors, i);
        var index = ds_list_find_index(visited, neighbor);
        if (index == -1 && not is_undefined(neighbor) && neighbor.valid) {
            neighbor.next = current;
            ds_queue_enqueue(frontier, neighbor);
            ds_list_add(visited, neighbor);
        }
    }   
}
ds_list_destroy(visited);
ds_queue_destroy(frontier);
