///scr_load_game()

if (file_exists(working_directory + SAVE_NAME)) {
    var load_file = file_text_open_read(working_directory + SAVE_NAME);
    var save_string = file_text_read_string(load_file);
    file_text_close(load_file);
    save_string = base64_decode(save_string);
    var save_data = json_decode(save_string);
    global.saving = save_data;
}
