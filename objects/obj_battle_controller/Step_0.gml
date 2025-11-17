// Verificar si el jugador murió
if (global.player_hp <= 0 && !is_player_dead) {
    global.player_hp = 0;
    is_player_dead = true;
    death_timer = 0;
    
    // Detener toda la batalla
    global.turn_state = "PLAYER_DEAD";
    
    // Ocultar alma
    if (instance_exists(global.soul_id)) {
        global.soul_id.visible = false;
    }
    
    // Destruir proyectiles
    with (obj_proyectil_enemy) {
        instance_destroy();
    }
    
    // Destruir BulletGenerator
    if (instance_exists(obj_BulletGenerator)) {
        instance_destroy(obj_BulletGenerator);
    }
    
    // Ocultar menú
    global.UISelectionMenu = -1;
}

// Controlar efectos de muerte
if (is_player_dead) {
    death_timer++;
    
    // Efecto de desvanecimiento o shake durante la muerte
    if (death_timer < 30) {
        // Pequeño shake inicial
        attack_x = player_base_x + random_range(-3, 3);
        attack_y = 256 + random_range(-2, 2);
    }
    else if (death_timer < 90) {
        // Desvanecimiento lento
        attack_y += 0.5; // Se hunde lentamente
    }
    
    // Después del tiempo, game over
    if (death_timer >= death_duration) {
        // Aquí puedes cambiar a pantalla de game over
        show_debug_message("GAME OVER - Jugador murió");
        // room_goto(room_game_over); // Para luego
    }
}


// Controlar animación de ataque con 8 frames
if (is_attacking) {
    attack_timer++;
    
    // Cambiar frame según la velocidad
    if (attack_timer >= attack_speed) {
        attack_timer = 0;
        attack_frame++;
        
        // Si llegó al final de la animación, terminar
        if (attack_frame >= 8) {
            is_attacking = false;
            attack_frame = 0;
        }
    }
}
// Controlar efecto de hit del jugador - VERSIÓN LENTA Y LARGA
if (is_player_hit) {
    hit_timer++;
    
    // Movimiento de shake más lento y prolongado
    var progress = hit_timer / hit_duration;
    
    if (progress < 0.4) {
        // Fase 1: Knockback inicial más suave
        var target_x = player_base_x + (hit_knockback * hit_direction);
        attack_x = lerp(attack_x, target_x, hit_shake_speed);
    } 
    else if (progress < 0.8) {
        // Fase 2: Oscilación lenta de regreso
        var oscillation = sin(hit_timer * 0.3) * 8; // ↑ MÁS LENTO
        attack_x = player_base_x + oscillation;
    }
    else {
        // Fase 3: Regreso final muy suave
        attack_x = lerp(attack_x, player_base_x, 0.1); // ↑ MÁS SUAVE
    }
    
    // Pequeño movimiento vertical sutil
    if (progress < 0.6) {
        var vertical_shake = sin(hit_timer * 0.4) * 3; // ↑ MÁS LENTO
        attack_y = 256 + vertical_shake;
    } else {
        attack_y = lerp(attack_y, 256, 0.15);
    }
    
    // Terminar efecto
    if (hit_timer >= hit_duration) {
        is_player_hit = false;
        hit_timer = 0;
        attack_x = player_base_x;
        attack_y = 256;
    }
}	
// Verificar victoria
if (enemy_hp <= 0 && global.turn_state != "BATTLE_END") {
    global.turn_state = "BATTLE_END";
    
    // Crear texto de victoria
    if (!instance_exists(obj_victory_text)) {
        instance_create_layer(0, 0, "UI", obj_victory_text);
    }
    // Pequeño movimiento de alegría
    enemy_y = 256 + sin(current_time / 100000) * 5; // Oscilación suave
	
    // Ocultar alma y detener proyectiles
    if (instance_exists(global.soul_id)) {
        global.soul_id.visible = false;
    }
    
    // Destruir todos los proyectiles
    with (obj_proyectil_enemy) {
        instance_destroy();
    }
    
    // Destruir BulletGenerator si existe
    if (instance_exists(obj_BulletGenerator)) {
        instance_destroy(obj_BulletGenerator);
    }
    
    // Ocultar menú
    global.UISelectionMenu = -1;
}

// Controlar efectos visuales
if (enemy_shake_timer > 0) enemy_shake_timer--;
if (enemy_flash_timer > 0) enemy_flash_timer--;

// Lógica principal de estados
switch (global.turn_state) {
    case "PLAYER_TURN":
        // Menú activo - alma oculta
        if (instance_exists(global.soul_id)) 
            global.soul_id.visible = false;
        break;
        
    case "PLAYER_ATTACK": // Cambié FIGHT_MINIGAME por nombre más claro
        // Minijuego activo
        if (!instance_exists(obj_fight_minigame)) {
            // Crear minijuego si no existe
            var mini = instance_create_layer(0, 0, "Instances", obj_fight_minigame);
            mini.controller_id = id;
        } else {
            // Esperar a que el minijuego termine (se destruya)
            // El minijuego debe cambiar global.turn_state cuando termine
        }
        break;
        
    case "ENEMY_TURN":
		 if (instance_exists(global.soul_id)) global.soul_id.visible = true;
    
    // Crear el generador de balas (solo una vez)
		 if (!instance_exists(obj_BulletGenerator)) {
			 instance_create_layer(0, 0, "Instances", obj_BulletGenerator);
		  }
			break;
        
    case "ENEMY_ATTACKING":
        // El ataque ya está en progreso, esperar que termine
        // La alarma controla el fin del turno
        break;
}