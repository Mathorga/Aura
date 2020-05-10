///scr_start_menu()

switch (mpos) {
    case new_game:
        scr_fade_to_room(rm_shieva_r1, false);
        break;
    case cont:
        scr_load_game();
        break;
    case options:
        scr_fade_to_room(rm_options, false);
        break;
    case ext:
        game_end();
        break;
    default:
        break;
}
