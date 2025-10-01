// Evento DRAW de obj_ButtonController

// --- DIBUJA LOS 4 BOTONES (en su estado normal, frame 0) ---
// Usamos la variable que ya define cuántos botones hay
for (var i = 0; i < button_count; i++) {
    draw_sprite(ButtonSprites[i], 0, ButtonPositions_X[i], 310);
}

// La lógica principal solo se ejecuta si el menú está activo (no durante ataques)
if (global.UISelectionMenu > -1) {
    
    // --- LÓGICA DEL MENÚ PRINCIPAL (FIGHT, ACT, etc.) ---
    if (global.BattleMenu == 0) {
        // Navegación con flechas izquierda y derecha
        if keyboard_check_pressed(vk_left) {
            global.UISelectionMenu -= 1;
            // audio_play_sound(MenuMove, 1, false); // Necesitas un sonido llamado MenuMove
        }
        if keyboard_check_pressed(vk_right) {
            global.UISelectionMenu += 1;
            // audio_play_sound(MenuMove, 1, false);
        }
        
        // Mantiene la selección entre 0 y 3
        global.UISelectionMenu = clamp(global.UISelectionMenu, 0, 3);
        
        // Dibuja el botón SELECCIONADO (frame 1) y el ALMA al lado
        // (Reemplaza "Soul" con el nombre de tu sprite del alma, ej. spr_AllFight_1)
        var _selected_x = ButtonPositions_X[global.UISelectionMenu];
        draw_sprite(ButtonSprites[global.UISelectionMenu], 1, _selected_x, 310);
        draw_sprite(spr_menu_cursor, 0, _selected_x + 16, 310); // <-- ¡USA EL NOMBRE DE TU SPRITE DEL ALMA!
    }
    
    // --- LÓGICA PARA VOLVER ATRÁS EN UN SUB-MENÚ (con la tecla X) ---
    if (keyboard_check_pressed(ord("X"))) {
        global.BattleMenu = 0; // Vuelve al menú principal
        global.UISelectionMenu = BelowUIReferenceNum;
    }
    
    // --- LÓGICA DE SELECCIÓN (cuando presionas Z) ---
    if (keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter)) {
        // audio_play_sound(Select, 1, false); // Necesitas un sonido llamado Select
        
        switch (global.BattleMenu) {
            
            // --- Caso 0: Estás en el Menú Principal ---
            case 0:
                // Cambia al sub-menú correspondiente (1=FIGHT, 2=ACT, etc.)
                global.BattleMenu = (global.UISelectionMenu + 1);
                BelowUIReferenceNum = global.UISelectionMenu; // Guarda la opción seleccionada
                global.UISelectionMenu = 0; // Resetea la selección para el nuevo menú
                break;
            
            // --- Caso 1: Elegiste FIGHT (Seleccionar enemigo) ---
            case 1:
                MonsterReferenceNum = global.UISelectionMenu;
                // Aquí iría el código para crear el minijuego de la barra de ataque
                // CreateTarget(global.PlayerWeapon); // Necesitarías un script o código para esto
                global.BattleMenu = 1.5; // Estado de "minijuego activo"
                global.UISelectionMenu = -1; // Desactiva el menú
                break;

            // --- Caso 2: Elegiste ACT (Seleccionar enemigo) ---
            case 2:
                MonsterReferenceNum = global.UISelectionMenu;
                global.BattleMenu = 2.5; // Pasa al menú de comandos de ACT
                global.UISelectionMenu = 0;
                break;

            // --- Caso 2.5: Elegiste un comando de ACT ---
            case 2.5:
                // Ejecuta una acción en el enemigo seleccionado
                with (global.Monster[MonsterReferenceNum]) {
                    event_user(global.UISelectionMenu); // Llama al Evento de Usuario del enemigo
                }
                global.BattleMenu = -2; // Estado de "después de actuar"
                global.UISelectionMenu = -1; // Desactiva el menú
                break;
            
            // (Aquí irían los otros 'case' para ITEM y MERCY que están en el código original)
        }
    }
}

// (Aquí va el resto del código del Evento Draw que maneja el fin de la batalla,
// las barras de vida de los enemigos, la navegación en otros menús, etc.)