if (activo) { if (keyboard_check_pressed(ord("Z"))) { 
	scr_guardar_juego(); 
	audio_play_sound(snd_checkpoint, 1, false); 
	activo = false; 
	} 
	
	if (keyboard_check_pressed(ord("X"))) {
		activo = false; 
		} 
	}