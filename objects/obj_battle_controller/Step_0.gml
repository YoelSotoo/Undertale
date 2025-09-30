// Evento STEP de obj_battle_controller

// El 'switch' es el cerebro que controla el estado actual de la batalla
switch (state) {
    
    // ================== TURNO DEL JUGADOR ==================
    case "PLAYER_TURN":
        // 1. Damos el control al jugador para que pueda usar el menú
        player_has_control = true;
        
        // 2. Revisamos si el jugador presionó las flechas del teclado
        var move = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
        
        // Si se movió, actualizamos el botón seleccionado
        if (move != 0) {
            selected_button += move;
            
            // Lógica para que la selección sea circular (con 3 botones)
            if (selected_button >= button_count) {
                selected_button = 0;
            }
            if (selected_button < 0) {
                selected_button = button_count - 1;
            }
        }
        
        // 3. Movemos el cursor a la posición del botón que está seleccionado
        cursor_id.x = button_pos_x[selected_button];
        cursor_id.y = button_pos_y[selected_button];
        
        // 4. Revisamos si el jugador presionó "Z" para confirmar su selección
        var confirm_key = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter);
        
        if (confirm_key && player_has_control == true) {
            // Le quitamos el control para evitar múltiples acciones
            player_has_control = false;
            
            // Hacemos que el botón seleccionado muestre su animación de "flash"
            var selected_instance = instance_find(obj_button_parent, selected_button);
            if (instance_exists(selected_instance)) {
                with (selected_instance) {
                    event_perform(ev_other, ev_user0);
                }
            }
            
            // Decidimos qué hacer según el botón que se presionó
            switch (selected_button) {
                case 0: state = "FIGHT_MINIGAME"; break; // FIGHT
                case 1: state = "ACT_MENU";       break; // ACT
                case 2: state = "ITEM_MENU";      break; // ITEM
            }
        }
        break;

    // ================== ESTADOS DE ACCIÓN (Aún por programar) ==================
    case "FIGHT_MINIGAME":
        // Aquí irá la lógica para el minijuego de la barra de ataque.
        break;
    case "ACT_MENU":
        // Aquí irá la lógica para mostrar las opciones de ACTUAR.
        break;
    case "ITEM_MENU":
        // Aquí irá la lógica para mostrar el menú de OBJETOS.
        break;

    // ================== TURNO DEL ENEMIGO ==================
    case "ENEMY_TURN":
        // El jugador ya no tiene el control.
        player_has_control = false;
        
        // Hacemos el alma visible y la preparamos para el ataque
        if (instance_exists(global.soul_id)) {
            global.soul_id.visible = true;
        }

        // --- AQUÍ EMPIEZA EL ATAQUE DEL ENEMIGO (BULLET HELL) ---
        alarm[0] = 3 * room_speed; // El ataque durará 3 segundos
        state = "ENEMY_ATTACKING";
        break;

    case "ENEMY_ATTACKING":
        // Aquí es donde el alma del jugador deberá esquivar proyectiles.
        break;
}