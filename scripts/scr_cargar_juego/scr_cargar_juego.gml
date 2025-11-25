function scr_cargar_juego() {

    // --- 1. Verificar si existe save.json ---
    if (!file_exists("save.json")) {
        show_debug_message("No existe save.json");
        return;
    }

    // Leer JSON
    var _file = file_text_open_read("save.json");
    var _json = file_text_read_string(_file);
    file_text_close(_file);

    var data = json_parse(_json);

    // Guardamos para restaurar tras room_goto()
    global.load_data  = data;
    global.goto_room  = data.room;
    global.just_loaded = true;

    show_debug_message("Archivo cargado, room guardada: " + string(data.room));


    // --- 2. Si ya estamos en la room correcta, restaurar al instante ---
    if (room == data.room) {

        // Restaurar posición del jugador
        if (instance_exists(obj_Player)) {
            obj_Player.x = data.x;
            obj_Player.y = data.y;
        }

        // Restaurar vida
        global.player_hp = data.vida;
		global.player_gold = data.gold;



        // --- 3. Restaurar inventario ---
        var inv = instance_find(obj_inventory, 0);

        if (instance_exists(inv)) {

            inv.items = []; // limpiar inventario actual

            for (var i = 0; i < array_length(data.items); i++) {

                var it = data.items[i];

                // Volvemos a construir el item SIN funciones
                array_push(inv.items, {
                    name  : it.name,
                    desc  : it.desc,
                    count : it.count,
                    type  : it.type,
                    id    : it.id
                });
            }
        }


        show_debug_message("Datos cargados (stats + inventario).");

        // Limpieza, para no ejecutarse paso tras paso
        variable_global_delete("load_data");
    }
}
