///scr_options_menu()

switch (mpos)
    {
        case music:
            {
                global.rm = rm_rughai;
                instance_create(0, 0, obj_fade_to);
                break;
            }
        case efx:
            {
                game_load(save.dat);
                break;
            }
        case fullscreen:
            {
                if(window_get_fullscreen())
                    window_set_fullscreen(false);
                else
                    window_set_fullscreen(true);
                break;
            }
        case back:
            {
                global.rm = global.rm_back;
                instance_create(0, 0, obj_fade_to);
                break;
            }
        default:
            break;
    }
