///scr_save_game()

if (instance_exists(obj_player_parent)) {
    var save_data = ds_map_create();
    
    //general
    save_data[? "room"] = room;
    
    //Iryo
    with (obj_iryo) {
        save_data[? "iryo_x"] = x_start;
        save_data[? "iryo_y"] = y_start;
        save_data[? "iryo_hp"] = hp;
        save_data[? "iryo_maxhp"] = maxhp;
        save_data[? "iryo_energy"] = energy;
        save_data[? "iryo_maxenergy"] = maxenergy;
        save_data[? "iryo_expr"] = expr;
        save_data[? "iryo_maxexpr"] = maxexpr;
        save_data[? "iryo_lvl"] = lvl;
        save_data[? "iryo_attack_x_dmg"] = attack_x_dmg;
        save_data[? "iryo_attack_y_dmg"] = attack_y_dmg;
        save_data[? "iryo_attacked"] = attacked;
    }
        
    //Aura
    with (obj_aura) {
        save_data[? "aura_x"] = x_start;
        save_data[? "aura_y"] = y_start;
        save_data[? "aura_hp"] = hp;
        save_data[? "aura_maxhp"] = maxhp;
        save_data[? "aura_energy"] = energy;
        save_data[? "aura_maxenergy"] = maxenergy;
        save_data[? "aura_expr"] = expr;
        save_data[? "aura_maxexpr"] = maxexpr;
        save_data[? "aura_lvl"] = lvl;
        save_data[? "aura_attack_x_dmg"] = attack_x_dmg;
        save_data[? "aura_attack_y_dmg"] = attack_y_dmg;
        save_data[? "aura_attacked"] = attacked;
    }
    
    var save_string = json_encode(save_data);
    ds_map_destroy(save_data);
    save_string = base64_encode(save_string);
    
    var save_file = file_text_open_write(working_directory + SAVE_FILE);
    file_text_write_string(save_file, save_string);
    file_text_close(save_file);
}
