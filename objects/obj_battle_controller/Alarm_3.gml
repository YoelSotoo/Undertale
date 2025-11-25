// ALARM 3 - Cambiar a room original
if (variable_global_exists("battle_previous_room")) {
    // === FORZAR EL RESET COMPLETO ===
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