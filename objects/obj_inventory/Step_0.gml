// Abrir/cerrar inventario con "Z"
if (keyboard_check_pressed(ord("I")) && room != rm_shop) {
    visible = !visible;
    global.inventory_open = visible;
}

// Si no está abierto, salir
if (!visible) return;

//Navegacion dentro del inbentario
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

//Z pa usar los items 
if (keyboard_check_pressed(ord("Z")))
{
    if (array_length(items) == 0) exit;

    var it = items[cursor];

    switch (it.id)
    {
		//Aqui van todos los items, el "case" es el nombre q bueno pa q explico
		//si lo voy a hacer yo vea

        case "Tutu":
            if (instance_exists(obj_Player)) {
                global.player_hp = global.player_hp + 5;
				audio_play_sound(snd_consumir, 1, false);
				show_debug_message("la vida actual de fris es: " + string(global.player_hp));
            }
            break;

        case "PayLimon":
            if (instance_exists(obj_Player)) {
                global.player_hp = global.player_hp + 10;
				audio_play_sound(snd_consumir, 1, false);
				show_debug_message("la vida actual de fris es: " + string(global.player_hp));
            }
            break;

        case "llave_castillo":
            global.tiene_llave_castillo = true;
            show_message("Obtienes acceso al castillo.");
            break;

        case "tp_ciudad":
            room_goto(rm_ciudad);
            break;

        // Si no coincide con ningún item
        default:
            show_debug_message("Este item no tiene acción asignada: " + string(it.id));
            break;
    }
	
    // Eliminar item
    it.count -= 1;

    if (it.count <= 0) {
        array_delete(items, cursor, 1);

        cursor = clamp(cursor, 0, array_length(items) - 1);
    } else {
        items[cursor] = it;
    }
}


