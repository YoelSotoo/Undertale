function Scr_add_inventario() {
    var _name   = argument0;
    var _desc   = argument1;
    var _amount = argument2;
    var _type   = argument_count > 3 ? argument3 : "misc"; // tipo opcional

    // Buscar el inventario (solo debería haber uno)
    var inv = instance_find(obj_inventory, 0);
    if (!instance_exists(inv)) {
        show_debug_message("No se encontró obj_inventory al intentar agregar ítem.");
        return;
    }

    // Inicializar items si no existe (por seguridad)
    if (!is_array(inv.items)) {
        inv.items = [];
    }

    // Buscar si el ítem ya existe
    var found = false;
    for (var i = 0; i < array_length(inv.items); i++) {
        if (inv.items[i].name == _name) {
            inv.items[i].count += _amount;
            found = true;
            break;
        }
    }

    // Si no existe, agregar uno nuevo
    if (!found) {
        var new_item = {
            name: _name,
            desc: _desc,
            count: _amount,
            type: _type
        };
        array_push(inv.items, new_item);
    }

    show_debug_message("Ítem añadido: " + _name + " x" + string(_amount));
}