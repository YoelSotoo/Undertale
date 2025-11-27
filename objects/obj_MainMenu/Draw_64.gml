// Solo dibujamos si hay algo de opacidad
if (alpha > 0) {
    var gw = display_get_gui_width();
    var gh = display_get_gui_height();

    draw_set_color(c_black);
    draw_set_alpha(alpha);
    draw_rectangle(0, 0, gw, gh, false);
    
    // Resetear para no romper otros dibujos
    draw_set_alpha(1);
    draw_set_color(c_white);
}