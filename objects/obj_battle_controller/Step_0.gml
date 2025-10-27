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