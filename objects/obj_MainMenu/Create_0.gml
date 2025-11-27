// Configuración del menú
options = ["CONTINUAR", "REINICIAR", "SALIR"];
option_count = array_length(options);

selected = 0; // 0 es la primera opción, 1 es la segunda

// Posición del menú (Centro de la pantalla)
menu_x = room_width / 2;
menu_y = room_height / 2 + 50; // Un poco más abajo del centro
line_dist = 40; // Separación entre líneas de texto

// Variable para detectar inputs
prev_touch_up = false;
prev_touch_down = false;
prev_touch_z = false;

// VARIABLES DE TRANSICIÓN
transitioning = false; // ¿Estamos cambiando de sala?
alpha = 0;             // Opacidad del negro (0 a 1)
target_room = noone;   // A dónde vamos