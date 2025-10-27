// Ocultar alma
if (instance_exists(global.soul_id)) {
    global.soul_id.visible = false;
    with (global.soul_id) {
        x = room_width/2; // Resetear posición
        y = room_height/2;
        flash_timer = 0;
    }
}

// Reiniciar invulnerabilidad
global.inv_frames = 0;

// Destruir proyectiles restantes
with (obj_proyectil_enemy) {
    instance_destroy();
}

// Volver al turno del jugador
global.turn_state = "PLAYER_TURN";