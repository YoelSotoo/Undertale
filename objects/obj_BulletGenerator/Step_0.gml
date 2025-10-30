// Solo activo durante turno enemigo
if (global.turn_state == "ENEMY_TURN" || global.turn_state == "ENEMY_ATTACKING") {
    
    pattern_timer++;
    
    // Crear proyectiles con patrón aleatorio
    if (!bullets_created) {
        var battle = instance_find(obj_battle_controller, 0);
        scr_create_bullet_pattern(battle, current_pattern, pattern_timer);
        bullets_created = true;
        global.turn_state = "ENEMY_ATTACKING";
    }
    
    // Crear nuevas oleadas (solo para patrones específicos)
    if (should_create_wave(current_pattern) && pattern_timer mod 60 == 0 && wave_count < 2) {
        var battle = instance_find(obj_battle_controller, 0);
        scr_create_bullet_pattern(battle, current_pattern, pattern_timer);
        wave_count++;
    }
    
    // Controlar fin del ataque
    attack_timer--;
    if (attack_timer <= 0) {
        global.turn_state = "PLAYER_TURN";
        global.BattleMenu = 0;
        global.UISelectionMenu = 0;
        
        if (instance_exists(global.soul_id)) {
            global.soul_id.visible = false;
        }
        
        instance_destroy();
    }
    
} else {
    instance_destroy();
}