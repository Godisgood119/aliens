enum hovers {
	none,
	x_only,
	x_and_y,
	y_only
}

function switch_move(boss, num) {
	move = num;
	switch(boss) {
		case obj_cylak:
			if(num == 1) {
				sprite_index = spr_cylak;
				image_speed = 1;
				if(obj_player.x - x > 0) {
					random_mov = 1;
				} else {
					random_mov = -1;	
				}
				var total_mov = random_mov * 180;
				if(x + total_mov >= room_width || x + total_mov <= 0) {
					random_mov = -random_mov;
				}
				
			} else if (num == 3) {
				image_speed = 0;	
				audio_play_sound(snd_fx_cylak_shield, 1, 0, 1.5);
			} else if (num == 3.1) {
				audio_stop_sound(snd_fx_cylak_shield);
				audio_play_sound(snd_fx_cylak_shield_explosion, 1, 0, 1.3);
				shield_alpha = 0;	
			} else if(num == 4.1) {
				audio_play_sound(snd_fx_cylak_rising, 1, 0);
				sprite_index = spr_cylak_rocket_firing;
				image_speed = 1;
			}
			
			
			break;
		case obj_gideas:
			break;
	}
}

// CYLAK FUNCTIONS
function shoot_eye_laser() {
	// lx and ly are points relative to top left
	var lx;
	var ly;
	var img_angle = 0;
	if(image_index < 5) {
		lx = 94;
		ly = 34;
		img_angle = 270;
	} else if (image_index < 6) {
		lx = 93;
		ly = 31;
		img_angle = 225;
	} else if (image_index < 7) {
		lx = 93;
		ly = 29;
		img_angle = 180;
	} else if (image_index < 8) {
		lx = 93;
		ly = 25;
		img_angle = 135;
	} else if (image_index < 9) {
		lx = 94;
		ly = 22;
		img_angle = 90;
	} else if (image_index < 10) {
		lx = 96;
		ly = 25;
		img_angle = 45;
	} else if (image_index < 11) {
		lx = 97;
		ly = 29;
		img_angle = 0;
	} else if (image_index < 12) {
		lx = 97;
		ly = 31;
		img_angle = 315;
	} else if (image_index < 13) {
		lx = 95;
		ly = 33;
		img_angle = 270;
	}
	
	lx = x + (lx - sprite_xoffset);
	ly = y + (ly - sprite_yoffset);
	
	show_debug_message("X: " + string(x) + ", Y: " + string(y));
	show_debug_message("LX: " + string(lx) + ", LY: " + string(ly));
	
	// x is origin point, so we must calculate relative to that
	var laser = instance_create_depth(lx, ly, -100, obj_cylak_laser);	
	laser.image_angle = img_angle;
	laser.direction = img_angle;
	laser.speed = 10;
	laser.image_xscale = 30;
	laser.image_yscale = 2;
}

function shield_explosion(projectile_count) {
	var inc = 360 / projectile_count;
	var shield_projectile_variation = irandom_range(0,inc);
	for(var i = 0; i < projectile_count; i++) {
		var projectile = instance_create_depth(x, y - 83, -100, obj_cylak_shield_projectile);
		projectile.direction = (inc * i) + shield_projectile_variation;
		projectile.speed = 10;
	}
}

function rain_of_harm() {
	if(alarm[5] == 0) {
		alarm[5] = -1;	
	}
	
	static num_fireballs = 0;
	
	if(num_fireballs < 50) {
		if(alarm[5] == -1) {
			alarm[5] = 5;	
			num_fireballs++;
		}
	} else {
		// use num_fireballs for a delay now
		num_fireballs++;
		if(num_fireballs > 110) {
			num_fireballs = 0;	
			switch_move(obj_cylak, 4.2);
		}	
	}
}

// GIDEAS FUNCTIONS
function set_left_arm(_x, _y) {
	left_arm.xx = _x;
	left_arm.yy = _y;
}

function set_right_arm(_x, _y) {
	right_arm.xx = _x;
	right_arm.yy = _y;
}