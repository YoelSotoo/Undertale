//-------------------------------------
// EVENTO ALARM[0] - obj_battle_controller
//-------------------------------------

// Termina el turno enemigo
if (instance_exists(global.soul_id)) {
    global.soul_id.visible = false;
    with (global.soul_id) {
        flash_timer = 0;
    }
}

// Resetear invulnerabilidad
global.inv_frames = 0;

// Vuelve al turno del jugador
state = "PLAYER_TURN";
