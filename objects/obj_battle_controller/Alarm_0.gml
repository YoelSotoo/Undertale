// Termina el turno del enemigo
if (instance_exists(global.soul_id)) {
    global.soul_id.visible = false;
    with (global.soul_id) {
        flash_timer = 0;
    }
}

// Reiniciar invulnerabilidad
global.inv_frames = 0;

// Vuelve al turno del jugador
state = "PLAYER_TURN";
