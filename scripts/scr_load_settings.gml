///scr_load_settings()

if (file_exists(working_directory + SETTINGS_FILE)) {
    var settings_file = file_text_open_read(working_directory + SETTINGS_FILE);
    var settings_string = file_text_read_string(settings_file);
    file_text_close(settings_file);
    //settings_string = base64_decode(settings_string);
    var settings_data = json_decode(settings_string);
    global.volume_music = settings_data[? "volume_music"];
    global.volume_fx = settings_data[? "volume_fx"];
    
    // Apply read settings.
    scr_apply_music_volume();
    scr_apply_fx_volume();
}
