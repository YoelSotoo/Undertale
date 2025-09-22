var border_l = 320 - (current_width/2);
var border_r = 320 + (current_width/2);
var border_u = 384 - current_height;
var border_d = 384;

obj_soul.x = clamp(obj_soul.x, border_l+8, border_r-8);
obj_soul.y = clamp(obj_soul.y, border_u+8, border_d-8);

draw_set_color(c_white);
draw_rectangle(border_l - 4, border_u - 4, border_r + 4, border_d + 4, false);
draw_set_color(c_black);
draw_rectangle(border_l, border_u, border_r, border_d, false);

// ----------------- Barra de vida -----------------
var hp_barwidth     = global.player_max_hp * 2;     // *2 para que sea más larga
var hp_fillwidth    = global.player_hp * 2;

// Texto
draw_set_font(fnt_BattleStats);
draw_set_color(c_white);

// Nombre y nivel (pegados a la izquierda)
draw_text(50, 400, global.name);
draw_text(150, 400, "LV " + string(global.player_lv));

// HP (etiqueta y números)
draw_text(250, 400, "HP");
draw_text(310 + hp_barwidth, 400, string(global.player_hp) + "/" + string(global.player_max_hp));

// Barra
draw_set_color(c_red);
draw_rectangle(300, 400, 300 + hp_barwidth, 418, false);

draw_set_color(c_yellow);
draw_rectangle(300, 400, 300 + hp_fillwidth, 418, false);
