
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, alpha_level);

// 2. DIBUJAR EL CUADRO DE TEXTO (Si está activo y la puerta es visible)
if (msg_active == true && alpha_level > 0.5) {
    
    // --- A. CALCULAR POSICIÓN EN LA CÁMARA (Igual que obj_TextBox) ---
    var cam_x = camera_get_view_x(view_camera[0]);
    var cam_y = camera_get_view_y(view_camera[0]);
    var cam_w = camera_get_view_width(view_camera[0]);
    var cam_h = camera_get_view_height(view_camera[0]);

    // Centrado horizontalmente
    var draw_x = cam_x + (cam_w / 2) - (box_width / 2);
    
    // Pegado abajo (con margen de 20px)
    var draw_y = cam_y + cam_h - box_height - 20; 

    // --- B. DIBUJAR LA CAJA (Estilo Undertale) ---
    
    // 1. Fondo Negro
    draw_set_color(c_black);
    draw_rectangle(draw_x, draw_y, draw_x + box_width, draw_y + box_height, false);
    
    // 2. Borde Blanco (Usando draw_rectangle con outline=true)
    // OJO: GameMaker dibuja el borde hacia adentro o afuera dependiendo la versión,
    // para asegurar el grosor como el sprite, dibujamos líneas o un rect blanco atrás.
    // Haremos el método simple: Borde blanco de 4px
    draw_set_color(c_white);
    var b_size = 4; // Grosor del borde
    draw_rectangle(draw_x, draw_y, draw_x + box_width, draw_y + box_height, true);
    // (Opcional) Repetir para hacerlo más grueso
    draw_rectangle(draw_x+1, draw_y+1, draw_x + box_width-1, draw_y + box_height-1, true);

    // --- C. DIBUJAR EL TEXTO ---
    draw_set_font(my_font);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
    
    // Margen interno (border = 8) + un poco más para el texto (17px como en tu código)
    var text_margin_x = 20; 
    var text_margin_y = 15;
    
    draw_text_ext(
        draw_x + text_margin_x, 
        draw_y + text_margin_y, 
        msg_text, 
        15, // Separación de líneas
        box_width - (text_margin_x * 2) // Ancho máximo
    );
}