//-------------------------------------
// EVENTO ALARM[2] - obj_fight_minigame
//-------------------------------------

enemy_turn = false;  // termina el turno del enemigo
can_press = true;    // vuelve el turno del jugador

// Destruye el minijuego para pasar al turno enemigo real
instance_destroy();
