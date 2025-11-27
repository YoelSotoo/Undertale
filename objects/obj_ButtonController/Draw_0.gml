// 1. DIBUJAR LOS BOTONES DEL MENÚ PRINCIPAL
for (var i = 0; i < button_count; i++) {
    // Si es el seleccionado Y NO estamos en el submenú de ACTs, frame 1
    var frame = 0;
    if (global.UISelectionMenu == i && !act_menu_visible) {
        frame = 1;
    }
    
    draw_sprite(ButtonSprites[i], frame, ButtonPositions_X[i], 310);
    
    // Dibujar el corazón cursor
    if (frame == 1) {
        draw_sprite(spr_menu_cursor, 0, ButtonPositions_X[i], 310);
    }
}

// 2. DIBUJAR MENÚ DE ACTs (SI ESTÁ VISIBLE)
if (act_menu_visible) {
    var menu_x = 50;
    var menu_y = 80;
    var menu_width = 150;
    var menu_height = 120;
    
    // Fondo semitransparente
    draw_set_color(make_color_rgb(0, 0, 0));
    draw_rectangle(menu_x, menu_y, menu_x + menu_width, menu_y + menu_height, false);
    draw_set_color(make_color_rgb(50, 50, 80));
    draw_rectangle(menu_x + 2, menu_y + 2, menu_x + menu_width - 2, menu_y + menu_height - 2, false);
    
    // Opciones de ACT
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_font(fnt_BattleStats); // Asegúrate de que esta fuente exista
    
    for (var i = 0; i < array_length(act_options); i++) {
        var option_y = menu_y + 20 + (i * 30);
        
        // Resaltar opción seleccionada
        if (i == current_act_selection) {
            draw_set_color(c_yellow);
            draw_text(menu_x + 30, option_y, "> " + act_options[i]);
            draw_set_color(c_white);
        } else {
            draw_text(menu_x + 30, option_y, "  " + act_options[i]);
        }
    }
    
    // Descripción de la acción seleccionada
    if (act_description != "") {
        draw_set_color(c_gray);
        draw_text(menu_x + 10, menu_y + menu_height - 25, act_description);
        draw_set_color(c_white);
    }
    
    // Dibujar alma en la selección actual
    var soul_y = menu_y + 20 + (current_act_selection * 30);
    draw_sprite(spr_menu_cursor, 0, menu_x + 15, soul_y);
}