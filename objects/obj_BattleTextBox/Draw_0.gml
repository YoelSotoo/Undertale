// =================== 1. INPUT UNIFICADO ===================
// Teclado
var confirm_key = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter);
var skip_key = keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_shift);

// Táctil (Simulación de "Pressed" único)
var touch = instance_find(obj_touch_controls, 0);

if (instance_exists(touch)) {
    // Detectar si presionas Z AHORA (y no antes)
    if (touch.z_pressed && !prev_touch_z) {
        confirm_key = true;
    }
    // Detectar si presionas X AHORA
    if (touch.x_pressed && !prev_touch_x) {
        skip_key = true;
    }
    
    // Guardar estado para el siguiente frame
    prev_touch_z = touch.z_pressed;
    prev_touch_x = touch.x_pressed;
}

// =================== 2. POSICIÓN GUI ===================
// Nota: Si usas una cámara, esto se dibuja relativo a la sala
textbox_x = camera_get_view_x(view_camera[0]) + 20;
textbox_y = camera_get_view_y(view_camera[0]) + 154;

global.dialogue_active = true;

// =================== 3. SETUP INICIAL ===================
if (setup == false) {
    setup = true;
    if (instance_exists(obj_Player)) obj_Player.can_move = false;
    
    draw_set_font(fnt_tutorial);
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
    
    page_number = array_length(text);
    for (var p = 0; p < page_number; p++) {
        text_length[p] = string_length(text[p]);
        text_x_offset[p] = (speaker_sprite[0] == noone) ? 17 : 78;
        portrait_x_offsetp[p] = 42;
        // Ajustar ancho de línea si hay retrato
        if (p < array_length(text_x_offset)) {
             line_width = textbox_width - border*2 - text_x_offset[p];
        }
    }
}

// =================== 4. LÓGICA DE TEXTO ===================

// Escribir texto
if (draw_char < text_length[page]) {
    draw_char += text_speed;
    draw_char = clamp(draw_char, 0, text_length[page]);
}

// INTERACCIÓN (Avanzar / Saltar)
if (confirm_key || skip_key) {

    // A) Si el texto se está escribiendo -> TERMINAR DE GOLPE
    if (draw_char < text_length[page]) {
        draw_char = text_length[page];
    } 
    // B) Si el texto ya terminó -> SIGUIENTE PÁGINA O CERRAR
    else {
        // --- LÓGICA DE PÁGINAS (Corregida) ---
        if (page < page_number - 1) {
            page++;
            draw_char = 0;
        } 
        else {
            // --- FIN DEL DIÁLOGO ---
            if (battle_on_end == true) {
                // GUARDAR ESTADO PREVIO A BATALLA
                global.battle_previous_room = room;
                if (instance_exists(obj_Player)) {
                    global.battle_player_x = obj_Player.x;
                    global.battle_player_y = obj_Player.y;
                }
                global.current_enemy = enemy_to_battle;
                
                show_debug_message("⚔️ Iniciando batalla contra: " + string(enemy_to_battle));
                room_goto(rm_Battle);
            } 
            else {
                // CERRAR NORMAL
                if (instance_exists(obj_Player)) obj_Player.can_move = true;
                global.dialogue_active = false;
                instance_destroy();
            }
        }
    }
}

// =================== 5. DIBUJADO ===================
var txtb_sprite_w = sprite_get_width(txtb_sprite);
var txtb_sprite_h = sprite_get_height(txtb_sprite);

// Caja
draw_sprite_ext(txtb_sprite, txtb_image, textbox_x, textbox_y, textbox_width / txtb_sprite_w, textbox_height / txtb_sprite_h, 0, c_white, 1);

// Retrato
if (speaker_sprite[0] != noone) {
    // Validar que exista sprite para esta página, si no, usar el primero
    var current_sprite = speaker_sprite[0];
    if (page < array_length(speaker_sprite)) current_sprite = speaker_sprite[page];
    
    sprite_index = current_sprite;
    if (draw_char == text_length[page]) image_index = 0; // Detener boca
    
    var _speaker_x = textbox_x + portrait_x_offsetp[page];
    var _speaker_y = textbox_y + (textbox_height / 2);
    
    // Dibujar retrato escalado
    var scale_x = 55 / sprite_get_width(current_sprite);
    var scale_y = 55 / sprite_get_height(current_sprite);
    draw_sprite_ext(current_sprite, image_index, _speaker_x, _speaker_y, scale_x, scale_y, 0, c_white, 1);
}

// Texto
var _drawtext = string_copy(text[page], 1, floor(draw_char));
draw_set_color(c_white);
draw_set_alpha(1);
draw_text_ext(textbox_x + text_x_offset[page] + border, textbox_y + border, _drawtext, line_sep, line_width);