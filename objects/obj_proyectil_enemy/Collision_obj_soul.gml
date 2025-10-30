if (instance_exists(other)) {
    // Aplicar daño solo si el jugador no es invulnerable
    if (global.inv_frames <= 0) {
        global.player_hp -= damage;
        global.inv_frames = 60; // 1 segundo de invulnerabilidad
        
        // Efecto visual en el alma
        with (other) {
            flash_timer = 10;
        }
        
        // Sonido de daño (si tienes)
        // audio_play_sound(snd_hurt, 1, false);
    }
    
    // Destruir el proyectil
    instance_destroy();
}