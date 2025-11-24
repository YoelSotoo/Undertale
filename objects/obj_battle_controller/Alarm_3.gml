// Regresar a room original después de victoria
show_debug_message("🚪 Regresando a room: " + string(global.battle_previous_room));

// Verificar si existe obj_player, si no crearlo
if (!instance_exists(obj_Player)) {
    show_debug_message("👤 Creando obj_player nuevo...");
    var player = instance_create_depth(150, 321, 0, obj_Player);
    player.can_move = true;
    player.visible = true;
} else {
    // Si ya existe, solo hacerlo visible
    with (obj_Player) {
        visible = true;
        can_move = true;
        // Opcional: restaurar posición guardada
        // x = global.battle_player_x;
        // y = global.battle_player_y;
    }
}

// Cambiar a room original
if (variable_global_exists("battle_previous_room")) {
    room_goto(global.battle_previous_room);
} else {
    // Fallback por si no se guardó la room
    room_goto(Rm_Ruins_Tutorial);
    show_debug_message("⚠️ No se encontró room guardada, usando Rm_Ruins_Tutorial");
}