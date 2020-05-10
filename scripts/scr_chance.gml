///scr_chance(percentage)
//percentage must be between 0 & 100

percent = argument0;

//force percent between 0 and 100 if it was greater or less
percent = clamp(percent, 0, 100);

/*eg. if the percent value equals 50 then there will be a 50% chance of returning
 *a true value, if percent is 20 the return value will be true by 20%*/
return (random(100) < percent);
