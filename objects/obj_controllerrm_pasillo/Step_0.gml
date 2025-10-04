// mientras el contador no haya acabado

if (!game_start) {
    tiempo--;

    // cuando el tiempo llega a 0, bajamos el contador
    if (tiempo <= 0) {
        contador--;
        tiempo = room_speed;
    }

    // si llega a 0 -> iniciar juego
    if (contador < 0) {
        game_start = true;
    }
}

if keyboard_check(vk_f4){
window_set_fullscreen(true);
}
