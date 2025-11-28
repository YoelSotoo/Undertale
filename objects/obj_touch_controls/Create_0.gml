// --- 1. CONFIGURACIÓN DE PANTALLA ---
depth = -10000; // Profundidad muy baja para que se dibuje ENCIMA de todo
display_set_gui_size(1280, 720); // Forzamos una resolución fija para la interfaz
var gui_w = 1280;
var gui_h = 720;

btn_size = 64;   // Tamaño original de tu sprite
scale = 2.0;     // <--- AHORA SON EL DOBLE DE GRANDES
var real_size = btn_size * scale; // Tamaño real en pantalla (128px)
var margin = 50; // Margen desde la esquina

// ==========================================
// 2. POSICIONES DE ACCIÓN
// ==========================================

// BOTÓN Z (Aceptar) - Esquina inferior derecha
btn_z_x = gui_w - margin - real_size; 
btn_z_y = gui_h - margin - real_size; 

// BOTÓN X (Correr/Cancelar) - A la izquierda del Z
// Lo separamos un poco más para mayor comodidad
btn_x_x = btn_z_x - real_size - 40; 
btn_x_y = btn_z_y + 40; 

// BOTÓN C (Menú) - ¡ARRIBA A LA DERECHA!
// Lo movemos aquí para que NO lo toques por accidente al correr
btn_c_x = gui_w - margin - real_size; 
btn_c_y = margin; 

// ==========================================
// 3. POSICIONES DE FLECHAS (IZQUIERDA)
// ==========================================
// (Esto déjalo igual que lo tenías)
var dpad_margin = 50;
btn_left_x = dpad_margin;
btn_left_y = gui_h - dpad_margin - real_size - (real_size/2);
btn_right_x = dpad_margin + (real_size * 2) + 20;
btn_right_y = gui_h - dpad_margin - real_size - (real_size/2);
btn_up_x = dpad_margin + real_size + 10;
btn_up_y = gui_h - dpad_margin - (real_size * 2) - 20;
btn_down_x = dpad_margin + real_size + 10;
btn_down_y = gui_h - dpad_margin - real_size;

// ==========================================
// 4. VARIABLES DE ESTADO (IMPORTANTE)
// ==========================================
// _held: Para correr y moverse (Mantener)
left_held = false; right_held = false; up_held = false; down_held = false;
z_held = false; x_held = false; c_held = false;

// _pressed: Para menús (Un toque)
left_pressed = false; right_pressed = false; up_pressed = false; down_pressed = false;
z_pressed = false; x_pressed = false; c_pressed = false;

// Memoria
last_z = false; last_x = false; last_c = false;
last_l = false; last_r = false; last_u = false; last_d = false;