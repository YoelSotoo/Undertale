// Solo activo durante turno enemigo
if (global.turn_state == "ENEMY_TURN" || global.turn_state == "ENEMY_ATTACKING") {
    
    // Crear proyectiles (solo una vez)
    if (!bullets_created) {
        // CREAR PROYECTILES DIRECTAMENTE AQUÍ
        var battle = instance_find(obj_battle_controller, 0);
        if (instance_exists(battle)) {
            for (var i = 0; i < 5; i++) {
                var b = instance_create_layer(battle.enemy_x, battle.enemy_y, "Instances", obj_proyectil_enemy);
                b.damage = battle.enemy_bullet_damage;
                b.pattern = "basic";
                b.alarm[0] = i * 30; // Delay escalonado
            }
        }
        bullets_created = true;
        global.turn_state = "ENEMY_ATTACKING";
    }
    
    // Controlar fin del ataque
    attack_timer--;
    if (attack_timer <= 0) {
        // TERMINAR TURNO ENEMIGO DIRECTAMENTE AQUÍ
        global.turn_state = "PLAYER_TURN";
        global.BattleMenu = 0;
        global.UISelectionMenu = 0;
        
        if (instance_exists(global.soul_id)) {
            global.soul_id.visible = false;
        }
        
        instance_destroy(); // Destruir este generador
    }
    
} else {
    // Si no es turno enemigo, destruirse
    instance_destroy();
}