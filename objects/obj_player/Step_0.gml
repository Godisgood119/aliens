//Inputs
get_controls();

// Sub pixel precision
var sub_pixel = 0.5;

#region Movement


if(!dashing)
{
	#region XMovement
	//X Movement
	move_dir = right_key - left_key;
	xspd = (sprint_key) ? move_dir * move_spd * sprint_spd : move_dir * move_spd;
	dash_direction = sign(xspd);

	// Dash check
	if(dash_key_pressed)
	{
		dashing = true;	
	}

	// Check collision
	if place_meeting(x + xspd, y, obj_wall) {
		var pixel_check = sub_pixel * sign(xspd);
		while !place_meeting(x + pixel_check, y, obj_wall) {
			x += pixel_check;
		}
		xspd = 0;
	}

	// Update position with xspd
	x += xspd;
	#endregion

	#region YMovement
	// Y Movement

	yspd += grav;

	//if yspd >= term_vel { yspd = termVel; }

	if jump_buffered && place_meeting(x, y+1, obj_wall) {
		jump_buffered = false;
		jump_buffer_timer = 0;
		yspd = jspd;	
	}

	// Y Collisions
	if place_meeting(x, y + yspd, obj_wall) {
		var pixel_check = sub_pixel * sign(yspd);
		while !place_meeting(x, y + pixel_check, obj_wall) {
			y += pixel_check;
		}
		yspd = 0;
	}

	y += yspd;

	#endregion
	
} else {
	dash_counter++;
	xspd = 0;
	yspd = 0;
	x += dash_distance * dash_direction;
	if(dash_counter >= dash_duration)
	{
		dashing = false;
		dash_counter = 0;		
	}
}


#endregion

#region Combat

if(attack_key_pressed)
{
	audio_play_sound(snd_bullet, 1, 0);
	var mdist = point_distance(x, y, mouse_x, mouse_y);
	var mdir = point_direction(x, y, mouse_x, mouse_y);
	var bullet = noone;
	if(mdir <= 90 || mdir >= 270) 
	{
		bullet = instance_create_layer(x+(sprite_width/2), y-(sprite_height/2), "Instances", obj_player_bullet);
	} else if(mdir > 90 && mdir < 270) 
	{
		bullet = instance_create_layer(x+(sprite_width/2), y-(sprite_height/2), "Instances", obj_player_bullet);
	}
	// Set bullet variables
	bullet.direction = mdir;
	bullet.speed = 20;
}


//// Take damage
//var inst_damager = instance_place(x, y, obj_damager);
//// If there is a damager object
//if(inst_damager != noone)
//{
//	hp -= inst_damager.dmg;
//}
//instance_destroy(inst_damager);

// Player death
if(hp <= 0) 
{
	game_restart();
}

#endregion
