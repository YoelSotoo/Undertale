// --- Turno del enemigo ---
enemy_turn = true;

// --- Efecto visual (tiembla y parpadea el enemigo) ---
with (obj_battle_controller) {
    enemy_flash_timer = 5;
    enemy_shake_timer = 8;

    // Crea una bala enemiga simple
    var bx = 545;
    var by = 256;
    instance_create_layer(bx, by, "Instances", obj_enemy_bullet);
}

// Espera medio segundo antes de devolver el turno al jugador
alarm[2] = room_speed * 0.5;
