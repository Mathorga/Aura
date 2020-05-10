///scr_load_characters(saved_map)

var save_data = argument0;
if (save_data != noone) {

    //Iryo
    if (!instance_exists(obj_iryo)) {
        instance_create(0, 0, obj_iryo);
    }
    with (obj_iryo) {
        x_start = save_data[? "iryo_x"];
        y_start = save_data[? "iryo_y"];
        x = x_start;
        y = y_start;
        phy_position_x = x_start;
        phy_position_y = y_start;
        hp = save_data[? "iryo_hp"];
        maxhp = save_data[? "iryo_maxhp"];
        energy = save_data[? "iryo_energy"];
        maxenergy = save_data[? "iryo_maxenergy"];
        expr = save_data[? "iryo_expr"];
        maxexpr = save_data[? "iryo_maxexpr"];
        lvl = save_data[? "iryo_lvl"];
        attack_x_dmg = save_data[? "iryo_attack_x_dmg"];
        attack_y_dmg = save_data[? "iryo_attack_y_dmg"];
        attacked = save_data[? "iryo_attacked"];
    }
    
    //Aura
    if (!instance_exists(obj_aura)) {
        instance_create(0, 0, obj_aura);
    }
    with (obj_aura) {
        x_start = save_data[? "aura_x"];
        y_start = save_data[? "aura_y"];
        x = x_start;
        y = y_start;
        phy_position_x = x_start;
        phy_position_y = y_start;
        hp = save_data[? "aura_hp"];
        maxhp = save_data[? "aura_maxhp"];
        energy = save_data[? "aura_energy"];
        maxenergy = save_data[? "aura_maxenergy"];
        expr = save_data[? "aura_expr"];
        maxexpr = save_data[? "aura_maxexpr"];
        lvl = save_data[? "aura_lvl"];
        attack_x_dmg = save_data[? "aura_attack_x_dmg"];
        attack_y_dmg = save_data[? "aura_attack_y_dmg"];
        attacked = save_data[? "aura_attacked"];
    }
    ds_map_destroy(save_data);
    global.saving = noone;
}
