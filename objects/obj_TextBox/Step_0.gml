/// STEP EVENT - obj_TextBox (LÓGICA COMPLETA)

// =================== 1. SETUP INICIAL ===================
if (setup == false) {
    setup = true;
    global.dialogue_active = true;
    
    if (instance_exists(obj_Player)) {
        obj_Player.can_move = false;
    }
    
    // Configurar fuente para medir texto correctamente
    draw_set_font(fnt_tutorial);
    
    page_number = array_length(text);
    for (var p = 0; p < page_number; p++) {
        text_length[p] = string_length(text[p]);
        
        // Calcular offsets según si hay sprite
        var spr = (speaker_sprite[0] != noone) ? speaker_sprite[0] : noone;
        if (p < array_length(speaker_sprite)) spr = speaker_sprite[p];
        
        text_x_offset[p] = (spr == noone) ? 17 : 78;
        portrait_x_offsetp[p] = 42;
        line_width = textbox_width - border*2 - text_x_offset[p];
    }
}

// =================== 2. DETECTAR INPUTS (Teclado + Táctil) ===================
var confirm_key = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter);
var skip_key    = keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_shift);

// Integración Táctil
var touch = instance_find(obj_touch_controls, 0);
if (instance_exists(touch)) {
    // Si tocas la "Z" (Mano) cuenta como confirmar
    if (touch.z_pressed) confirm_key = true;
    
    // Si tocas la "X" (Correr) cuenta como saltar texto rápido
    if (touch.x_pressed) skip_key = true;
}

// =================== 3. LÓGICA DEL TEXTO ===================

// Avanzar caracteres
if (draw_char < text_length[page]) {
    draw_char += text_speed;
    draw_char = clamp(draw_char, 0, text_length[page]);
}

// Sonido de tipeo
if (floor(draw_char) != floor(old_draw_char)) {
    audio_play_sound(txtb_snd, 10, false);
}
old_draw_char = draw_char;

// =================== 4. INTERACCIÓN (El arreglo del Bucle) ===================

if (confirm_key || skip_key) {

    // A) Si aún escribe -> Terminar de golpe
    if (draw_char < text_length[page]) {
        draw_char = text_length[page];
    }
    
    // B) Si ya terminó -> Siguiente página o cerrar
    else {
        // ¿Hay más páginas?
        if (page < page_number - 1) {
            page++;
            draw_char = 0;
        } 
        // ¿Es la última página? -> CERRAR
        else {
            if (battle_on_end == true) {
                // Iniciar Batalla
                global.battle_previous_room = room;
                if (instance_exists(obj_Player)) {
                    global.battle_player_x = obj_Player.x;
                    global.battle_player_y = obj_Player.y;
                }
                global.current_enemy = enemy_to_battle;
                room_goto(rm_Battle);
            } 
            else {
                // Cerrar normal y aplicar COOLDOWN
                if (instance_exists(obj_Player)) {
                    obj_Player.can_move = true;
                    
                    // --- ESTO EVITA EL BUCLE INFINITO ---
                    // Le damos 15 frames de descanso antes de poder interactuar de nuevo
                    obj_Player.interact_cooldown = 15; 
                }
                
                global.dialogue_active = false;
                instance_destroy();
            }
        }
    }
}