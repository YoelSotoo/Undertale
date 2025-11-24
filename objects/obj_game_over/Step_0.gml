// Fade in
if (fade_alpha < 1) {
    fade_alpha += fade_speed;
}

// Navegación del menú
if (keyboard_check_pressed(vk_up)) {
    current_selection--;
    audio_play_sound(snd_seleccionar, 1, false);
}
if (keyboard_check_pressed(vk_down)) {
    current_selection++;
    audio_play_sound(snd_seleccionar, 1, false);
}

current_selection = clamp(current_selection, 0, array_length(game_over_options) - 1);

// Selección de opción
if (keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter)) {
    audio_play_sound(snd_seleccionar, 1, false);
    
    switch (current_selection) {
        case 0: // Reiniciar Batalla
            show_debug_message("=== REINICIANDO BATALLA ===");
			
			 audio_stop_sound(snd_ruinas);
			 show_debug_message(" Sonido snd_ruinas detenido");
            
            // 1. Resetear TODAS las variables globales
            global.player_hp = 20;
            global.player_max_hp = 20;
            global.turn_state = "PLAYER_TURN";
            global.UISelectionMenu = 0;
            global.BattleMenu = 0;
            global.inv_frames = 0;
            global.soul_id = noone;
            
            // 2. Destruir esta instancia de Game Over
            instance_destroy();
            
            // 3. Reiniciar la room COMPLETAMENTE
            room_restart();
            break;
            
        case 1: // Salir del Juego
            game_end();
            break;
    }
}