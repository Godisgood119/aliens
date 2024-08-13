if(keyboard_check_pressed(vk_escape))
{
	audio_stop_all();
	audio_play_sound(snd_mus_mattwander, 1, 1);
	with(obj_boss_related)
	{
		instance_destroy();	
	}
}

if(keyboard_check_pressed(vk_f1))
{
	audio_stop_all();
	with(obj_boss_related)
	{
		instance_destroy();	
	}
	instance_create_depth(room_width/2, room_height, 500, obj_boss1);
}

if(keyboard_check_pressed(vk_f2)) {
	audio_stop_all();
	with(obj_boss_related){
		instance_destroy();	
	}
	instance_create_depth(room_width/2, room_height, 500, obj_boss2);
}

//if(keyboard_check_pressed(vk_f2))
//{
//	with(obj_boss)
//	{
//		instance_destroy();	
//	}
//	instance_create_depth(room_width/2, room_height, 500, obj_boss2);
//}

//if(keyboard_check_pressed(vk_f3))
//{
//	with(obj_boss)
//	{
//		instance_destroy();	
//	}
//	instance_create_depth(room_width/2, room_height, 500, obj_boss3);
//}

