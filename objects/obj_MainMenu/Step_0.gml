// --- 0. LÓGICA DE TRANSICIÓN (FADE OUT) ---
if (transitioning == true) {
    // Aumentar oscuridad
    alpha += 0.02; // Velocidad del efecto (0.02 es suave)
    
    // Si ya está totalmente negro...
    if (alpha >= 1) {
        alpha = 1;
        room_goto(target_room);
    }
    
    // IMPORTANTE: Si estamos transicionando, NO leemos más inputs.
    exit; // Detiene el código aquí
}


// --- 1. DETECTAR INPUTS ---

var key_up    = keyboard_check_pressed(vk_up);
var key_down  = keyboard_check_pressed(vk_down);
var key_enter = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter);

var touch = instance_find(obj_touch_controls, 0);
if (instance_exists(touch)) {
    if (touch.up_pressed && !prev_touch_up) key_up = true;
    prev_touch_up = touch.up_pressed;

    if (touch.down_pressed && !prev_touch_down) key_down = true;
    prev_touch_down = touch.down_pressed;

    if (touch.z_pressed && !prev_touch_z) key_enter = true;
    prev_touch_z = touch.z_pressed;
}

// --- 2. MOVERSE EN EL MENÚ ---
if (key_up) {
    selected--;
    if (selected < 0) selected = option_count - 1;
    audio_play_sound(snd_seleccionar, 1, false);
}

if (key_down) {
    selected++;
    if (selected >= option_count) selected = 0;
    audio_play_sound(snd_seleccionar, 1, false);
}

// --- 3. SELECCIONAR OPCIÓN ---
if (key_enter) {
    switch (selected) {
        case 0: // CONTINUAR
            // EN LUGAR DE IRNOS DE GOLPE, ACTIVAMOS LA TRANSICIÓN
            if (room_exists(rm_labFinal)) {
                audio_play_sound(snd_seleccionar, 1, false); // Sonido confirmación
                target_room = rm_labFinal;
                transitioning = true; // <--- ESTO INICIA EL EFECTO
            }
            break;

        case 1: // REINICIAR
            // Lógica de reinicio
            break;
		case 2: // SALIR (NUEVO)
	            audio_play_sound(snd_seleccionar, 1, false);
	            game_end(); // <--- ESTO CIERRA EL JUEGO
            break;
    }
}