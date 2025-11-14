function scr_guardar_juego() {
    // Referencia al jugador
    var player = obj_Player;
    if (!instance_exists(player)) exit;

    // Referencia al inventario
    var inv = instance_find(obj_inventory, 0);
    var items_data = [];

    if (instance_exists(inv)) {
        // Copiar ítems como structs simples
        for (var i = 0; i < array_length(inv.items); i++) {
            var it = inv.items[i];
            array_push(items_data, {
                name: it.name,
                desc: it.desc,
                count: it.count
            });
        }
    }

    // Crear struct con todos los datos a guardar
    var data = {
        room: room,         
        x: player.x,
        y: player.y,
        vida: global.player_hp,
        items: items_data
    };

    // Guardar en archivo JSON
    var json = json_stringify(data);
    var file = "save.json";
    var buffer = buffer_create(string_byte_length(json) + 1, buffer_fixed, 1);
    buffer_write(buffer, buffer_text, json);
    buffer_save(buffer, file);
    buffer_delete(buffer);

    show_debug_message("Juego guardado correctamente.");
    show_debug_message("Inventario guardado: " + string(json_stringify(items_data)));
}
