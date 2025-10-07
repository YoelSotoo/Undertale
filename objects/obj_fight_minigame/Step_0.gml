//-------------------------------------
// EVENTO STEP - obj_fight_minigame
//-------------------------------------

// Retraso inicial para que el jugador suelte la tecla Z
if (input_delay > 0) {
    input_delay--;
    exit;
}

// Si aún se puede presionar
if (can_press) {
    // Mueve el cursor
    cursor_pos_relative += cursor_speed;
    if (abs(cursor_pos_relative) >= max_offset) {
        cursor_speed *= -1;
    }

    // Detecta la pulsación de "Z" o Enter
    var _confirm = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter);
    if (_confirm) {
        can_press = false;     // Desactiva la interacción temporalmente
        hit_anim_frame = 0;    // Activa la animación del golpe

        // --- Lógica de daño (solo para mostrar número, sin enemigos por ahora) ---
        var _damage = 0;
        var _enemy_attack = 10;

        if (abs(cursor_pos_relative) <= 10) { 
            _damage = _enemy_attack * 2; 
        }
        else if (abs(cursor_pos_relative) <= 30) { 
            _damage = _enemy_attack * 1.5; 
        }
        else { 
            _damage = _enemy_attack * 0.5; 
        }

        _damage = round(_damage);
        damage_text = string(_damage);

        // Espera medio segundo y luego limpia el texto
        alarm[0] = room_speed * 0.5;
    }
}
