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
function add_item(_id, _name, _desc, _count, _type) {
    var s = {
        id: _id,
        name: _name,
        desc: _desc,
        count: _count,
        type: _type
    };
    array_push(items, s);
}

// Agregamos algunos ítems de ejemplo
add_item(1, "Torta rapida", "Restaura 20 HP.", 3, "consume");
add_item(2, "Dog Residue", "Polvo raro. No hace nada.", 1, "key");
add_item(3, "Pay de canela", "Restaura 50 HP.", 1, "consume");
add_item(4, "Mystery Key", "Llave especial.", 1, "key");
