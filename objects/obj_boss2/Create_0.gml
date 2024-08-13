event_inherited();

audio_play_sound(snd_mus_boss2, 1, 1);

//general variables
x = -64;
y = room_height/2 + 64;
by = y;
bx = room_width/2;
angx = 0;
angy = 0;
xspd = 3;
prevxspd = xspd;

//state variables
move_counter = 0;
move_delay = 2;
available_attacks = [bm.attack1];

//limbs
left_arm = instance_create_depth(x-28, y-88, 400, obj_boss2_arm);
right_arm = instance_create_depth(x+28, y-88, 400, obj_boss2_arm);
arm_dist_x = 28;
arm_dist_y = 94;

track_arms = function(exclude=noone) {
	if(left_arm != exclude) {
		left_arm.x = x-arm_dist_x;
		left_arm.y = y-arm_dist_y;	
	}
	
	if(right_arm != exclude) {
		right_arm.x = x+arm_dist_x;
		right_arm.y = y-arm_dist_y;	
	}
}

//attack 1 variables
init_attack_1 = function() {
	left_arm.redness = 255;
	right_arm.redness = 255;
	left_arm.image_angle = 0;
	right_arm.image_angle = 0;
	attack1_arm = noone;
	attack1_shoot_counter = 0;
	attack1_shoot_delay = 3;		
	attack1_shoot_direction = 0;
}
init_attack_1();