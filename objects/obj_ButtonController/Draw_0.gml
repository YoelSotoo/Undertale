// Evento DRAW de obj_ButtonController (CORREGIDO)

// Dibuja los botones que existen
for (var i = 0; i < button_count; i++) {
    draw_sprite(ButtonSprites[i], 0, ButtonPositions_X[i], 310);
}

// La lógica principal solo se ejecuta si el menú está activo
if (global.UISelectionMenu > -1) {
    
    // --- LÓGICA DEL MENÚ PRINCIPAL ---
    if (global.BattleMenu == 0) {
        // Navegación con flechas
        if keyboard_check_pressed(vk_left) {
            global.UISelectionMenu -= 1;
        }
        if keyboard_check_pressed(vk_right) {
            global.UISelectionMenu += 1;
        }
        
        // --- LÍNEA CORREGIDA ---
        // Mantiene la selección dentro del número real de botones que tienes
        global.UISelectionMenu = clamp(global.UISelectionMenu, 0, button_count - 1);
        
        // Dibuja el botón seleccionado y el cursor
        var _selected_x = ButtonPositions_X[global.UISelectionMenu];
        draw_sprite(ButtonSprites[global.UISelectionMenu], 1, _selected_x, 310);
        draw_sprite(spr_menu_cursor, 0, _selected_x, 310); // Reemplaza por el nombre de tu sprite de cursor
    }
    
    // --- LÓGICA PARA VOLVER ATRÁS (tecla X) ---
    if (keyboard_check_pressed(ord("X"))) {
        global.BattleMenu = 0;
        global.UISelectionMenu = BelowUIReferenceNum;
    }
    
    // --- LÓGICA DE SELECCIÓN (tecla Z) ---
    // --- LÓGICA DE SELECCIÓN (tecla Z) ---
	if (keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter)) {

		switch (global.BattleMenu) {

        // --- Caso 0: Menú Principal ---
			case 0:
            // Si está seleccionado FIGHT (el primer botón)
	            if (global.UISelectionMenu == 0) {
	                // Ir directo al minijuego
	                global.BattleMenu = 1.5;
	                global.UISelectionMenu = -1;
	                with (obj_battle_controller) {
	                    state = "FIGHT_MINIGAME";
	                }
	                if (!instance_exists(obj_fight_minigame)) {
	                    instance_create_layer(0, 0, "Instances", obj_fight_minigame);
	                }
	            }
	            else {
	                // Si no es FIGHT, simplemente cambia de menú como antes
	                global.BattleMenu = (global.UISelectionMenu + 1);
	                BelowUIReferenceNum = global.UISelectionMenu;
	                global.UISelectionMenu = 0;
	            }
	       break;

        // --- Caso 1: FIGHT (ya dentro del minijuego) ---
        case 1:
            // (mantén este vacío o elimina, ya no se usará)
        break;

        // --- Aquí puedes añadir ACT, ITEM, etc. ---
    }
}

}