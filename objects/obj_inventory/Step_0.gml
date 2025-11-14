
// Abrir/cerrar inventario con "I"
if (keyboard_check_pressed(ord("I"))) {
    visible = !visible;
	global.inventory_open = visible;
}

// Si no está abierto, salir
if (!visible) return;

// Navegación básica
if (keyboard_check_pressed(vk_up)) {
    cursor = max(0, cursor - 1);
    if (cursor < top_index) top_index = cursor;
	audio_play_sound(snd_seleccionar, 1, false);
}

if (keyboard_check_pressed(vk_down)) {
    cursor = min(array_length(items) - 1, cursor + 1);
    if (cursor >= top_index + items_per_page)
    top_index = cursor - (items_per_page - 1);
	audio_play_sound(snd_seleccionar, 1, false);
}

// Usar ítem con espacio
if (keyboard_check_pressed(vk_space)) {
    if (array_length(items) > 0) {
        var it = items[cursor];
        
        if (it.type == "consume") {
            // Ejemplo de uso: cura HP al jugador
            if (instance_exists(fris)) {
                with (fris) {
                    hp = min(maxhp, hp + 20);
                }
            }

            // Restar cantidad
            it.count -= 1;
            if (it.count <= 0) {
                array_delete(items, cursor, 1);
                cursor = clamp(cursor, 0, max(0, array_length(items) - 1));
            } else {
                items[cursor] = it;
            }

        } else if (it.type == "key") {
            show_message("No se puede usar aquí.");
        }
    }
}

// Salir del menú con ESC
if (keyboard_check_pressed(vk_escape)) {
    visible = false;
}


