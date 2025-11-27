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
    if (touch.left_pressed && !last_t_l)  _press_left = true;
    if (touch.right_pressed && !last_t_r) _press_right = true;
    if (touch.up_pressed && !last_t_u)    _press_up = true;
    if (touch.down_pressed && !last_t_d)  _press_down = true;
    
    if (touch.z_pressed && !last_t_z)     _press_ok = true;      
    if (touch.x_pressed && !last_t_x)     _press_cancel = true; 

    last_t_l = touch.left_pressed; last_t_r = touch.right_pressed;
    last_t_u = touch.up_pressed;   last_t_d = touch.down_pressed;
    last_t_z = touch.z_pressed;    last_t_x = touch.x_pressed;
}

// =========================================================
// 2. LÓGICA DE NAVEGACIÓN
// =========================================================

if (global.UISelectionMenu > -1) {
    
    // --- A. NAVEGACIÓN MENU PRINCIPAL (Botones de abajo) ---
    // Solo si NO estamos en submenús (ACT o ITEM)
    if (global.BattleMenu == 0 && !act_menu_visible && !item_menu_visible) {
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
    
    // --- B. NAVEGACIÓN DENTRO DE ACT ---
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
        
        // Descripciones ACT
        switch (current_act_selection) {
            case 0: act_description = "Reduce el dmg enemigo 50% proximo turno"; break;
            case 1: act_description = "Te haces 5 dmg, luego +10 dmg permanente"; break;
            case 2: act_description = "Si no recibes dmg, curas 5 HP"; break;
        }
    }

    // --- C. NAVEGACIÓN DENTRO DE ITEMS (NUEVO) ---
    if (item_menu_visible) {
        var total_items = array_length(obj_inventory.items);
        
        if (total_items > 0) {
            if (_press_up) {
                current_item_selection--;
                audio_play_sound(snd_seleccionar, 1, false);
            }
            if (_press_down) {
                current_item_selection++;
                audio_play_sound(snd_seleccionar, 1, false);
            }
            current_item_selection = clamp(current_item_selection, 0, total_items - 1);
        }
    }

    // --- D. BOTÓN X (CANCELAR / ATRÁS) ---
    if (_press_cancel) {
        if (act_menu_visible) {
            act_menu_visible = false;
            global.BattleMenu = 0;
            global.UISelectionMenu = 1; // Volver al botón ACT
        } 
        else if (item_menu_visible) {
            item_menu_visible = false;
            global.BattleMenu = 0;
            global.UISelectionMenu = 2; // Volver al botón ITEM
        }
        else {
            if (global.BattleMenu > 0) {
                 global.BattleMenu = 0;
                 global.UISelectionMenu = BelowUIReferenceNum;
            }
        }
    }
    
    // --- E. BOTÓN Z (ACEPTAR / CONFIRMAR) ---
    if (_press_ok) {
        
        // 1. SI ESTAMOS EN EL MENÚ DE ACTUAR
        if (act_menu_visible) {
            audio_play_sound(snd_seleccionar, 1, false);
            var battle = instance_find(obj_battle_controller, 0);
            
            if (instance_exists(battle)) {
                switch (current_act_selection) {
                    case 0: // Provocar
                        battle.enemy_damage_reduction = 0.5;
                        battle.enemy_damage_reduction_turns = 1;
                        battle.act_sprite = spr_AllFight_Provocar;
                        battle.is_doing_act = true;
                        battle.act_timer = battle.act_duration;
                        break;
                    case 1: // Meditar
                        global.player_hp -= 5;
                        if(global.player_hp < 1) global.player_hp = 1;
                        battle.player_damage_bonus = 10;
                        battle.act_sprite = spr_AllFight_Meditar;
                        battle.is_doing_act = true;
                        battle.act_timer = battle.act_duration;
                        break;
                    case 2: // Rezar
                        battle.prayer_active = true;
                        battle.prayer_heal_amount = 5;
                        battle.act_sprite = spr_AllFight_Rezar;
                        battle.is_doing_act = true;
                        battle.act_timer = battle.act_duration;
                        break;
                }
                global.turn_state = "ENEMY_TURN";
            }
            act_menu_visible = false;
            global.BattleMenu = 0;
            global.UISelectionMenu = -1; 
        } 
        
        // 2. SI ESTAMOS EN EL MENÚ DE ÍTEMS (NUEVO)
        else if (item_menu_visible) {
            var total_items = array_length(obj_inventory.items);
            
            // Si hay items, usamos el seleccionado
            if (total_items > 0) {
                audio_play_sound(snd_consumir, 1, false); // Sonido de comer
                
                var item_usado = obj_inventory.items[current_item_selection];
                
                // --- EFECTOS DEL OBJETO ---
                switch (item_usado.id) {
                    case "Tutu":
                        global.player_hp = min(global.player_max_hp, global.player_hp + 5);
                        show_debug_message("Usaste Tutu. HP: " + string(global.player_hp));
                        break;
                        
                    case "PayLimon":
                        global.player_hp = min(global.player_max_hp, global.player_hp + 10);
                        show_debug_message("Usaste Pay. HP: " + string(global.player_hp));
                        break;
                        
                    // Agrega aquí más casos si tienes más objetos
                    default:
                        show_debug_message("Objeto sin efecto en batalla.");
                        break;
                }
                
                // --- CONSUMIR OBJETO (Lógica de inventario) ---
                item_usado.count -= 1;
                if (item_usado.count <= 0) {
                    array_delete(obj_inventory.items, current_item_selection, 1);
                    // Ajustar cursor si borramos el último
                    current_item_selection = clamp(current_item_selection, 0, array_length(obj_inventory.items) - 1);
                }
                
                // --- PASAR TURNO ---
                item_menu_visible = false;
                global.BattleMenu = 0;
                global.UISelectionMenu = -1; // Ocultar botones
                global.turn_state = "ENEMY_TURN";
            } else {
                // Si está vacío y pulsas Z, hace un sonido de error o nada
            }
        }
        
        // 3. SI ESTAMOS EN EL MENÚ PRINCIPAL (Elegir botón)
        else {
            if (global.BattleMenu == 0) {
                // FIGHT (0)
                if (global.UISelectionMenu == 0) {
                    global.turn_state = "PLAYER_ATTACK";
                    global.BattleMenu = 1.5;
                    global.UISelectionMenu = -1;
                    if (!instance_exists(obj_fight_minigame)) {
                        instance_create_layer(0, 0, "Instances", obj_fight_minigame);
                    }
                }
                // ACT (1)
                else if (global.UISelectionMenu == 1) {
                    act_menu_visible = true;
                    current_act_selection = 0;
                }
                // ITEM (2) - ¡AQUÍ ACTIVAMOS EL MENÚ DE ÍTEMS!
                else if (global.UISelectionMenu == 2) {
                    item_menu_visible = true;
                    current_item_selection = 0;
                }
                // MERCY (3) - Si tienes botón de Piedad
                else if (global.UISelectionMenu == 3) {
                     // Lógica de piedad...
                }
            }
        }
    }
}