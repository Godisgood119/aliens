event_inherited();

if(state == bm.idle)
{
	// Sprite
	sprite_index = spr_boss1_idle;
	
	//Behavior
	
	xspd = 0;
	yspd = 0;
	
	image_speed = 1;
	move_counter++;
	
	//Transition 
	if(move_counter >= move_delay * 60) 
	{
		move_counter = 0;
		move_delay = choose(2,3);
		state = available_attacks[irandom_range(0, array_length(available_attacks)-1)];	
	}
} 
else if (state == bm.attack1)
{
	// sprite
	sprite_index = spr_boss1_jump;
	
	#region Behavior
	
	// check if on ground
	on_ground = (y + 1 >= room_height);
	
	// gravity
	
	// set hjump first time
	if(hjump == 0) {
		hjump = choose(-1, 1) * 6;	
	}
	
	// check if last frame
	if(image_index >= image_number - 1) {
		//show_debug_message("Jumping frame");
		
		yspd += grav;
		
		// freeze on frame
		image_speed = 0;
		image_index = image_number - 1;
		
		// jump
		if(on_ground) {
			//show_debug_message("Jumped");
			yspd = jmpspd;
			startx = x;
			px = obj_player.x;
		}
		
		// check for moving collision with ground
		if(y + yspd >= room_height) {
			//show_debug_message("Hit ground");
			landings += 1;
			
			//If landing on player, create damage effect
			if(landings >= 3) {
				instance_create_depth(x, y, 300, obj_boss1_land_damage);
			}
			
			//scoot down to bottom of room
			while(y + (0.5 * sign(yspd)) < room_height) {
				y += 0.5 * sign(yspd);	
			}
			yspd = 0;
			
			image_index = 0;
			image_speed = 1;
		}
		
		// landings sequence
		if (landings == 0) {
			xspd = hjump;	
		} else if (landings == 1) {
			xspd = -hjump * 2;
			// shoot bullets
			attack1_shoot();
		} else if (landings == 2) {
			xspd = (px - startx) / (abs(jmpspd * 2) / grav);	
		} else if (landings == 3) {
			xspd = ((room_width/2) - startx) / (abs(jmpspd * 2) / grav);	
		}
		
	} else {
		xspd = 0;
	}
	
	#endregion
	
	// Transition
	if(landings >= 4) {
		state = bm.idle;
		init_attack_1();
	}
} 
else if (state == bm.attack2)
{
	
	// Sprite
	sprite_index = spr_boss1_walk;
	image_speed = 1;
	
	// Behaviour
	attack2_switch_timer++;
	show_debug_message(attack2_switch_timer);
	// switch variables
	if(attack2_switch_timer >= attack2_switch_delay) {
		attack2_switch_timer = 0;
		startx = x;
		if(attack2_count < 3) {
			init_attack_2();
			attack2_count++;
		} else {
			state = bm.idle;
			attack2_count = 0;
		}
	}
	
	// movement
		
	if(attack2_count < 3) {
		xspd = attack2_mov_dir * attack2_mov_spd;
	} else {
		xspd = ((room_width/2) - startx) / attack2_switch_delay;
	}
	
	
	// laser
	attack2_laser_timer++;
	if(attack2_laser_timer >= attack2_laser_delay) {
		// spawn laser
		audio_play_sound(snd_laser, 1, 0);
		var _laser = instance_create_depth(x, y-60, 300, obj_boss1_laser);
		_laser.image_xscale = 3;
		_laser.image_yscale = 60;
		_laser.alarm[0] = 20;
		_laser.fade = true;
		
		attack2_laser_timer = 0;
	}
	
	// Transition
	// Currently meddled in with behavior
	
	
}
else if (state == bm.attack3)
{
	
} 
else if (state == bm.attack4)
{
	
} 
else if (state == bm.attack5)
{
	
}

x += xspd;
y += yspd;