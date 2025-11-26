draw_set_color(c_white);
if (!game_start)
{
    draw_set_font(font_cuentaregresiva);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    var mensaje = string(contador);
    if (contador <= 0) mensaje = "GO!!!";

    var texto_x = room_width / 2;
    var texto_y = 120;

    draw_set_color(c_black);
    draw_text(texto_x + 5, texto_y + 5, mensaje);

    draw_set_color(c_white);
    draw_text(texto_x, texto_y, mensaje);

    exit;
}


var p = 1 - (minijuego_tiempo / minijuego_tiempo_total);
p = clamp(p, 0, 1);

var pos_cara_x = lerp(progreso_x_inicio, progreso_x_final, p);


// Línea con borde
var linea_x1 = progreso_x_inicio;
var linea_x2 = progreso_x_final;
var linea_y  = progreso_y;
var grosor   = 6;

draw_set_color(c_black);
draw_rectangle(linea_x1 - 2, linea_y - grosor, linea_x2 + 2, linea_y + grosor, false);

draw_set_color(c_white);
draw_rectangle(linea_x1, linea_y - (grosor - 2), linea_x2, linea_y + (grosor - 2), false);


// Meta y cara
draw_sprite(spr_hudmeta, 0, progreso_x_final, progreso_y);
draw_sprite(spr_hudface, 0, pos_cara_x, progreso_y);
