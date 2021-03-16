/// @description Insert description here
// You can write your code in this editor

var frames_between_platforms = 30; // at least 30 frames must elapse before we make a new platform

var max_platforms = 30; // maximum amount of platforms on the screen
var min_platforms = 20; // minimum amount of platforms on the screen
var num_platforms = instance_number(obj_platform); // counts how many platforms are in the room

var x_buffer = 16;
var y_buffer = 32;

frames_since_platform += 1;

if ((frames_since_platform > frames_between_platforms) || (num_platforms < min_platforms))
{
	if (num_platforms < max_platforms)
	{
		//enough time has passed & we are under the max limit so we can create a new platform!
		
		var new_platform = instance_create_layer(random_range(x_buffer, room_width-x_buffer), random_range(y_buffer, room_height-y_buffer), "Instances", obj_platform);
		with (new_platform)
		{
			 image_xscale = random_range(0.2, 0.75);
			 image_yscale = 0.25;
			 
			 var half_width = sprite_width/2;
			 var half_height = sprite_height/2;
			 
			 var tries = 0;
			 // i want to make a new platform that isn't overlapping any other platforms
			 // if i collide with a different plaform, i change the postion & try again
			 // but i keep the tries limited to 30000 so the while loop doesn't run forever
			while ((collision_rectangle(x - half_width, y - half_height, x + half_width, y + half_height, obj_platform, false, true) != noone) && (tries < 30000))
			{
				x = random_range(x_buffer, room_width - x_buffer);
				y = random_range(y_buffer * 2, room_height-y_buffer);
				tries += 1;	
			}
		
		}
		
		num_platforms++;
		
		frames_since_platform = 0; // reset the timer variable
	}
	
}
