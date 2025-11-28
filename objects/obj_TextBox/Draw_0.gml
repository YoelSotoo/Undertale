/// DRAW EVENT - obj_TextBox (SOLO DIBUJO)

// 1. CALCULAR POSICIÓN (Relativa a la cámara)
textbox_x = camera_get_view_x(view_camera[0]) + 20;
textbox_y = camera_get_view_y(view_camera[0]) + 154;

// 2. DIBUJAR CAJA
var txtb_sprite_w = sprite_get_width(txtb_sprite);
var txtb_sprite_h = sprite_get_height(txtb_sprite);

// Asegurar color blanco
draw_set_color(c_white);
draw_set_alpha(1);

draw_sprite_ext(
    txtb_sprite, txtb_image,
    textbox_x, textbox_y,
    textbox_width / txtb_sprite_w,
    textbox_height / txtb_sprite_h,
    0, c_white, 1
);

// 3. DIBUJAR RETRATO
if (speaker_sprite[0] != noone) {
    // Seguridad para no crashear si falta sprite
    var current_spr = speaker_sprite[0];
    if (page < array_length(speaker_sprite)) current_spr = speaker_sprite[page];

    if (current_spr != noone) {
        sprite_index = current_spr;
        // Detener animación si el texto terminó
        if (draw_char == text_length[page]) image_index = 0;

        var _speaker_x = textbox_x + portrait_x_offsetp[page];
        var _speaker_y = textbox_y + (textbox_height / 2);

        // Ajustar escala (55px es tu referencia)
        var s_w = sprite_get_width(current_spr);
        var s_h = sprite_get_height(current_spr);
        
        draw_sprite_ext(
            current_spr, image_index,
            _speaker_x, _speaker_y,
            55 / s_w, 55 / s_h,
            0, c_white, 1
        );
    }
}

// 4. DIBUJAR TEXTO
draw_set_color(c_white);
draw_set_font(fnt_tutorial);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _drawtext = string_copy(text[page], 1, floor(draw_char));

draw_text_ext(
    textbox_x + text_x_offset[page] + border,
    textbox_y + border,
    _drawtext,
    line_sep,
    line_width
);