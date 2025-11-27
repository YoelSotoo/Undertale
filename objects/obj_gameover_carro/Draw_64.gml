// --- CONFIGURACIÓN ---
draw_set_font(font_tienda);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Tamaño real de la room
var sw = room_width;
var sh = room_height;

var cx = sw * 0.5;
var cy = sh * 0.5;


// =============================
// 1. FONDO NEGRO COMPLETO
// =============================
draw_set_color(c_black);
draw_rectangle(0, 0, sw, sh, false);


// =============================
// 2. BORDE BLANCO
// =============================
draw_set_color(c_white);

// Arriba
draw_rectangle(0, 0, sw, 4, false);

// Abajo
draw_rectangle(0, sh - 4, sw, sh, false);

// Izquierda
draw_rectangle(0, 0, 4, sh, false);

// Derecha
draw_rectangle(sw - 4, 0, sw, sh, false);


// =============================
// 3. SPRITE "GAME OVER"
// =============================
var go_y = cy - (sh * 0.25);

// Sombra
draw_sprite_ext(spr_gameover, 0, cx + 3, go_y + 3, 1, 1, 0, c_black, 1);

// Sprite principal
draw_sprite(spr_gameover, 0, cx, go_y);


// =============================
// 4. OPCIONES
// =============================
var txt1 = "Reintentar";
var txt2 = "Salir al menu";

var spacing = 48;

// Posiciones
var txt1_y = cy;
var txt2_y = cy + spacing;

// Sombra
draw_set_color(c_black);
draw_text(cx + 3, txt1_y + 3, txt1);
draw_text(cx + 3, txt2_y + 3, txt2);

// Texto
draw_set_color(c_white);
draw_text(cx, txt1_y, txt1);
draw_text(cx, txt2_y, txt2);


// =============================
// 5. CURSOR (spr_cursor)
// =============================
var cursor_offset = 120;
var cur_x = cx - cursor_offset;
var cur_y = (opcion == 0) ? txt1_y : txt2_y;

// Dibujar cursor
draw_sprite(spr_cursor, 0, cur_x, cur_y);

// Dibujar botones TOUCH
draw_set_alpha(0.8);

draw_sprite(spr_btnUP, 0, btn_up_x, btn_up_y);
draw_sprite(spr_btnDN, 0, btn_dn_x, btn_dn_y);
draw_sprite(spr_btnZ, 0, btn_ok_x, btn_ok_y);

draw_set_alpha(1);

