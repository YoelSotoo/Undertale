function scr_cargar_juego() {
    /// scr_cargar_juego()

    if (file_exists("save.json")) {
        var _file = file_text_open_read("save.json");
        var _json = file_text_read_string(_file);
        file_text_close(_file);

        var data = json_parse(_json);
        global.load_data = data;

        //Guardar la room que debemos cargar
        global.goto_room = data.room;

        //Flag para indicar que acabamos de cargar partida
        global.just_loaded = true;

        show_debug_message("Archivo cargado, room guardada: " + string(data.room));
    }
}

    // --- Restaurar datos SI YA ESTAMOS en la room correcta ---
    if (variable_global_exists("load_data")) {
        var data = global.load_data;

        //Solo mover al jugador si ya estamos en esa room
        if (instance_exists(obj_Player) && room == data.room) {
            obj_Player.x = data.x;
            obj_Player.y = data.y;
        }

        global.player_hp = data.vida;


        // --- Restaurar inventario ---
        var inv = instance_find(obj_inventory, 0);
        if (instance_exists(inv)) {
            inv.items = [];

            for (var i = 0; i < array_length(data.items); i++) {
                var it = data.items[i];
                array_push(inv.items, {
                    name: it.name,
                    desc: it.desc,
                    count: it.count
                });
            }
        }

        show_debug_message("Datos cargados (stats + inventario).");
    }

