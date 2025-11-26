// Navegar
if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
    opcion = max(opcion - 1, 0);
	audio_play_sound(snd_seleccionar, 1, false);
}
if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
    opcion = min(opcion + 1, 1);
	audio_play_sound(snd_seleccionar, 1, false);
}

// Seleccionar
if (keyboard_check_pressed(vk_enter)) {

    global.game_paused = false;

    if (opcion == 0) {
        room_restart();
		audio_stop_all();
		} else {
        room_goto(rm_menu); // Cambia esto a tu room de menú
    }
}
