opcion = 0; // 0 = Reiniciar, 1 = Salir al menú
global.game_paused = true;
audio_stop_all();
audio_play_sound(snd_game_over, 1, false);