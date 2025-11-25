if place_meeting(x,y,obj_Player) and obj_Player.can_move && (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) {
    
    var instantiated = instance_create_depth(0,0,-9998, obj_TextBox);
    
    // VERIFICAR SI ESTE ENEMIGO DEBE APARECER
    var next_enemy = scr_get_next_enemy();
    
    if (next_enemy != enemy_id && next_enemy != "all_defeated") {
        // Este no es el siguiente enemigo en la secuencia
        instantiated.text[0] = "Me rindo...";
        instantiated.battle_on_end = false; // No iniciar batalla
    } 
    else if (check_progress && scr_check_progress(enemy_id) == 1) {
        // Ya fue derrotado - texto alternativo
        instantiated.text[0] = "¡Ya te derroté antes! ¿Quieres pelear de nuevo?";
        instantiated.battle_on_end = true; // Permitir pelear otra vez
    } else {
        // Primer encuentro - texto normal
        instantiated.text = text;
        instantiated.battle_on_end = battle_on_end;
    }
    
    instantiated.speaker_sprite = speaker_sprite;
    instantiated.txtb_snd = txtb_snd;
    instantiated.enemy_to_battle = enemy_to_battle;
}