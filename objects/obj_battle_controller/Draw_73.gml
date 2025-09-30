// Evento Draw End de obj_battle_controller (PRUEBA FINAL)

// Primero, forzamos a que todo se dibuje normal para anular cualquier error
draw_set_font(fnt_BattleStats); // Asegúrate que este es el nombre correcto de tu fuente
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_alpha(1); // ¡MUY IMPORTANTE! Forzamos la opacidad al 100%

// Ahora, revisamos la instancia del cursor
if (instance_exists(cursor_id)) {
    // --- Información de diagnóstico ---
    var _cx = string(round(cursor_id.x));
    var _cy = string(round(cursor_id.y));
    var _cvisible = string(cursor_id.visible);
    var _csprite = sprite_get_name(cursor_id.sprite_index);

    // --- Intento de dibujado forzado ---
    draw_sprite(spr_menu_cursor, 0, 10, 10);
    
    // --- Mostramos TODA la información en pantalla ---
    draw_text(10, 30, "Cursor Existe: Si");
    draw_text(10, 50, "Coords del objeto: " + _cx + ", " + _cy);
    draw_text(10, 70, "Propiedad 'visible': " + _cvisible);
    draw_text(10, 90, "Sprite asignado: " + _csprite);
    
} else {
    draw_text(10, 10, "ERROR: La instancia del cursor NO EXISTE.");
}