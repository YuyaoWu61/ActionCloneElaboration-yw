/// @description Insert description here
// You can write your code in this editor

// find the number of the players
var num_of_players = instance_number(obj_player);

var avgy = 0;

// search for all the players, add their y value to avgy, & calculate the average
for (i=0; i<num_of_players; i++)
{
	var p = instance_find(obj_player, i);	
	
	// center player
	//avgy += p.y - 0.5 * camera_get_view_height(view_camera[0]);
	
	// what if you die?
	// find the spawn location and add that 
	if (p.y >= view_yview+view_hview){

		avgy += p.des_y - 0.5 * camera_get_view_height(view_camera[0]);
	}
	else{
		avgy += p.y - 0.5 * camera_get_view_height(view_camera[0]);	
	}
}

if (num_of_players > 0)
{
	avgy /= num_of_players;
}

x=0;

// move 10% of the way to the average position
y = lerp(y, avgy, 0.1);

// set camera to the correct value!
camera_set_view_pos(view_camera[0], x, y);