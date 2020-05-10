///scr_set_collider(instance, alternate)

var instance = argument0;
var alt_floor = argument1;

if (instance.collider != noone) {
    instance_destroy(instance.collider);
}

if (alt_floor) {
    instance.collider = instance_create(instance.x, instance.y, obj_alt_collider);
    instance.collider.owner = id;
    //object_set_mask(instance.collider.object_index, instance.sprite_index);
} else {
    instance.collider = instance_create(instance.x, instance.y, obj_main_collider);
    instance.collider.owner = id;
    //object_set_mask(instance.collider.object_index, instance.sprite_index);
}
