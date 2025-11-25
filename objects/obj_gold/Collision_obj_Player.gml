global.player_gold = global.player_gold + 10;
audio_play_sound(snd_recolectar_item, 1, false);
	show_debug_message("oro actual: " + string(global.player_gold));
instance_destroy();