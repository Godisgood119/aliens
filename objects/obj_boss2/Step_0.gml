/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(state == bm.idle) {
	// sprite
	
	
	//behavior
	y = by + (13 * dsin(angy));
	angy += 1.5;
	
	track_arms();

	//transition
	move_counter++;
	if(move_counter >= move_delay * 60) 
	{
		move_counter = 0;
		move_delay = choose(2,3);
		state = available_attacks[irandom_range(0, array_length(available_attacks)-1)];	
	}
	
} else if (state == bm.attack1) {
	//behavior
	if(!attack1_arm) { 
		attack1_arm = choose(left_arm, right_arm); 
		if(attack1_arm == left_arm) {
			xspd = -3;	
		} else { xspd = 3 }
	}
	
	
	y = by + (13 * dsin(angy));
	angy += 1.5;
	
	track_arms(attack1_arm);
	
	// slowly move horizontally
	prevxspd = xspd;
	if(xspd != 0) {
		xspd -= sign(xspd) * 0.05;
		
		with(attack1_arm) {
			other.attack1_shoot_direction = point_direction(x, y, obj_player.x, obj_player.y);
			image_angle = other.attack1_shoot_direction + 90;
			redness -= 255 / (3 / 0.05);
		}
	}
	attack1_arm.x += xspd;
	if(xspd == 0 || sign(xspd) != sign(prevxspd)) {
		xspd = 0;
	}
	
	// shoot
	if(xspd == 0) {
		attack1_shoot_counter++;
		if(attack1_shoot_counter >= attack1_shoot_delay) {
			// shoot laser
			with(attack1_arm) {
				var bullet = instance_create_depth(x, y, 400, obj_boss2_bullet);
				bullet.speed = 35;
				bullet.direction = other.attack1_shoot_direction;
				bullet.image_angle = other.attack1_shoot_direction;	
			}
			init_attack_1();
			state = bm.idle;
		}
	}
}

