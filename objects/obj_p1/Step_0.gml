/// @description Insert description here
// You can write your code in this editor

if(down){
	sprite_index = spr_p1d;
}else{
	sprite_index = spr_p1r;	
}

if (keyboard_check(ord("A")))
{
	x_vel -= player_accel;
	sprite_index = spr_p1l;
}
if (keyboard_check(ord("D")))
{
	x_vel += player_accel;
	sprite_index = spr_p1r;
}




event_inherited();