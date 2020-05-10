///scr_start_player_dialog()

if (!instance_exists(dialog)) {
    //scr_debug_print(string(object_get_name(other.object_index)));
    self.done_interacting = false;
    dialog = instance_create(x, y - dialog_offset, obj_dialog);
    dialog.text = text;
    if (signal != noone) {
        signal.visible = false;
    }
} else {
    dialog.text_page++;
    dialog.text_count = 0;
    if (dialog.text_page > array_length_1d(dialog.text) - 1) {
        self.done_interacting = true;
        instance_destroy(dialog);
        if (signal != noone) {
            signal.visible = true;
        }
    }
}
