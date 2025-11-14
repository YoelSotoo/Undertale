if (activo) {
    var w = 300;
    var h = 120;
    var bx = display_get_gui_width() / 2 - w / 2;
    var by = display_get_gui_height() / 2 - h / 2;

    // Fondo negro
    draw_set_color(c_black);
    draw_rectangle(bx, by, bx + w, by + h, false);

    // Borde blanco
    draw_set_color(c_white);
    draw_rectangle(bx, by, bx + w, by + h, true);

    // Texto
	draw_set_font(font_inventario)
    draw_text(bx + 40, by + 30, "Guardas o q royo?");
    draw_text(bx + 60, by + 70, "Si [Z]");
    draw_text(bx + 180, by + 70, "No [X]");
}
