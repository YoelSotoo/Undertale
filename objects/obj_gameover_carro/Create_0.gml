opcion = 0;
instance_destroy(obj_botones_carro);
global.game_paused = true;
audio_stop_all();
audio_play_sound(snd_game_over, 1, false);

// Para evitar repetición infinita de los controles touch
touch_up = false;
touch_dn = false;
touch_ok = false;

btn_radius = 64;

// Botón subir
btn_up_x = 60;
btn_up_y = 165;

// Botón bajar
btn_dn_x = 60;
btn_dn_y = 235;

// Botón confirmar (Z)
btn_ok_x = 585;
btn_ok_y = 225;
