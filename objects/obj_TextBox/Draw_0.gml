snd// =================== INPUT Y POSICIÓN ===================
var confirm_key = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter);
var skip_key = keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_shift);

// CORRECCIÓN 1: Coordenadas fijas para la GUI

textbox_x = camera_get_view_x(view_camera[0])+ 20;

textbox_y = camera_get_view_y(view_camera[0]) + 154;


// =================== SETUP (Solo se ejecuta una vez) ===================
if (setup == false) {
    setup = true;
    obj_Player.can_move = false;
    
    draw_set_font(fnt_tutorial);
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
    
    page_number = array_length(text);
    for (var p = 0; p < page_number; p++) {
        text_length[p] = string_length(text[p]);
        text_x_offset[p] = (speaker_sprite[0] == noone) ? 17 : 78;
        portrait_x_offsetp[p] = 42;
        line_width = textbox_width - border*2 - text_x_offset[p];
    }
}

// =================== LÓGICA DE TEXTO Y PÁGINAS (VERSIÓN MEJORADA) ===================

// "Escribir" el texto (esta parte no cambia)
if (draw_char < text_length[page]) {
    draw_char += text_speed;
    draw_char = clamp(draw_char, 0, text_length[page]);
}

// --- Nueva lógica unificada para avanzar y saltar ---

// Si el jugador presiona CUALQUIER tecla de acción (Z, Enter, X, o Shift)
if (confirm_key || skip_key) {

    // Y el texto AÚN SE ESTÁ ESCRIBIENDO...
    if (draw_char < text_length[page]) {
        // ...terminamos la animación de golpe.
        draw_char = text_length[page];
    }
    // SI NO, si el texto YA TERMINÓ...
    else {
        // ...pasamos a la siguiente página o cerramos el cuadro.
        if (page < page_number - 1) {
            page++;
            draw_char = 0;
        } else {
             if (battle_on_end == true) {
        
		obj_Player.visible = false;
		obj_Player.x = 0;
		obj_Player.y = 0;
		obj_Player.can_move = false;
		
        // Guardamos contra qué enemigo luchar en una variable global
        global.current_enemy = enemy_to_battle;
        
        // Nos vamos a la room de batalla
        room_goto(rm_Battle);
		
        
		 } else {
        
        // Si no hay batalla, hacemos lo de antes
        obj_Player.can_move = true;
        instance_destroy();
		  }
       }
    }
}
// =================== DIBUJADO ===================
// Dibuja el cuadro de texto
var txtb_sprite_w = sprite_get_width(txtb_sprite);
var txtb_sprite_h = sprite_get_height(txtb_sprite);
draw_sprite_ext(txtb_sprite, txtb_image, textbox_x, textbox_y, textbox_width / txtb_sprite_w, textbox_height / txtb_sprite_h, 0, c_white, 1);

// Dibuja el retrato del personaje (si existe)
if (speaker_sprite[0] != noone) {
    sprite_index = speaker_sprite[page];
    if (draw_char == text_length[page]) { image_index = 0; }
    
    var _speaker_x = textbox_x + portrait_x_offsetp[page];
    var _speaker_y = textbox_y + (textbox_height / 2); // CORRECCIÓN 2: Posición Y correcta
    
    draw_sprite_ext(sprite_index, image_index, _speaker_x, _speaker_y, 55 / sprite_width, 55 / sprite_height, 0, c_white, 1);
}

// Dibuja el texto
var _drawtext = string_copy(text[page], 1, draw_char);
draw_text_ext(textbox_x + text_x_offset[page] + border, textbox_y + border, _drawtext, line_sep, line_width);