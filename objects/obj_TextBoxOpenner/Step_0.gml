// 1. DETECTAR SI EL JUGADOR ESTÁ ENCIMA Y PUEDE MOVERSE
if (place_meeting(x, y, obj_Player) && obj_Player.can_move) {
    
    // 2. DETECTAR INPUTS (Teclado O Táctil)
    var key_z = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
    var touch_z = false;
    
    // Buscar controles táctiles
    var touch = instance_find(obj_touch_controls, 0);
    if (instance_exists(touch)) {
        // Como al abrir el diálogo el jugador se congela (can_move = false),
        // no necesitamos lógica compleja de "un solo clic" aquí.
        // Con que detecte que estás presionando Z es suficiente.
        if (touch.z_pressed) touch_z = true;
    }

    // 3. SI PRESIONA Z (Teclado o Touch)
    if (key_z || touch_z) {
    
        // === DECIDIR TIPO DE TEXTBOX ===
        var textbox_type = obj_TextBox;
        if (battle_on_end == true) {
            textbox_type = obj_BattleTextBox;
        }
        
        // Crear el textbox muy por encima de todo
        var instantiated = instance_create_depth(0, 0, -9998, textbox_type);
        
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
            // 🔥 FIX DE COPIA DEL ARRAY
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
        
        // Pasar variables al TextBox creado
        instantiated.speaker_sprite = speaker_sprite;
        instantiated.txtb_snd = txtb_snd;
        instantiated.enemy_to_battle = enemy_to_battle;
        
        // IMPORTANTE: Detener al jugador para que no se abra el diálogo mil veces
        obj_Player.can_move = false;
        
        // Reiniciar el botón Z táctil para que no se quede pegado
        if (instance_exists(touch)) {
             touch.z_pressed = false;
        }
    }
}