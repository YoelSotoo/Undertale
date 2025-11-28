/// STEP EVENT - obj_TextBoxOpenner

// 1. DETECTAR SI EL JUGADOR ESTÁ ENCIMA Y PUEDE MOVERSE
if (place_meeting(x, y, obj_Player) && obj_Player.can_move) {
    
    // 2. DETECTAR INPUTS (Teclado O Táctil)
    var key_z = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
    var touch_z = false;
    
    // Integración Táctil
    var touch = instance_find(obj_touch_controls, 0);
    if (instance_exists(touch)) {
        if (touch.z_pressed) touch_z = true;
    }

    // 3. SI PRESIONA Z (Teclado o Touch)
    if (key_z || touch_z) {
    
        // === DECIDIR TIPO DE TEXTBOX ===
        var textbox_type = obj_TextBox;
        if (battle_on_end == true) {
            textbox_type = obj_BattleTextBox;
        }
        
        // Crear el textbox (Profundidad muy alta para tapar todo)
        var instantiated = instance_create_depth(0, 0, -9998, textbox_type);
        
        // VERIFICAR PROGRESO (Solo si usamos el script)
        var next_enemy = "";
        if (check_progress) {
             next_enemy = scr_get_next_enemy();
        }
        
        // --- OPCIÓN 1: ES UN JEFE PERO AÚN NO LE TOCA ---
        // CORRECCIÓN: Agregamos "&& check_progress" para que esto NO le pase a carteles normales
        if (check_progress && next_enemy != enemy_id && next_enemy != "all_defeated")
        {
            instantiated.text = ["Parece que está ocupado...", "(Debes vencer al anterior primero)"];
            instantiated.draw_char = 0;
            instantiated.battle_on_end = false; // No pelear
        } 
        
        // --- OPCIÓN 2: YA ESTABA DERROTADO ---
        else if (check_progress && scr_check_progress(enemy_id) == 1)
        {
            instantiated.text = ["¡Ya tuvimos suficiente por hoy!", "¿Quieres pelear de nuevo?"]; // Texto opcional
            instantiated.draw_char = 0;
            
            // Aquí decides si quieres permitir revancha o no. 
            // Si quieres revancha: true. Si no: false.
            instantiated.battle_on_end = true; 
        } 
        
        // --- OPCIÓN 3: TEXTO NORMAL / PELEA CORRESPONDIENTE ---
        else
        {
            // Copia segura del array de texto
            if (!variable_instance_exists(id, "text") || array_length(text) == 0) {
                instantiated.text = ["..."];
            } else {
                // Copiar el array elemento por elemento para evitar referencias cruzadas
                instantiated.text = array_create(array_length(text));
                for (var i = 0; i < array_length(text); i++) {
                    instantiated.text[i] = text[i];
                }
            }
            
            instantiated.draw_char = 0;
            instantiated.battle_on_end = battle_on_end;
        }
        
        // PASAR EL RESTO DE VARIABLES
        instantiated.speaker_sprite = speaker_sprite;
        instantiated.txtb_snd = txtb_snd;
        instantiated.enemy_to_battle = enemy_to_battle;
        
        // === IMPORTANTE: CONGELAR JUGADOR ===
        obj_Player.can_move = false;
        
        // Reiniciar el input táctil para evitar rebotes
        if (instance_exists(touch)) {
             touch.z_pressed = false;
        }
    }
}