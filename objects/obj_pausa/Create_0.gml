// --- CONFIGURACIÓN DEL BOTÓN DE PAUSA ---
var gw = display_get_gui_width();
var gh = display_get_gui_height();

// Posición: Centro horizontal, un poco abajo del borde superior
btn_x = gw / 2;
btn_y = 60; // Ajusta esto según qué tan "arribita" lo quieras

// --- ESTADO DEL JUEGO ---
paused = false;
pause_surf = -1; // Para guardar la imagen del juego congelado
pause_sprite = -1;

// --- CONFIGURACIÓN DEL MENÚ ---
options = ["CONTINUAR", "SALIR"];
selected = 0;
menu_margin = 40; // Separación entre opciones

// Variables de memoria táctil (Input Unificado)
prev_touch_up = false;
prev_touch_down = false;
prev_touch_z = false;
prev_touch_pause = false;