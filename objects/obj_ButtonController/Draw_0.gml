// =========================================================
// 1. DIBUJAR LOS BOTONES DEL MENÚ PRINCIPAL (Pelear, Actuar, Objeto, Piedad)
// =========================================================
for (var i = 0; i < button_count; i++) {
    // Determinar si este botón debe mostrarse "seleccionado" (frame 1)
    // Solo se ilumina si es el seleccionado Y el submenú NO está abierto
    var frame = 0;
    if (global.UISelectionMenu == i && !act_menu_visible) {
        frame = 1;
    }
    
    // Dibujar el botón (Fight, Act, Item, Mercy)
    draw_sprite(ButtonSprites[i], frame, ButtonPositions_X[i], 310);
    
    // Dibujar el corazón cursor sobre el botón principal seleccionado
    if (frame == 1) {
        draw_sprite(spr_menu_cursor, 0, ButtonPositions_X[i], 310);
    }
}

// =========================================================
// 2. DIBUJAR MENÚ DE ACTs (VERSIÓN COMPACTA)
// =========================================================
if (act_menu_visible) {
    // --- Configuración Visual Más Pequeña ---
    var menu_x = 45;
    var menu_y = 120;      // Lo bajé un poco para que no flote tanto
    var menu_width = 140;  // ANTES: 200 -> AHORA: 140 (Más angosto)
    var menu_height = 90;  // ANTES: 140 -> AHORA: 90 (Más chaparrito)
    var border = 3;        // Borde un poco más fino
    
    // --- A. CAJA DEL MENÚ (Sándwich) ---
    draw_set_color(c_white);
    draw_rectangle(menu_x, menu_y, menu_x + menu_width, menu_y + menu_height, false);

    draw_set_color(c_black);
    draw_rectangle(menu_x + border, menu_y + border, menu_x + menu_width - border, menu_y + menu_height - border, false);
    
    // --- B. OPCIONES DE TEXTO (Más juntas) ---
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_font(font_tienda); 
    
    var text_x = menu_x + 10; // Margen izquierdo reducido
    var line_sep = 20;        // Separación entre líneas reducida (Antes 30)
    
    for (var i = 0; i < array_length(act_options); i++) {
        var option_y = menu_y + 15 + (i * line_sep);
        
        // Cambio de color al seleccionar
        if (i == current_act_selection) {
            draw_set_color(c_yellow);
        } else {
            draw_set_color(c_white);
        }

        draw_text(text_x, option_y, "* " + act_options[i]);
    }
    
    // --- C. DIBUJAR EL ALMA (CURSOR) ---
    var soul_y = menu_y + 15 + (current_act_selection * line_sep);
    // Ajustamos el cursor para que quede alineado con el texto más compacto
    draw_sprite_ext(spr_menu_cursor, 0, menu_x + 12, soul_y + 5, 0.8, 0.8, 0, c_white, 1); 
    // Nota: Puse escala 0.8 en el sprite del cursor para hacerlo un pelín más chico también

    // --- D. DESCRIPCIÓN A LA DERECHA ---
    if (act_description != "") {
        // Coordenadas para la descripción (A la derecha del menú + 10px)
        var desc_x = menu_x + menu_width + 250;
        var desc_y = menu_y;
        var desc_width = 150; // Ancho máximo antes de bajar de línea
        
        draw_set_color(c_gray);
        // draw_text_ext permite que el texto baje de renglón si es muy largo
        // Argumentos: (x, y, texto, separación_lineas, ancho_maximo)
        draw_text_ext(desc_x, desc_y, act_description, 15, desc_width);
        draw_set_color(c_white); 
    }
}
// =========================================================
// 3. DIBUJAR MENÚ DE ÍTEMS 
// =========================================================
if (item_menu_visible) { // Asegúrate de tener esta variable en tu Create
    
    // --- Referencia al inventario (para escribir menos) ---
    // Asumo que tu objeto inventario se llama "obj_inventory"
    var list_items = obj_inventory.items; 
    var total_items = array_length(list_items);

    // --- Configuración Visual (LA MISMA que en Actuar) ---
    var menu_x = 50;
    var menu_y = 120;      
    var menu_width = 140;  
    var menu_height = 90;  
    var border = 3;        
    
    // --- A. CAJA DEL MENÚ (Sándwich) ---
    draw_set_color(c_white);
    draw_rectangle(menu_x, menu_y, menu_x + menu_width, menu_y + menu_height, false);

    draw_set_color(c_black);
    draw_rectangle(menu_x + border, menu_y + border, menu_x + menu_width - border, menu_y + menu_height - border, false);
    
    // --- B. LISTA DE ÍTEMS ---
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_font(font_tienda); 
    
    var text_x = menu_x + 10; 
    var line_sep = 20;        
    
    // Si el inventario está vacío, mostramos un mensaje
    if (total_items == 0) {
        draw_text(text_x, menu_y + 15, "* (Vacio)");
    } 
    else {
        // --- LOOP PARA DIBUJAR LOS ÍTEMS ---
        // (Solo dibujamos los primeros 3 o 4 si tienes muchos, o implementamos scroll)
        // Por ahora lo hago simple asumiendo que caben en la cajita
        
        // Calculamos índice de inicio para scroll (si tienes variable scroll_y)
        // Si no tienes scroll, simplemente usa: for (var i = 0; i < total_items; i++) {
        
        var max_visible = 4; // Cuantos caben en la cajita
        var start_i = 0;
        
        // Lógica simple de scroll: si el cursor baja mucho, movemos la lista
        if (current_item_selection >= max_visible) {
            start_i = current_item_selection - (max_visible - 1);
        }
        
        var drawn_count = 0;

        for (var i = start_i; i < total_items; i++) {
            if (drawn_count >= max_visible) break; // No dibujar más de los que caben
            
            var option_y = menu_y + 15 + (drawn_count * line_sep);
            
            // Resaltar selección (Amarillo)
            if (i == current_item_selection) {
                draw_set_color(c_yellow);
                // DIBUJAR EL ALMA (CURSOR) AQUÍ MISMO
                draw_sprite_ext(spr_menu_cursor, 0, menu_x + 12, option_y + 5, 0.8, 0.8, 0, c_white, 1);
            } else {
                draw_set_color(c_white);
            }

            // Dibujar Nombre del Item
            draw_text(text_x, option_y, "* " + list_items[i].name);
            
            drawn_count++;
        }
    }
    
    // --- C. DESCRIPCIÓN A LA DERECHA (IGUAL QUE EN ACT) ---
    // Solo mostramos descripción si hay ítems y estamos seleccionando uno válido
    if (total_items > 0) {
        var item_sel = list_items[current_item_selection];
        var desc_text = item_sel.desc; // Usamos la variable .desc de tu struct

        var desc_x = menu_x + menu_width + 50; // +50 pixeles de aire
        var desc_y = menu_y;
        var desc_width = 250; 
        
        draw_set_color(c_gray);
        draw_text_ext(desc_x, desc_y, desc_text, 20, desc_width);
        draw_set_color(c_white); 
    }
}