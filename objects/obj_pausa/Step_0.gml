// Integración con controles táctiles
var touch = instance_find(obj_touch_controls, 0);

// ========================================================
// CASO 1: JUEGO CORRIENDO
// ========================================================
if (!paused) {
    var click_pause = false;
    
    if (keyboard_check_pressed(vk_escape)) click_pause = true;

    if (instance_exists(touch)) {
        for (var i = 0; i < 4; i++) {
            if (device_mouse_check_button_pressed(i, mb_left)) {
                var mx = device_mouse_x_to_gui(i);
                var my = device_mouse_y_to_gui(i);
                if (point_in_rectangle(mx, my, btn_x - 32, btn_y - 32, btn_x + 32, btn_y + 32)) {
                    click_pause = true;
                }
            }
        }
    }

    // --- ACTIVAR PAUSA ---
    if (click_pause) {
        paused = true;
        
        // Foto del juego
        if (sprite_exists(pause_sprite)) sprite_delete(pause_sprite);
        pause_sprite = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), false, false, 0, 0);
        
        // Desactivar todo
        instance_deactivate_all(true); 
        
        // Reactivar controles
        instance_activate_object(obj_touch_controls); 
        instance_activate_object(id); 
        
        audio_pause_all(); // Pausa la música del juego
        
        // Opcional: Sonido al pausar
        audio_play_sound(snd_seleccionar, 1, false); 
    }
}

// ========================================================
// CASO 2: JUEGO PAUSADO (MENÚ)
// ========================================================
else {
    if (!instance_exists(obj_touch_controls)) {
        instance_activate_object(obj_touch_controls);
    }

    // --- INPUTS ---
    var key_up    = keyboard_check_pressed(vk_up);
    var key_down  = keyboard_check_pressed(vk_down);
    var key_enter = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter);

    touch = instance_find(obj_touch_controls, 0);
    if (instance_exists(touch)) {
        if (touch.up_pressed && !prev_touch_up) key_up = true;
        prev_touch_up = touch.up_pressed;

        if (touch.down_pressed && !prev_touch_down) key_down = true;
        prev_touch_down = touch.down_pressed;

        if (touch.z_pressed && !prev_touch_z) key_enter = true;
        prev_touch_z = touch.z_pressed;
    }

    // --- NAVEGACIÓN CON SONIDO ---
    if (key_up) {
        selected--;
        if (selected < 0) selected = array_length(options) - 1;
        
        // 🔥 SONIDO AL MOVER ARRIBA
        audio_play_sound(snd_seleccionar, 1, false);
    }
    if (key_down) {
        selected++;
        if (selected >= array_length(options)) selected = 0;
        
        // 🔥 SONIDO AL MOVER ABAJO
        audio_play_sound(snd_seleccionar, 1, false);
    }

    // --- SELECCIÓN CON SONIDO ---
    if (key_enter) {
        
        // 🔥 SONIDO AL CONFIRMAR
        audio_play_sound(snd_seleccionar, 1, false);
        
        switch (selected) {
            case 0: // CONTINUAR
                paused = false;
                instance_activate_all(); 
                if (sprite_exists(pause_sprite)) sprite_delete(pause_sprite);
                audio_resume_all(); // La música vuelve, el sonido de selección termina de sonar
                break;
                
            case 1: // SALIR
                game_restart(); 
                break;
        }
    }
}