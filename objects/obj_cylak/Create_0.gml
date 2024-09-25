// BASIC VARIABLES
hp = 500;
move = 0;
move_level = 1;
// move_level will affect the difficulty. 
// 3 total levels
audio_play_sound(snd_fx_cylak_intro, 1, 0);

target = noone;
tx = 0;
ty = 0;

enum cylak_moves {
		
}

// MOVEMENT/POSITION
x = -sprite_width;
y = room_height;

move_x = 0;
move_y = 0;

random_mov = choose(-1, 1);

// ATTACKS
prev_image_index = 0;
shield_alpha = 0;
