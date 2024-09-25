hp -= obj_player.weapon_dmg;
instance_destroy(other);
audio_play_sound(snd_fx_hit, 1, 0);