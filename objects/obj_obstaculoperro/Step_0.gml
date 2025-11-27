// Movimiento horizontal
x += vel_x;

// destruir si sale
if (x < -600) instance_destroy();

// SALTO por teclado O por botones táctiles
if ((keyboard_check_pressed(vk_right) || global.claxon_touch) && !saltando) {
    saltando = true;
    vel_y = -12;
}
else if ((keyboard_check_pressed(vk_up) || global.salto_touch) && !saltando) {
    saltando = true;
    vel_y = -12;
}

// física de salto
if (saltando) {
    y += vel_y;
    vel_y += gravedad;

    if (y >= y_suelo) {
        y = y_suelo;
        vel_y = 0;
        saltando = false;
    }
}

// Después de leerlos, resetear los botones táctiles
global.claxon_touch  = false;
global.salto_touch   = false;
