function scr_reset_battle() {
    // Resetear variables globales de batalla
    global.player_hp = 20;
    global.player_max_hp = 20;
    global.turn_state = "PLAYER_TURN";
    global.UISelectionMenu = 0;
    global.BattleMenu = 0;
    global.inv_frames = 0;
    
    // Destruir instancias SOLO si existen (evitar errores)
    if (instance_exists(obj_proyectil_enemy)) {
        with (obj_proyectil_enemy) instance_destroy();
    }
    if (instance_exists(obj_BulletGenerator)) {
        with (obj_BulletGenerator) instance_destroy();
    }
    if (instance_exists(obj_fight_minigame)) {
        with (obj_fight_minigame) instance_destroy();
    }
    if (instance_exists(obj_buttoncontroller)) {
        with (obj_buttoncontroller) instance_destroy();
    }
    if (instance_exists(obj_soul)) {
        with (obj_soul) instance_destroy();
    }
    if (instance_exists(obj_battle_controller)) {
        with (obj_battle_controller) instance_destroy();
    }
    
    // Recrear el controlador de batalla
    instance_create_layer(0, 0, "Instances", obj_battle_controller);
    
    // Destruir esta instancia de Game Over
    instance_destroy();
}