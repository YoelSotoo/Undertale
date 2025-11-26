if place_meeting(x,y,obj_Player) and obj_Player.can_move && (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) {
    
    // === DECIDIR TIPO DE TEXTBOX ===
    var textbox_type = obj_TextBox;
    if (battle_on_end == true) {
        textbox_type = obj_BattleTextBox;
    }
    
    var instantiated = instance_create_depth(0,0,-9998, textbox_type);
    
    // VERIFICAR SI ESTE ENEMIGO DEBE APARECER
    var next_enemy = scr_get_next_enemy();
    
    // --- OPCIÓN 1: ESTE ENEMIGO NO TOCA AÚN ---
    if (next_enemy != enemy_id && next_enemy != "all_defeated")
    {
        instantiated.text = ["Me rindo..."];
        instantiated.draw_char = 0;
        instantiated.battle_on_end = false;
    } 
    
    // --- OPCIÓN 2: YA ESTABA DERROTADO ---
    else if (check_progress && scr_check_progress(enemy_id) == 1)
    {
        instantiated.text = ["¡Ya te derroté antes! ¿Quieres pelear de nuevo?"];
        instantiated.draw_char = 0;
        instantiated.battle_on_end = true;
    } 
    
    // --- OPCIÓN 3: TEXTO NORMAL ---
    else
    {
        // 🔥 FIX DE COPIA DEL ARRAY (evita quedarse sin texto)
        if (!variable_instance_exists(id, "text") || array_length(text) == 0) {
            instantiated.text = ["text"];
        } else {
            instantiated.text = array_create(array_length(text));
            for (var i = 0; i < array_length(text); i++) {
                instantiated.text[i] = text[i];
            }
        }
        
        instantiated.draw_char = 0;
        instantiated.battle_on_end = battle_on_end;
    }
    
    instantiated.speaker_sprite = speaker_sprite;
    instantiated.txtb_snd = txtb_snd;
    instantiated.enemy_to_battle = enemy_to_battle;
}
