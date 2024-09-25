move_x = 0;
move_y = 0;

target = obj_player;



if(move == 0) {
	move_x = 2;
	
	if(x + move_x >= room_width/2) {
		move_x = 0;	
		x = room_width/2;
		
		move = -1;
		alarm[1] = 30;
	}
	
} 

else if (move == 1) {
	//if(abs(x - target.x) < 60) {
	//	// Close to player
	//	alarm[2] = 1;
	//} else {
	//	var walk = choose(0, 1);
		
	//	switch(walk) {
	//		case 0: alarm[2] = 1; break;
	//		case 1:
	//			move_x = choose(-4, -3, 3, 4);
	//			alarm[2] = 120;
	//	}
		
	//}
	
	move_x = random_mov;
	if(alarm[2] == -1) {
		alarm[2] = 180;
	}
		
} 

else if (move == 2) {
	sprite_index = spr_cylak_eye_change;
	
	if(image_index >= 4 && image_index < 13) {
		image_speed = 1.5;
		if(floor(prev_image_index) != floor(image_index)) {
			shoot_eye_laser();
			audio_play_sound(snd_fx_laser, 1, 0, 0.5);
		}
	} else {
		image_speed = 1;	
		
		if(image_index >= 14) {
			switch_move(obj_cylak, 1);
		}
	}
}	

else if (move == 3) {
	image_speed = 0;
	if(alarm[4] == -1) {
		alarm[4] = 100;
	}
}

else if (move == 3.1) {
	shield_explosion(24);
	switch_move(obj_cylak, 1);
}

else if (move == 4) {
	sprite_index = spr_cylak_rocket;
	
	if(image_index >= 12) {
		image_speed = 0;
		if(alarm[6] == -1) {
			alarm[6] = 45;
		}
	}
}

else if (move == 4.1) {
	if(y > -16) {
		y -= 4;
	} else {
		rain_of_harm();
		audio_stop_sound(snd_fx_cylak_rising);
	}
}	

else if (move == 4.2) {
	if(y + 4 >= room_height) {
		
		y = room_height;	
		sprite_index = spr_cylak_rocket;
		image_speed = -1;
		image_index = image_number - 1;
		switch_move(obj_cylak, 4.3);
		
		
	} else {
		y += 4;	
	}
}

else if (move == 4.3) {
	if(image_index < 1) {
		switch_move(obj_cylak, 1);	
	}
}	
	
prev_image_index = image_index;

x += move_x;
y += move_y;

