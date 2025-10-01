// Evento STEP de obj_battle_controller

// Este objeto solo gestiona los estados principales de la batalla.
// El obj_button_controller se encargará de cambiar el estado cuando el jugador elija una acción.
switch (state) {
    case "PLAYER_TURN":
        // Esperando a que el obj_button_controller cambie el estado...
        break;

    case "ENEMY_TURN":
        // Cuando sea el turno del enemigo, haz visible el alma
        if (instance_exists(global.soul_id)) {
            global.soul_id.visible = true;
        }
        // Inicia el ataque (por ahora, con una alarma)
        alarm[0] = 3 * room_speed;
        state = "ENEMY_ATTACKING";
        break;

    case "ENEMY_ATTACKING":
        // Esperando a que termine el ataque...
        break;
}