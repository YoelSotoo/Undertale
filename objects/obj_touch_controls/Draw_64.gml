// Configuración de transparencia visual
var alpha_idle = 0.5; // Transparencia normal (50%)
var alpha_press = 0.9; // Transparencia al tocar (90%)

// ==========================================
// 1. DIBUJAR BOTONES DE ACCIÓN (DERECHA)
// ==========================================

// --- BOTÓN Z (Aceptar) ---
var frame_z = z_pressed ? 1 : 0;              // Cambia de subimagen si tienes animación
var alpha_z = z_pressed ? alpha_press : alpha_idle;
// IMPORTANTE: Los argumentos 5 y 6 son 'scale'. Esto los hace grandes.
draw_sprite_ext(spr_btnZ, frame_z, btn_z_x, btn_z_y, scale, scale, 0, c_white, alpha_z);

// --- BOTÓN X (Cancelar/Correr) ---
var frame_x = x_pressed ? 1 : 0;
var alpha_x = x_pressed ? alpha_press : alpha_idle;
draw_sprite_ext(spr_btnX, frame_x, btn_x_x, btn_x_y, scale, scale, 0, c_white, alpha_x);

// --- BOTÓN C (Menú) ---
var frame_c = c_pressed ? 1 : 0;
var alpha_c = c_pressed ? alpha_press : alpha_idle;
draw_sprite_ext(spr_btnC, frame_c, btn_c_x, btn_c_y, scale, scale, 0, c_white, alpha_c);


// ==========================================
// 2. DIBUJAR FLECHAS DE MOVIMIENTO (IZQUIERDA)
// ==========================================
// Asegúrate de tener estos sprites: spr_btnL, spr_btnR, spr_btnUP, spr_btnDN
// Si tus sprites se llaman diferente, cambia los nombres aquí abajo.

// --- IZQUIERDA ---
var frame_l = left_pressed ? 1 : 0;
var alpha_l = left_pressed ? alpha_press : alpha_idle;
if (sprite_exists(spr_btnL)) {
    draw_sprite_ext(spr_btnL, frame_l, btn_left_x, btn_left_y, scale, scale, 0, c_white, alpha_l);
}

// --- DERECHA ---
var frame_r = right_pressed ? 1 : 0;
var alpha_r = right_pressed ? alpha_press : alpha_idle;
if (sprite_exists(spr_btnR)) {
    draw_sprite_ext(spr_btnR, frame_r, btn_right_x, btn_right_y, scale, scale, 0, c_white, alpha_r);
}

// --- ARRIBA ---
var frame_u = up_pressed ? 1 : 0;
var alpha_u = up_pressed ? alpha_press : alpha_idle;
if (sprite_exists(spr_btnUP)) {
    draw_sprite_ext(spr_btnUP, frame_u, btn_up_x, btn_up_y, scale, scale, 0, c_white, alpha_u);
}

// --- ABAJO ---
var frame_d = down_pressed ? 1 : 0;
var alpha_d = down_pressed ? alpha_press : alpha_idle;
if (sprite_exists(spr_btnDN)) {
    draw_sprite_ext(spr_btnDN, frame_d, btn_down_x, btn_down_y, scale, scale, 0, c_white, alpha_d);
}

// --- DEBUG (Opcional) ---
// Si los botones no aparecen, descomenta esto para ver cuadros rojos donde deberían estar
/*
draw_set_color(c_red);
draw_rectangle(btn_z_x, btn_z_y, btn_z_x + (btn_size*scale), btn_z_y + (btn_size*scale), true);
draw_rectangle(btn_left_x, btn_left_y, btn_left_x + (btn_size*scale), btn_left_y + (btn_size*scale), true);
draw_set_color(c_white);
*/