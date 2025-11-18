// Dibuja los botones que existen
for (var i = 0; i < button_count; i++) {
    draw_sprite(ButtonSprites[i], 0, ButtonPositions_X[i], 310);
}

// La lógica principal solo se ejecuta si el menú está activo
if (global.UISelectionMenu > -1) {
    
    // --- LÓGICA DEL MENÚ PRINCIPAL ---
    if (global.BattleMenu == 0) {
        // Navegación con flechas
        if (keyboard_check_pressed(vk_left)) {
            global.UISelectionMenu -= 1;
            audio_play_sound(snd_seleccionar, 1, false);
        }
        if (keyboard_check_pressed(vk_right)) {
            global.UISelectionMenu += 1;
            audio_play_sound(snd_seleccionar, 1, false);
        }
        
        // Mantiene la selección dentro del número real de botones que tienes
        global.UISelectionMenu = clamp(global.UISelectionMenu, 0, button_count - 1);
        
        // Dibuja el botón seleccionado y el cursor
        var _selected_x = ButtonPositions_X[global.UISelectionMenu];
        draw_sprite(ButtonSprites[global.UISelectionMenu], 1, _selected_x, 310);
        draw_sprite(spr_menu_cursor, 0, _selected_x, 310);
    }
    
    // --- LÓGICA PARA VOLVER ATRÁS (tecla X) ---
    if (keyboard_check_pressed(ord("X"))) {
        // Si está en menú de ACTs, volver al menú principal
        if (act_menu_visible) {
            act_menu_visible = false;
            global.BattleMenu = 0;
            global.UISelectionMenu = 1; // Volver a ACT
        } else {
            global.BattleMenu = 0;
            global.UISelectionMenu = BelowUIReferenceNum;
        }
    }
    
    // --- LÓGICA DE SELECCIÓN (tecla Z) ---
    if (keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter)) {
        
        // Si el menú de ACTs está visible, manejar selección de ACTs
        if (act_menu_visible) {
            audio_play_sound(snd_seleccionar, 1, false);
            
            // Ejecutar ACT seleccionado
            // Ejecutar ACT directamente (sin script)
			var battle = instance_find(obj_battle_controller, 0);
			if (instance_exists(battle)) {
			    switch (current_act_selection) {
			        case 0: // PROVOCAR
			            battle.enemy_damage_reduction = 0.5;
			            battle.enemy_damage_reduction_turns = 1;
			            // ACTIVAR SPRITE DE PROVOCAR
			            battle.act_sprite = spr_AllFight_Provocar;
			            battle.is_doing_act = true;
			            battle.act_timer = battle.act_duration;
			            show_debug_message("¡Provocaste al enemigo! Daño reducido próximo turno");
			            break;
            
			        case 1: // MEDITAR
			            global.player_hp -= 5;
			            if (global.player_hp < 1) global.player_hp = 1;
			            battle.player_damage_bonus = 10;
			            // ACTIVAR SPRITE DE MEDITAR
			            battle.act_sprite = spr_AllFight_Meditar;
			            battle.is_doing_act = true;
			            battle.act_timer = battle.act_duration;
			            show_debug_message("Meditaste profundamente... -5 HP, +10 daño permanente");
			            break;
            
			        case 2: // REZAR
			            battle.prayer_active = true;
			            battle.prayer_heal_amount = 5;
			            // ACTIVAR SPRITE DE REZAR
			            battle.act_sprite = spr_AllFight_Rezar;
			            battle.is_doing_act = true;
			            battle.act_timer = battle.act_duration;
			            show_debug_message("Rezaste... Si evitas daño, curarás 5 HP");
			            break;
			    }
    
			    // Pasar turno después de ACT
			    global.turn_state = "ENEMY_TURN";
			}
            
            // Cerrar menús
            act_menu_visible = false;
            global.BattleMenu = 0;
            global.UISelectionMenu = -1;
            
        } else {
            // Si NO está en menú de ACTs, manejar menú principal
            switch (global.BattleMenu) {

                // --- Caso 0: Menú Principal ---
                case 0:
                    // Si está seleccionado FIGHT (el primer botón)
                    if (global.UISelectionMenu == 0) {
                        global.turn_state = "PLAYER_ATTACK";
                        global.BattleMenu = 1.5;
                        global.UISelectionMenu = -1;
                        
                        if (!instance_exists(obj_fight_minigame)) {
                            instance_create_layer(0, 0, "Instances", obj_fight_minigame);
                        }
                    }
                    // Si está seleccionado ACT (segundo botón) → ABRIR SUBMENÚ AUTOMÁTICAMENTE
                    else if (global.UISelectionMenu == 1) {
                        act_menu_visible = true;
                        current_act_selection = 0;
                        // NO cambiar global.BattleMenu para mantener navegación
                    }
                    else {
                        // Si es ITEM u otro, cambia de menú como antes
                        global.BattleMenu = (global.UISelectionMenu + 1);
                        BelowUIReferenceNum = global.UISelectionMenu;
                        global.UISelectionMenu = 0;
                    }
                    break;

                // --- Caso 1: FIGHT (ya dentro del minijuego) ---
                case 1:
                    // (vacío)
                    break;
            }
        }
    }
}

// --- LÓGICA DE NAVEGACIÓN EN MENÚ DE ACTs ---
if (act_menu_visible) {
    // Navegación en menú de ACTs (siempre activa cuando el menú está visible)
    if (keyboard_check_pressed(vk_up)) {
        current_act_selection--;
        audio_play_sound(snd_seleccionar, 1, false);
    }
    if (keyboard_check_pressed(vk_down)) {
        current_act_selection++;
        audio_play_sound(snd_seleccionar, 1, false);
    }
    
    current_act_selection = clamp(current_act_selection, 0, array_length(act_options) - 1);
    
    // Actualizar descripción
    switch (current_act_selection) {
        case 0: // Provocar
            act_description = "Reduce el daño enemigo 50% próximo turno";
            break;
        case 1: // Meditar
            act_description = "Te haces 5 daño, luego +10 daño permanente";
            break;
        case 2: // Rezar
            act_description = "Si no recibes daño, curas 5 HP";
            break;
    }
}

// --- DIBUJAR MENÚ DE ACTs (si está visible) ---
if (act_menu_visible) {
    // Fondo del menú de ACTs (sobre el jugador)
    var menu_x = 50;
    var menu_y = 80;
    var menu_width = 150;
    var menu_height = 120;
    
    // Fondo semitransparente
    draw_set_color(make_color_rgb(0, 0, 0));
    draw_rectangle(menu_x, menu_y, menu_x + menu_width, menu_y + menu_height, false);
    draw_set_color(make_color_rgb(50, 50, 80));
    draw_rectangle(menu_x + 2, menu_y + 2, menu_x + menu_width - 2, menu_y + menu_height - 2, false);
    
    // Opciones de ACT
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_font(fnt_BattleStats);
    
    for (var i = 0; i < array_length(act_options); i++) {
        var option_y = menu_y + 20 + (i * 30);
        
        // Resaltar opción seleccionada
        if (i == current_act_selection) {
            draw_set_color(c_yellow);
            draw_text(menu_x + 30, option_y, "> " + act_options[i]);
            draw_set_color(c_white);
        } else {
            draw_text(menu_x + 30, option_y, "  " + act_options[i]);
        }
    }
    
    // Descripción de la acción seleccionada
    if (act_description != "") {
        draw_set_color(c_gray);
        draw_text(menu_x + 10, menu_y + menu_height - 25, act_description);
    }
    
    // Dibujar alma en la selección actual
    var soul_y = menu_y + 20 + (current_act_selection * 30);
    draw_sprite(spr_menu_cursor, 0, menu_x + 15, soul_y);
}