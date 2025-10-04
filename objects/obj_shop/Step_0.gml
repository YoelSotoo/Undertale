// Determinar opciones según estado
var opciones = [];
if (estado_menu == "principal") opciones = opciones_principal;
else if (estado_menu == "comprar") opciones = opciones_comprar;
else if (estado_menu == "hablar") opciones = opciones_hablar;
else if (estado_menu == "vender") opciones = opciones_vender;

// Navegación
if (keyboard_check_pressed(vk_up)) {
    cursor_index--;
    if (cursor_index < 0) cursor_index = array_length(opciones) - 1;
    audio_play_sound(snd_seleccionar, 0, false);
}
if (keyboard_check_pressed(vk_down)) {
    cursor_index++;
    if (cursor_index > array_length(opciones) - 1) cursor_index = 0;
    audio_play_sound(snd_seleccionar, 0, false);
}

// Selección con ENTER
if (keyboard_check_pressed(vk_enter)) {
    var opcion = opciones[cursor_index];
	  audio_play_sound(snd_seleccionar, 0, false);
    // --- PRINCIPAL ---
    if (estado_menu == "principal") {
        if (opcion == "Comprar") {
            estado_menu = "comprar";
            cursor_index = 0;
        }
        else if (opcion == "Hablar") {
            estado_menu = "hablar";
            cursor_index = 0;
            texto_actual = "* Que quieres saber mitotero\nberga."; // Texto por defecto
            sprite_hablar_actual = spr_elweydelatienda; // Sprite por defecto
            opcion_hablar_actual = -1;
        }
        else if (opcion == "Vender") {
            estado_menu = "vender";
            cursor_index = 0;
        }
        else if (opcion == "Salir") {
            game_end();
        }
    }

    // --- COMPRAR ---
    else if (estado_menu == "comprar") {
        if (opcion == "Regresar") {
            estado_menu = "principal";
            cursor_index = 0;
        } else {
            show_debug_message("Compraste: " + opcion);
        }
    }

    // --- HABLAR ---
    else if (estado_menu == "hablar") {
        if (opcion == "Regresar") {
            estado_menu = "principal";
            cursor_index = 0;
            texto_actual = "";
            sprite_hablar_actual = noone;
            opcion_hablar_actual = -1;
        } else {
            // Guardar sprite y texto de la opción seleccionada
            sprite_hablar_actual = noone; // Limpiar antes
            if (cursor_index < array_length(spr_hablar)) {
                sprite_hablar_actual = spr_hablar[cursor_index];
            }
            texto_actual = respuestas_hablar[cursor_index];
            opcion_hablar_actual = cursor_index;
        }
    }

    // --- VENDER ---
    else if (estado_menu == "vender") {
        if (opcion == "Regresar") {
            estado_menu = "principal";
            cursor_index = 0;
        }
    }
}

// --- ANIMACIÓN DEL SPRITE ---
if (estado_menu == "hablar") {
    // Ejemplo: opción 1 “la hrmna del” sube y baja
    if (opcion_hablar_actual == 1) {
        anim_offset = sin(current_time * 0.01) * 3; // mover 3 px arriba-abajo
    } else {
        anim_offset = 0;
    }
} else {
    anim_offset = 0;
}
