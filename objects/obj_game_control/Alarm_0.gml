//Restaurar Inventario
if (instance_exists(obj_inventory)) {
    var inv = instance_find(obj_inventory, 0);
    inv.items = []; // Limpia el inventario primero

    var list = global.temp_items_data;
    for (var i = 0; i < array_length(list); i++) {
        var it = list[i];
        array_push(inv.items, {
            name: it.name,
            desc: it.desc,
            count: it.count
        });
    }

    global.temp_items_data = undefined;
    show_debug_message("Inventario restaurado correctamente.");
} else {
    // Si aún no existe el inventario, reintentar
    alarm[0] = 1;
}
