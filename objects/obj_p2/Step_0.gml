/// @description Insert description here
// You can write your code in this editor

if(down){
	sprite_index = spr_p2d;
}else{
	sprite_index = spr_p2r;	
}

if (keyboard_check(vk_left))
{
	x_vel -= player_accel;
	sprite_index = spr_p2l;
}
if (keyboard_check(vk_right))
{
	x_vel += player_accel;
	sprite_index = spr_p2r;
}





event_inherited();