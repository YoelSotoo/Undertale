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

    // Confirmar golpe
    var _confirm = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter);
    if (_confirm) {
        can_press = false;
        hit_anim_frame = 0;

        // --- Lógica de daño ---
        var _damage = 0;
        var _enemy_attack = 10;

        if (abs(cursor_pos_relative) <= 10)
            _damage = _enemy_attack * 2;
        else if (abs(cursor_pos_relative) <= 30)
            _damage = _enemy_attack * 1.5;
        else
            _damage = _enemy_attack * 0.5;

        _damage = round(_damage);
        damage_text = string(_damage);

        // Efectos en el enemigo
        with (obj_battle_controller) {
            enemy_shake_timer = 10;
            enemy_flash_timer = 5;
        }

        // --- Alarmas ---
        alarm[0] = room_speed * 0.5; // limpia texto
        alarm[1] = room_speed * 1;   // pasa turno enemigo
    }
}

// Avanzar animación del golpe
if (hit_anim_frame > -1) {
    hit_anim_frame += hit_anim_speed;
    if (hit_anim_frame >= sprite_get_number(spr_hit_dmg)) {
        hit_anim_frame = -1;
    }
}

// --- Si ya terminó el ataque, destruir instancia ---
if (attack_done) {
    instance_destroy();
}