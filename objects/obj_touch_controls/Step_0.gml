// 1. Reiniciar estados "Held" (Mantener)
left_held = false;
right_held = false;
up_held = false;
down_held = false;
z_held = false;
x_held = false;
c_held = false;

// 2. Revisar los dedos (Multitouch)
var max_fingers = 4;
var size_col = btn_size * scale; 

for (var i = 0; i < max_fingers; i++) {
    if (device_mouse_check_button(i, mb_left)) {
        
        var mx = device_mouse_x_to_gui(i);
        var my = device_mouse_y_to_gui(i);
        
        // --- FLECHAS (Detectamos si MANTIENES el dedo) ---
        if (point_in_rectangle(mx, my, btn_left_x, btn_left_y, btn_left_x + size_col, btn_left_y + size_col)) left_held = true;
        if (point_in_rectangle(mx, my, btn_right_x, btn_right_y, btn_right_x + size_col, btn_right_y + size_col)) right_held = true;
        if (point_in_rectangle(mx, my, btn_up_x, btn_up_y, btn_up_x + size_col, btn_up_y + size_col)) up_held = true;
        if (point_in_rectangle(mx, my, btn_down_x, btn_down_y, btn_down_x + size_col, btn_down_y + size_col)) down_held = true;
        
        // --- BOTONES DE ACCIÓN ---
        if (point_in_rectangle(mx, my, btn_z_x, btn_z_y, btn_z_x + size_col, btn_z_y + size_col)) z_held = true;
        
        // BOTÓN X (CORRER): Aquí es donde ocurre la magia. 
        // Al usar _held, la variable se mantiene TRUE todo el tiempo que toques.
        if (point_in_rectangle(mx, my, btn_x_x, btn_x_y, btn_x_x + size_col, btn_x_y + size_col)) x_held = true;
        
        if (point_in_rectangle(mx, my, btn_c_x, btn_c_y, btn_c_x + size_col, btn_c_y + size_col)) c_held = true;
    }
}

// 3. Calcular "Pressed" (Clic único para menús)
z_pressed = (z_held && !last_z);
x_pressed = (x_held && !last_x);
c_pressed = (c_held && !last_c);

left_pressed = (left_held && !last_l);
right_pressed = (right_held && !last_r);
up_pressed = (up_held && !last_u);
down_pressed = (down_held && !last_d);

// 4. Guardar estado
last_z = z_held; last_x = x_held; last_c = c_held;
last_l = left_held; last_r = right_held; last_u = up_held; last_d = down_held;