var gw = display_get_gui_width();
var gh = display_get_gui_height();

if (!paused) {
    // --- DIBUJAR BOTÓN DE PAUSA ---
    // Asumiendo que el origen del sprite está en el centro
    draw_sprite(spr_btn_pausa, 0, btn_x, btn_y);
} 
else {
    // --- DIBUJAR MENÚ DE PAUSA ---
    
    // 1. Dibujar el fondo congelado (opcional, si desactivaste instancias)
    if (sprite_exists(pause_sprite)) {
        draw_sprite_ext(pause_sprite, 0, 0, 0, gw/sprite_get_width(pause_sprite), gh/sprite_get_height(pause_sprite), 0, c_white, 1);
    }
    
    // 2. Oscurecer pantalla (Capa negra semitransparente)
    draw_set_color(c_black);
    draw_set_alpha(0.6);
    draw_rectangle(0, 0, gw, gh, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
    
    // 3. Título "PAUSA"
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // Usa tu fuente si tienes
    if (font_exists(asset_get_index("font_tienda"))) draw_set_font(font_tienda);
    
    draw_text_transformed(gw/2, gh/2 - 100, "PAUSA", 2, 2, 0);
    
    // 4. Opciones
    for (var i = 0; i < array_length(options); i++) {
        var col = c_gray;
        var txt = options[i];
        
        if (i == selected) {
            col = c_yellow;
            txt = "> " + txt + " <"; // Decoración extra
        }
        
        draw_set_color(col);
        draw_text(gw/2, gh/2 + (i * 60), txt);
    }
    
    // Resetear
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}