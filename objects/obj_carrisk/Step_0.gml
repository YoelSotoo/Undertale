if (obj_controllerrm_pasillo.game_start) {
if (keyboard_check_pressed(vk_up) && !global.saltando) {
    vel_y = -12;
	audio_play_sound(snd_jump, 0, false);
    global.saltando = true;
}

if (keyboard_check_pressed(vk_right)) {
	audio_play_sound(snd_beep, 0, false);
}

// física simple
y += vel_y + impulso_rampa;
vel_y += gravedad;

// si toca el suelo, resetea velocidad y el estado saltando
if (y >= y_inicial) {
    y = y_inicial;
    vel_y = 0;
    global.saltando = false;
	impulso_rampa = 0;
}
}
