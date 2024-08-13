hp -= obj_player.weapon_dmg;
instance_destroy(other);
audio_play_sound(snd_hit_enemy, 1, 0);