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
        var battle = instance_find(obj_battle_controller, 0);
        if (instance_exists(battle)) {
            _player_attack += battle.player_damage_bonus;
        }

        if (abs(cursor_pos_relative) <= 10)
            _damage = _player_attack * 2;
        else if (abs(cursor_pos_relative) <= 30)
            _damage = _player_attack * 1.5;
        else
            _damage = _player_attack * 0.5;

        _damage = round(_damage);
        damage_text = string(_damage);
        
        // --- ¡APLICAR DAÑO AL ENEMIGO! ---
        var battle = instance_find(obj_battle_controller, 0);
        if (instance_exists(battle)) {
            var dano_final = max(1, _damage);
            battle.enemy_hp -= dano_final;
            
            show_debug_message("Daño aplicado: " + string(dano_final) + " | HP enemigo: " + string(battle.enemy_hp));
            
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

        // --- Alarmas ---
        alarm[0] = room_speed * 0.5;
        alarm[1] = room_speed * 1;
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