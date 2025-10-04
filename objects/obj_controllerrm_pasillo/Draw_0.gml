if (!game_start) {
    draw_set_font(font_cuentaregresiva);  
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    var mensaje = string(contador);
    if (contador <= 0) {
        mensaje = "GO!!!";
    }

    var xx = room_width/2;
    var yy = 120;

    // 1. sombra (ligeramente desplazada)
    draw_set_color(c_black);
    draw_text(xx + 5, yy + 5, mensaje);

    // 2. texto principal
    draw_set_color(c_white);
    draw_text(xx, yy, mensaje);
}
