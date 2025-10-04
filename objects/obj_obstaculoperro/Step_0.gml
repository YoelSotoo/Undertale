x += vel_x;

// si sale de la pantalla, destruir
if (x < -64) instance_destroy();


if (keyboard_check_pressed(vk_right) && !saltando) {
    saltando = true;
    vel_y = -12; 
}
else if (keyboard_check_pressed(vk_up) && !saltando){
	saltando = true;
    vel_y = -12; 
}

// física de salto
if (saltando) {
    y += vel_y;
    vel_y += gravedad;

    // si regresa al suelo
    if (y >= y_suelo) {
        y = y_suelo;
        vel_y = 0;
        saltando = false;
    }
} 

