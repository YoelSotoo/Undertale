// Retraso inicial
if (input_delay > 0) {
    input_delay--;
    exit;
}

// Si el jugador puede presionar
if (can_press) {
    // Movimiento del cursor
    cursor_pos_relative += cursor_speed;
    if (abs(cursor_pos_relative) >= max_offset) cursor_speed *= -1;

    // --- DETECCIÓN DE GOLPE (TECLADO + TÁCTIL) ---
    var _confirm = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter);
    
    // Integración Táctil
    var touch = instance_find(obj_touch_controls, 0);
    if (instance_exists(touch)) {
        // Si tocas el botón Z en la pantalla
        if (touch.z_pressed) {
            _confirm = true;
        }
        
        // OPCIONAL: También permitir tocar CUALQUIER PARTE de la zona del minijuego
        // (Esto hace que sea más fácil atinarle al golpe sin buscar el botón Z)
        /*
        for (var i = 0; i < 4; i++) {
             if (device_mouse_check_button_pressed(i, mb_left)) {
                 // Si el toque está cerca del centro de la pantalla (zona del bar)
                 if (abs(device_mouse_y_to_gui(i) - y) < 100) {
                     _confirm = true;
                 }
             }
        }
        */
    }

    if (_confirm) {
        can_press = false;
        hit_anim_frame = 0;
        
        // --- ACTIVAR ANIMACIÓN DE ATAQUE COMPLETA ---
        var battle = instance_find(obj_battle_controller, 0);
        if (instance_exists(battle)) {
            battle.is_attacking = true;
            battle.attack_frame = 0;
            battle.attack_timer = 0;
        }
        
        // --- Lógica de daño ---
        var _damage = 0;
        var _player_attack = 10;

        // Aplicar bonus de meditar
        if (instance_exists(battle)) {
            _player_attack += battle.player_damage_bonus;
        }

        if (abs(cursor_pos_relative) <= 10)
            _damage = _player_attack * 2; // Crítico (Centro)
        else if (abs(cursor_pos_relative) <= 30)
            _damage = _player_attack * 1.5; // Golpe fuerte
        else
            _damage = _player_attack * 0.5; // Golpe débil

        _damage = round(_damage);
        damage_text = string(_damage);
        
        // --- ¡APLICAR DAÑO AL ENEMIGO! ---
        if (instance_exists(battle)) {
            var dano_final = max(1, _damage);
            battle.enemy_hp -= dano_final;
            audio_play_sound(snd_hit, 1, false);
            
            show_debug_message("Daño: " + string(dano_final) + " | HP Restante: " + string(battle.enemy_hp));
            
            if (battle.enemy_hp <= 0) {
                battle.enemy_hp = 0;
                show_debug_message("¡ENEMIGO DERROTADO!");
            }
        }
        
        // Efectos en el enemigo
        with (obj_battle_controller) {
            enemy_shake_timer = 10;
            enemy_flash_timer = 5;
        }

        // --- Alarmas para terminar el turno ---
        alarm[0] = room_speed * 0.5;
        alarm[1] = room_speed * 1;
    }
}

// Avanzar animación del golpe (el slash visual)
if (hit_anim_frame > -1) {
    hit_anim_frame += hit_anim_speed;
    // Asegúrate de que spr_hit_dmg exista, si no, usa tu sprite de golpe
    if (sprite_exists(spr_hit_dmg)) {
        if (hit_anim_frame >= sprite_get_number(spr_hit_dmg)) {
            hit_anim_frame = -1;
        }
    } else {
        hit_anim_frame = -1; // Terminar si no hay sprite para evitar errores
    }
}

// --- Si ya terminó el ataque, destruir instancia ---
if (attack_done) {
    instance_destroy();
}