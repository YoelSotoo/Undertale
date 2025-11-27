// 1. DIBUJAR TÍTULO "SOUL"
draw_set_font(font_tienda);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Dibujamos el título "SOUL" grande arriba
// Usamos draw_text_transformed para hacerlo más grande (escala 2 o 3)
draw_set_color(c_white); // O un gris claro c_ltgray
draw_text_transformed(room_width/2, 120, "SOUL", 3, 3, 0);


// 2. DIBUJAR OPCIONES
for (var i = 0; i < option_count; i++) {
    
    var txt_color = c_gray; // Color normal (gris)
    var scale = 1;
    
    // Si es la opción seleccionada
    if (i == selected) {
        txt_color = c_yellow; // Color seleccionado (amarillo clásico Undertale)
        
        // Opcional: Dibujar el Corazón (Cursor) a la izquierda
        // Asegúrate de tener spr_menu_cursor o spr_soul
        if (sprite_exists(spr_menu_cursor)) {
            // Lo dibujamos unos 60 pixeles a la izquierda del texto
            draw_sprite(spr_menu_cursor, 0, menu_x - 80, menu_y + (i * line_dist));
        } else {
            // Si no tienes sprite, ponemos un ">"
            draw_text(menu_x - 80, menu_y + (i * line_dist), ">");
        }
    }
    
    draw_set_color(txt_color);
    draw_text(menu_x, menu_y + (i * line_dist), options[i]);
}

// Resetear alineación y color para no afectar otros objetos
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);