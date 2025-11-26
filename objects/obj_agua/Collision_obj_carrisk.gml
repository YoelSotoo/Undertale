instance_create_layer(obj_carrisk.x, obj_carrisk.y, "Explosion", obj_explosion);
audio_play_sound(snd_explosion, 10, false); 
// Destruir el obstáculo para evitar repeticiones
alarm [0] = room_speed * 1;