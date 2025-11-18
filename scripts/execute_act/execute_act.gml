function execute_act(act_index) {
    var battle = instance_find(obj_battle_controller, 0);
    if (!instance_exists(battle)) return;
    
    switch (act_index) {
        case 0: // PROVOCAR
            battle.enemy_damage_reduction = 0.5;
            battle.enemy_damage_reduction_turns = 1;
            show_debug_message("¡Provocaste al enemigo! Daño reducido próximo turno");
            break;
            
        case 1: // MEDITAR
            global.player_hp -= 5;
            if (global.player_hp < 1) global.player_hp = 1;
            battle.player_damage_bonus = 10;
            show_debug_message("Meditaste profundamente... -5 HP, +10 daño permanente");
            break;
            
        case 2: // REZAR
            battle.prayer_active = true;
            battle.prayer_heal_amount = 5;
            show_debug_message("Rezaste... Si evitas daño, curarás 5 HP");
            break;
    }
    
    // Pasar turno después de ACT
    global.turn_state = "ENEMY_TURN";
}