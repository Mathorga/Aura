///player_read_controls()
//Read Controls and returns movement_direction accordingly
 
left_button=keyboard_check_direct(vk_left);
right_button=keyboard_check_direct(vk_right);
up_button=keyboard_check_direct(vk_up);
down_button=keyboard_check_direct(vk_down);
//show_debug_message(string(left_button)+"  "+string(right_button)+"  "+string(up_button)+"  "+string(down_button));


//Left Right Movement
var _x_speed=0;
_x_speed -= left_button;
_x_speed += right_button;
    
//Up Down Movement
var _y_speed=0;
_y_speed -= up_button;
_y_speed += down_button;

//return movement direction
if(_x_speed != 0 || _y_speed != 0)
{
   return(point_direction(0,0,_x_speed,_y_speed)); //At least one direction is being pressed; return movement direction
}
else
    return(-1);
