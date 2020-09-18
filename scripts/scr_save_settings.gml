///scr_save_settings()

var settings_data = ds_map_create();

settings_data[? "volume_fx"] = global.volume_fx;
settings_data[? "volume_music"] = global.volume_music;

var settings_string = json_encode(settings_data);
ds_map_destroy(settings_data);
//settings_string = base64_encode(settings_string);

var settings_file = file_text_open_write(working_directory + SETTINGS_FILE);
file_text_write_string(settings_file, settings_string);
file_text_close(settings_file);
