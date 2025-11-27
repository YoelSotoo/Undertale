// =========================================================
// 1. INPUT UNIFICADO (TECLADO + TOUCH)
// =========================================================

// A. Capturar teclado
var _press_left   = keyboard_check_pressed(vk_left);
var _press_right  = keyboard_check_pressed(vk_right);
var _press_up     = keyboard_check_pressed(vk_up);
var _press_down   = keyboard_check_pressed(vk_down);
var _press_ok     = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter);
var _press_cancel = keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_shift);

// B. Capturar Touch
var touch = instance_find(obj_touch_controls, 0);

if (instance_exists(touch)) {
    // Detectamos si se acaba de presionar (Flanco de subida)
    if (touch.left_pressed && !last_t_l)  _press_left = true;
    if (touch.right_pressed && !last_t_r) _press_right = true;
    if (touch.up_pressed && !last_t_u)    _press_up = true;
    if (touch.down_pressed && !last_t_d)  _press_down = true;
    
    // Z = Aceptar, X = Cancelar
    if (touch.z_pressed && !last_t_z)     _press_ok = true;     
    if (touch.x_pressed && !last_t_x)     _press_cancel = true; 

    // Guardar estado
    last_t_l = touch.left_pressed; last_t_r = touch.right_pressed;
    last_t_u = touch.up_pressed;   last_t_d = touch.down_pressed;
    last_t_z = touch.z_pressed;    last_t_x = touch.x_pressed;
}

// =========================================================
// 2. LÓGICA DEL MENÚ
// =========================================================

if (global.UISelectionMenu > -1) {
    
    // --- NAVEGACIÓN MENÚ PRINCIPAL ---
    // Solo si NO estamos en el submenú de ACT
    if (global.BattleMenu == 0 && !act_menu_visible) {
        if (_press_left) {
            global.UISelectionMenu -= 1;
            audio_play_sound(snd_seleccionar, 1, false);
        }
        if (_press_right) {
            global.UISelectionMenu += 1;
            audio_play_sound(snd_seleccionar, 1, false);
        }
        global.UISelectionMenu = clamp(global.UISelectionMenu, 0, button_count - 1);
    }
    
    // --- BOTÓN X (CANCELAR/ATRÁS) ---
    if (_press_cancel) {
        if (act_menu_visible) {
            act_menu_visible = false;
            global.BattleMenu = 0;
            global.UISelectionMenu = 1; // Volver al botón ACT
        } else {
            // Si quieres que X haga algo en el menú principal (como nada), déjalo vacío
            if (global.BattleMenu > 0) {
                 global.BattleMenu = 0;
                 global.UISelectionMenu = BelowUIReferenceNum;
            }
        }
    }
    
    // --- BOTÓN Z (ACEPTAR) ---
    if (_press_ok) {
        
        // A) SI ESTÁ EN SUBMENÚ DE ACTS
        if (act_menu_visible) {
            audio_play_sound(snd_seleccionar, 1, false);
            
            var battle = instance_find(obj_battle_controller, 0);
            if (instance_exists(battle)) {
                // Aplicar lógica del ACT elegido
                switch (current_act_selection) {
                    case 0: // PROVOCAR
                        battle.enemy_damage_reduction = 0.5;
                        battle.enemy_damage_reduction_turns = 1;
                        battle.act_sprite = spr_AllFight_Provocar;
                        battle.is_doing_act = true;
                        battle.act_timer = battle.act_duration;
                        show_debug_message("¡Provocaste!");
                        break;
                    case 1: // MEDITAR
                        global.player_hp -= 5;
                        if(global.player_hp < 1) global.player_hp = 1;
                        battle.player_damage_bonus = 10;
                        battle.act_sprite = spr_AllFight_Meditar;
                        battle.is_doing_act = true;
                        battle.act_timer = battle.act_duration;
                        show_debug_message("Meditaste...");
                        break;
                    case 2: // REZAR
                        battle.prayer_active = true;
                        battle.prayer_heal_amount = 5;
                        battle.prayer_damage_taken = false;
                        battle.act_sprite = spr_AllFight_Rezar;
                        battle.is_doing_act = true;
                        battle.act_timer = battle.act_duration;
                        show_debug_message("Rezaste...");
                        break;
                }
                // Cambiar turno a enemigo
                global.turn_state = "ENEMY_TURN";
            }
            // Cerrar menú y resetear
            act_menu_visible = false;
            global.BattleMenu = 0;
            global.UISelectionMenu = -1; 
        } 
        
        // B) SI ESTÁ EN MENÚ PRINCIPAL
        else {
            if (global.BattleMenu == 0) {
                // FIGHT
                if (global.UISelectionMenu == 0) {
                    global.turn_state = "PLAYER_ATTACK";
                    global.BattleMenu = 1.5;
                    global.UISelectionMenu = -1;
                    if (!instance_exists(obj_fight_minigame)) {
                        instance_create_layer(0, 0, "Instances", obj_fight_minigame);
                    }
                }
                // ACT
                else if (global.UISelectionMenu == 1) {
                    act_menu_visible = true;
                    current_act_selection = 0;
                }
                // OTROS (ITEM)
                else {
                    global.BattleMenu = (global.UISelectionMenu + 1);
                    BelowUIReferenceNum = global.UISelectionMenu;
                    global.UISelectionMenu = 0;
                }
            }
        }
    }
}

// --- NAVEGACIÓN VERTICAL EN MENÚ ACT ---
if (act_menu_visible) {
    if (_press_up) {
        current_act_selection--;
        audio_play_sound(snd_seleccionar, 1, false);
    }
    if (_press_down) {
        current_act_selection++;
        audio_play_sound(snd_seleccionar, 1, false);
    }
    current_act_selection = clamp(current_act_selection, 0, array_length(act_options) - 1);
    
    // Descripciones
    switch (current_act_selection) {
        case 0: act_description = "Reduce el daño enemigo 50% próximo turno"; break;
        case 1: act_description = "Te haces 5 daño, luego +10 daño permanente"; break;
        case 2: act_description = "Si no recibes daño, curas 5 HP"; break;
    }
}