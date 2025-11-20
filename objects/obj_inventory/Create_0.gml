if (instance_number(obj_inventory) > 1) {
    instance_destroy();
    exit;
}

persistent = true;

/// Create Event - obj_inventory
visible = false;         // si el inventario está abierto
cursor = 0;              // índice del ítem seleccionado
top_index = 0;           // primer ítem visible (para scroll)
items_per_page = 6;      // cuántos ítems mostrar por página

// Lista de ítems
items = [];

// Función para agregar ítems
function add_item(_id, _name, _desc, _count, _type, _func) {

    var s = {
        id: _id,
        name: _name,
        desc: _desc,
        count: _count,
        type: _type,      // consume, key, etc.
        func: _func       // función que se ejecuta al usarlo (o undefined)
    };

    array_push(items, s);
}



