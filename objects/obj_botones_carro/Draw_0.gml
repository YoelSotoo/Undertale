/// === EVENTO DRAW ===

// Transparencia general
draw_set_alpha(0.8);

// === BOTÓN DE SALTAR ===
draw_sprite_ext(spr_carro_saltar, 0, btn_saltar_x, btn_saltar_y, 1, 1, 0, c_white, 0.8);

// === BOTÓN DE CLAXON ===
draw_sprite_ext(spr_carro_claxon, 0, btn_claxon_x, btn_claxon_y, 1, 1, 0, c_white, 0.8);

// Restaurar alpha
draw_set_alpha(1);
