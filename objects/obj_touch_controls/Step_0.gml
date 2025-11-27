// 1. Reiniciar estados
left_pressed = false;
right_pressed = false;
up_pressed = false;
down_pressed = false;
z_pressed = false;
x_pressed = false;
c_pressed = false;

// 2. Revisar hasta 4 dedos
var max_fingers = 4;

// Definir el tamaño de colisión real (Base * Escala)
var size_col = btn_size * scale; 

for (var i = 0; i < max_fingers; i++) {
    if (device_mouse_check_button(i, mb_left)) {
        
        var mx = device_mouse_x_to_gui(i);
        var my = device_mouse_y_to_gui(i);
        
        // --- FLECHAS (CORREGIDO: Usando size_col) ---
        if (point_in_rectangle(mx, my, btn_left_x, btn_left_y, btn_left_x + size_col, btn_left_y + size_col)) left_pressed = true;
        if (point_in_rectangle(mx, my, btn_right_x, btn_right_y, btn_right_x + size_col, btn_right_y + size_col)) right_pressed = true;
        if (point_in_rectangle(mx, my, btn_up_x, btn_up_y, btn_up_x + size_col, btn_up_y + size_col)) up_pressed = true;
        if (point_in_rectangle(mx, my, btn_down_x, btn_down_y, btn_down_x + size_col, btn_down_y + size_col)) down_pressed = true;
        
        // --- BOTONES DE ACCIÓN (Usando size_col) ---
        
        // Botón Z
        if (point_in_rectangle(mx, my, btn_z_x, btn_z_y, btn_z_x + size_col, btn_z_y + size_col)) {
            z_pressed = true;
        }
        // Botón X
        if (point_in_rectangle(mx, my, btn_x_x, btn_x_y, btn_x_x + size_col, btn_x_y + size_col)) {
            x_pressed = true;
        }
        // Botón C
        if (point_in_rectangle(mx, my, btn_c_x, btn_c_y, btn_c_x + size_col, btn_c_y + size_col)) {
            c_pressed = true;
        }
    }
}