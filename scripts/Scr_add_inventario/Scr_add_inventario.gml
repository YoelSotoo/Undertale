function Scr_add_inventario(_name, _desc, _amount, _type, _id) {

    var inv = instance_find(obj_inventory, 0);
    if (!instance_exists(inv)) return;

    if (!is_array(inv.items)) inv.items = [];

    // Buscar si ya existe
    for (var i = 0; i < array_length(inv.items); i++) {

        if (inv.items[i].id == _id) {  // comparar por ID
            inv.items[i].count += _amount;
            return;
        }
    }

    // Crear ítem nuevo
    var new_item = {
        name  : _name,
        desc  : _desc,
        count : _amount,
        type  : _type,
        id    : _id   
    };

    array_push(inv.items, new_item);
}
