if (instance_exists(other)) {
    // Aplicar daño solo si el jugador no es invulnerable
    if (global.inv_frames <= 0) {
        global.player_hp -= damage;
        global.inv_frames = 60; // 1 segundo de invulnerabilidad
        
        // ACTIVAR EFECTO DE HIT - AGREGAR ESTO
        var battle = instance_find(obj_battle_controller, 0);
        if (instance_exists(battle)) {
            battle.is_player_hit = true;
            battle.hit_timer = 0;
            // Dirección aleatoria del knockback
            battle.hit_direction = choose(-1, 1); // Izquierda o derecha aleatorio
        }
        
        // Efecto visual en el alma
        with (other) {
            flash_timer = 10;
        }
    }
    
    // Destruir el proyectil
    instance_destroy();
}