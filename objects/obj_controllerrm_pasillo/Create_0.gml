progreso_x_inicio = 190;
progreso_x_final  = 545;
progreso_y = 45;



minijuego_tiempo = 40 * room_speed;
minijuego_tiempo_total = minijuego_tiempo;



game_start = false;      
intro_done = false;      
countdown_done = false;  

fade_out = false;        // cuando se active obj_oscurecer hará el fade

contador = 3;
tiempo = room_speed;	
global.game_paused = false;


audio_play_sound(snd_carro_encendiendo, 1, false);
// activar fade luego de 4 segundos
alarm[0] = room_speed * 3;

obj_Player.visible = false;
obj_Player.can_move = false;

