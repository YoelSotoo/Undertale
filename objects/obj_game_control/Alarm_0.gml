// Restaurar inventario
var inv = instance_find(obj_inventory, 0);
if (instance_exists(inv)) {

    inv.items = []; // limpiar inventario actual

    var list = global.temp_items_data; // si guardaste temporalmente desde JSON
    for (var i = 0; i < array_length(list); i++) {
        var it = list[i];
        array_push(inv.items, {
            id    : it.id,    // ID del item
            name  : it.name,
            desc  : it.desc,
            count : it.count,
            type  : it.type
        });
    }

    global.temp_items_data = undefined;
    show_debug_message("Inventario restaurado correctamente.");

} else {
    // Si aún no existe el inventario, reintentar
    alarm[0] = 1;
}
