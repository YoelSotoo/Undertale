if place_meeting(x,y,obj_Player) and obj_Player.can_move && (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) {
    
    // === DECIDIR TIPO DE TEXTBOX ===
    var textbox_type = obj_TextBox;  // Por defecto para NPCs
    if (battle_on_end == true) {
        textbox_type = obj_BattleTextBox;  // Para enemigos
    }
    
    var instantiated = instance_create_depth(0,0,-9998, textbox_type);
    
    // VERIFICAR SI ESTE ENEMIGO DEBE APARECER
    var next_enemy = scr_get_next_enemy();
    
    if (next_enemy != enemy_id && next_enemy != "all_defeated") {
        instantiated.text[0] = "Me rindo...";
        instantiated.battle_on_end = false;
    } 
    else if (check_progress && scr_check_progress(enemy_id) == 1) {
        instantiated.text[0] = "¡Ya te derroté antes! ¿Quieres pelear de nuevo?";
        instantiated.battle_on_end = true;
    } else {
        instantiated.text = text;
        instantiated.battle_on_end = battle_on_end;
    }
    
    instantiated.speaker_sprite = speaker_sprite;
    instantiated.txtb_snd = txtb_snd;
    instantiated.enemy_to_battle = enemy_to_battle;
}