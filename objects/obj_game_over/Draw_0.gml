// Fondo con gradiente
draw_set_alpha(fade_alpha);
for (var i = 0; i < room_height; i++) {
    var alpha = i / room_height;
    draw_set_color(make_color_rgb(80 * alpha, 0, 0));
    draw_line(0, i, room_width, i);
}
draw_set_alpha(1);

// Texto "GAME OVER" con efecto
var pulse = sin(current_time * 0.005) * 0.1 + 1.0;
draw_set_color(c_red);
draw_set_font(fnt_BattleStats); // Fuente grande
draw_set_halign(fa_center);
draw_text_transformed(room_width / 2, room_height / 2 - 100, "GAME OVER", pulse, pulse, 0);

// Sombras del texto
draw_set_color(make_color_rgb(150, 0, 0));
draw_text(room_width / 2 + 3, room_height / 2 - 97, "GAME OVER");

// Opciones del menú
for (var i = 0; i < array_length(game_over_options); i++) {
    var y_pos = menu_y + (i * option_spacing);
    
    if (i == current_selection) {
        draw_set_color(c_yellow);
        draw_text(menu_x, y_pos, "> " + game_over_options[i]);
        // Dibujar alma/cursor
        draw_sprite(spr_menu_cursor, 0, menu_x - 40, y_pos);
    } else {
        draw_set_color(c_white);
        draw_text(menu_x, y_pos, game_over_options[i]);
    }
}

// Instrucciones
draw_set_color(c_gray);
draw_set_font(-1); // Fuente pequeña
draw_text(room_width / 2, room_height - 50, "Usa ↑↓ para navegar, Z para seleccionar");