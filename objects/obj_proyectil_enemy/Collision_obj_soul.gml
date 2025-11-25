if (instance_exists(other)) {
    // No aplicar daño si el jugador ya está muerto
    var battle = instance_find(obj_battle_controller, 0);
    if (instance_exists(battle) && battle.is_player_dead) {
        instance_destroy();
        exit;
    }
    
    // Aplicar daño solo si el jugador no es invulnerable
    if (global.inv_frames <= 0) {
        global.player_hp -= damage;
        global.inv_frames = 60;
        
        // --- MARCAR QUE RECIBIÓ DAÑO (PARA REZAR) ---
        if (instance_exists(battle)) {
            battle.prayer_damage_taken = true;
			show_debug_message("PROYECTIL: Marcando prayer_damage_taken = true");
        }
        
        // Verificar si murió
        if (global.player_hp <= 0) {
            global.player_hp = 0;
        }
        
        // Activar efecto de hit (solo si no murió)
        if (global.player_hp > 0 && instance_exists(battle)) {
            battle.is_player_hit = true;
            battle.hit_timer = 0;
            battle.hit_direction = choose(-1, 1);
        }
        
        // Efecto visual en el alma
        with (other) {
            flash_timer = 10;
        }
    }
    
	audio_play_sound(snd_golpe, 1, false);
    instance_destroy();
}