///scr_start_dialog()

if (!instance_exists(dialog)) {
    dialog = instance_create(x, y - dialog_offset, obj_dialog);
    dialog.text = text;
    //instance_destroy(signal);
    if (signal != noone) {
        signal.visible = false;
    }
    //global.A_signal = signal;
} else {
    dialog.text_page++;
    dialog.text_count = 0;
    if (dialog.text_page > array_length_1d(dialog.text) - 1) {
        instance_destroy(dialog);
        if (signal != noone) {
            signal.visible = true;
        }
    }
}
