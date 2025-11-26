// ALARM 3 - Cambiar a room original
if (variable_global_exists("battle_previous_room")) {
    // === AGREGAR DEBUG Y ACTUALIZACIÓN ===
    var next_enemy = scr_get_next_enemy();
    show_debug_message("🔁 Después de batalla - Siguiente enemigo: " + string(next_enemy));
    show_debug_message("📍 Volviendo a room: " + string(global.battle_previous_room));
    
    // Reset completo
    global.dialogue_active = false;
    obj_Player.can_move = true;
    obj_Player.visible = true;
    
    // Asegurar que el player pueda moverse inmediatamente
    with (obj_Player) {
        can_move = true;
    }
    
    room_goto(global.battle_previous_room);
    instance_destroy();
}