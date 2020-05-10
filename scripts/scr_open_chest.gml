///scr_open_chest()

if (!open) {
    sprite_index = sprite_opening;
} else {
    sprite_index = sprite_closing;
}
if (signal != noone) {
    signal.visible = false;
}
