if (intro_done && !countdown_done)
{
    tiempo--;

    if (tiempo <= 0) {
        contador--;
        tiempo = room_speed;
    }

    if (contador < 0) {
        countdown_done = true;
        game_start = true;
        obj_carrisk.visible = true; 
    }
}


if (game_start)
{
    minijuego_tiempo--;

    if (minijuego_tiempo <= 0) {
        room_goto(rm_finMinijuego);
    }
}
// No moverse si el juego está pausado
if (global.game_paused) exit;
