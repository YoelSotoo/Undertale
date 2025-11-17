// Fondo del globo de texto
draw_set_color(c_black);
draw_rectangle(x - 120, y - 25, x + 120, y + 25, false);
draw_set_color(c_white);
draw_rectangle(x - 118, y - 23, x + 118, y + 23, false);

// Texto
draw_set_color(c_black);
draw_set_font(fnt_BattleStats); // Usa tu fuente de batalla
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x, y, current_text);

// Triángulo del globo apuntando al enemigo
draw_set_color(c_white);
draw_primitive_begin(pr_trianglelist);
draw_vertex(x - 10, y + 23);
draw_vertex(x + 10, y + 23);
draw_vertex(x, y + 40);
draw_primitive_end();