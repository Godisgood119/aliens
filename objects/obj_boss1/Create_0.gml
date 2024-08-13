event_inherited();

audio_play_sound(snd_mus_boss1, 1, 1);

x = -32;
y = room_height;

xspd = 0;
yspd = 0;
on_ground = true;

// State Variables
move_delay = choose(2,3);
move_counter = 0;
available_attacks = [bm.attack1, bm.attack2];

// Idle Variables

// Attack 1 Variables
attack1_shoot = function() {
	attack1_bullet_timer++;
	if(attack1_bullet_timer >= attack1_bullet_delay) {
		attack1_bullet_delay = choose(2,2.5,3);
		attack1_bullet_timer = 0;
		var _bullet = instance_create_depth(x, y-130, 300, obj_boss1_laser);
		_bullet.vspeed = 12;
		_bullet.image_xscale = 2;
		_bullet.image_yscale = 5;
	}	
}
init_attack_1 = function() {
	px = 0;
	startx = x;
	jmpspd = -15;
	grav = .275;
	landings = 0;
	hjump = 0;
	attack1_bullet_delay = 2;
	attack1_bullet_timer = 0;
}
init_attack_1();

// Attack 2 Variables
attack2_count = 0;
init_attack_2 = function() {
	attack2_switch_delay = 30;
	attack2_switch_timer = 0;
	attack2_mov_spd = choose(3,6);
	attack2_mov_dir = choose(-1, 1);
	attack2_laser_delay = 50 / attack2_mov_spd;
	attack2_laser_timer = 0;
	show_debug_message(attack2_count);
}
init_attack_2();
