// Evento DRAW de obj_bulletboard (CORREGIDO)

// --- DIBUJA EL CUADRO DE BATALLA ---
var box_center_x = room_width / 2;
var box_center_y = room_height / 2;


// (Asegúrate de que global.border_width y global.border_height sean iguales, ej. 150)
var border_l = box_center_x - (global.border_width / 2);
var border_r = box_center_x + (global.border_width / 2);
var border_u = box_center_y - (global.border_height / 2);
var border_d = box_center_y + (global.border_height / 2);


draw_set_color(c_white);
// Dibuja el borde exterior
draw_rectangle(border_l - 2, border_u - 2, border_r + 2, border_d + 2, true); // 'true' para solo el borde

// Dibuja el borde interior (si quieres un borde doble)
draw_rectangle(border_l, border_u, border_r, border_d, true); // 'true' para solo el borde


// --- DIBUJA LA INTERFAZ DEL JUGADOR (STATS) ---
var ui_y = 440; // Posición Y para la barra de stats

// Texto
draw_set_font(fnt_BattleStats); // Asegúrate de que esta fuente exista
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_color(c_white);

// Nombre y Nivel
draw_text(32, ui_y, global.name);
draw_text(130, ui_y, "LV " + string(global.player_lv));

// HP
var hp_x = 220;
var hp_bar_width = global.player_max_hp * 2;
var hp_fill_width = global.player_hp * 2;

draw_text(hp_x, ui_y, "HP");

// Barra de vida
draw_set_color(c_yellow);
draw_rectangle(hp_x + 40, ui_y - 8, hp_x + 40 + hp_fill_width, ui_y + 8, false); // Relleno amarillo
draw_set_color(c_white);
draw_rectangle(hp_x + 40, ui_y - 8, hp_x + 40 + hp_bar_width, ui_y + 8, true); // Borde blanco

// Números de HP
draw_text(hp_x + 50 + hp_bar_width, ui_y, string(global.player_hp) + "/" + string(global.player_max_hp));