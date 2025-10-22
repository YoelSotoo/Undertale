//-------------------------------------
// DRAW - obj_battle_HUD
//-------------------------------------

// Fuente y colores
draw_set_font(fnt_BattleStats);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// --- Nombre y nivel ---
draw_text(30, 400, global.name + "    LV " + string(global.player_lv));

// --- Texto HP ---
draw_text(255, 400, "HP");

// --- Barra de HP ---
var hp_max_width = 100; // largo máximo de la barra
var hp_ratio = global.player_hp / global.player_max_hp;
var hp_width = hp_max_width * hp_ratio;

var bar_x1 = 300;
var bar_y1 = 400;
var bar_x2 = bar_x1 + hp_max_width;
var bar_y2 = 418;

// Fondo rojo (HP total)
draw_set_color(c_red);
draw_rectangle(bar_x1, bar_y1, bar_x2, bar_y2, false);

// Amarillo (HP actual)
draw_set_color(c_yellow);
draw_rectangle(bar_x1, bar_y1, bar_x1 + hp_width, bar_y2, false);

// --- Texto numérico ---
draw_set_color(c_white);
draw_text(bar_x2 + 20, bar_y1, string(global.player_hp) + "/" + string(global.player_max_hp));
