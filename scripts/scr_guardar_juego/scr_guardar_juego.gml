function scr_guardar_juego() {

    var player = obj_Player;
    if (!instance_exists(player)) exit;

    var inv = instance_find(obj_inventory, 0);
    var items_data = [];

    if (instance_exists(inv)) {
        for (var i = 0; i < array_length(inv.items); i++) {

            var it = inv.items[i];

            array_push(items_data, {
                name:  it.name,
                desc:  it.desc,
                count: it.count,
                type:  it.type,
                id:    it.id    // ← IMPORTANTE, este reemplaza las funciones
            });
        }
    }

    var data = {
        room: room,
        x: player.x,
        y: player.y,
        vida: global.player_hp,
        items: items_data,
		gold: global.player_gold
    };

    var json = json_stringify(data);
    var file = "save.json";

    var buffer = buffer_create(string_byte_length(json) + 1, buffer_fixed, 1);
    buffer_write(buffer, buffer_text, json);
    buffer_save(buffer, file);
    buffer_delete(buffer);

    show_debug_message("Juego guardado correctamente.");
}
