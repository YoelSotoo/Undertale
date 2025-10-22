//-------------------------------------
// ALARM[1] - iniciar turno enemigo
//-------------------------------------
if (instance_exists(obj_battle_controller)) {
    with (obj_battle_controller) {
        state = "ENEMY_TURN";
    }
}
attack_done = true; // marcar para destruirse
