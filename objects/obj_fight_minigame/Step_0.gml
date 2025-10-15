//-------------------------------------
// EVENTO STEP - obj_fight_minigame
//-------------------------------------

// Retraso inicial para soltar la tecla Z
if (input_delay > 0) {
    input_delay--;
    exit;
}

// Si el jugador puede presionar
if (can_press) {
    // Movimiento del cursor
    cursor_pos_relative += cursor_speed;
    if (abs(cursor_pos_relative) >= max_offset) {
        cursor_speed *= -1;
    }

    // Detección de tecla
    var _confirm = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter);
    if (_confirm) {
        can_press = false;
        hit_anim_frame = 0; // Animación de golpe

        // --- Lógica de daño ---
        var _damage = 0;
        var _enemy_attack = 10;

        if (abs(cursor_pos_relative) <= 10)      _damage = _enemy_attack * 2;
        else if (abs(cursor_pos_relative) <= 30) _damage = _enemy_attack * 1.5;
        else                                     _damage = _enemy_attack * 0.5;

        _damage = round(_damage);
        damage_text = string(_damage);

        // --- Activa el efecto en el enemigo (shake y flash) ---
        with (obj_battle_controller) {
            enemy_shake_timer = 10;   // tiembla
            enemy_flash_timer = 5;    // parpadea
        }

        // Espera medio segundo para limpiar texto
        alarm[0] = room_speed * 0.5;

        // Espera 1 segundo para el turno del enemigo
        alarm[1] = room_speed * 1;
    }
}
