/// @description Insert description here
// You can write your code in this editor


// slow down a little every frame
x_vel *= 0.9;
// gravity to accelerate the player down
y_vel += grav;
// add remainder from last frame to current velocity
rx += x_vel;
ry += y_vel;
// how many pixels we are going to move by
var tomovex = round(rx);
var tomovey = round(ry);
// find the remainder again
rx -= tomovex;
ry -= tomovey;

// find the direction of y
var sy = sign(tomovey);

x += tomovex;
//x = clamp(x,0,view_get_wport(0))
//view_wview[0] or camera_get_view_x(view_camera[0])
if(x+tomovex <= 0 || x+tomovex >= /*view_xview[0]+*/view_wview[0]-50){
	x_vel *= -1;	
}

/*if (y == view_hview[0]){	
	show_debug_message("spark");
	instance_create_layer(x, y+50, "Instances", obj_spark);
	instance_destroy(obj_spark);

	//dead = true;
}*/

if (y >= /*view_yview[0]+*/2*view_hview[0]){
	audio_play_sound(snd_splash,1,0);
	dead = true;
	down = false
}

if (dead){	
	speed = 0;
	//show_debug_message("dead");
	//x = des_x;
	//y = room_height-20;
	//alarm[0] = 0.5*room_speed;
	move_towards_point(des_x,des_y,mspeed);

	instance_destroy(obj_spark);
	if(point_distance(x,y,des_x,des_y)<mspeed){
		x = des_x;
		y = des_y;
		speed = 0;
		if(!hit){		
		points -= 1;
		}
		if(hit){
			points = points;
		}
		hit = false;
		y_vel = -11;
		dead = false;
		down = false;
	}
	
}else{	
	// check each pixel on the y axis & move accordingly
	while (tomovey != 0)
	{
		var colliding = false;
		var collidewith = noone;
	
		
		// only collide when moving down
		if (sy > 0)
		{
			// collision with player
			collidewith = instance_place(x, y+sy, obj_player); 
			if (collidewith != noone && y < collidewith.y)
			{
				colliding = true;	
				points += 1; 
				
				collidewith.vspeed = mspeed;
				collidewith.down = true;
				collidewith.hit = true;
				//collidewith.dead = true;
				audio_play_sound(snd_jump,1,0);
				instance_create_layer(x, y+50, "Instances", obj_spark);
				collidewith.alarm[0] = 1*room_speed;
			}
			// collision with platform
			else
			{
				collidewith = instance_place(x, y+sy, obj_platform); 
			
				if (collidewith != noone && !collidewith.popped)
				{
					colliding = true;
					audio_play_sound(snd_jump,1,0);
					collidewith.popped = true;
				}
			}
		}

		if (!colliding) // no bounce up, just move down
		{
			y += sy;
			tomovey -= sy;
		}
		else // move to new location from bounce & reset the remainder
		{
			y += sy;
			y_vel = bounce_height;
			ry = 0;
			break;
		}
	}
}
