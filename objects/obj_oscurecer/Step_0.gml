if (fade_out) {
    black_alpha -= 0.02;

    if (black_alpha <= 0) {
        black_alpha = 0;
        fade_out = false;
        
        // Avisar al controller que terminó
        with (obj_controllerrm_pasillo) {
            intro_done = true;
            tiempo = room_speed;
            contador = 3;
			audio_play_sound(snd_carriskmusic, 1, false);
			audio_play_sound(snd_cuentaregresiva, 1, false);
        }
    }
}
