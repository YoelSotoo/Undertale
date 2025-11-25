if (instance_number(obj_inventory) > 1) {
    instance_destroy();
    exit;
}

persistent = true;
visible = false;         // si el inventario está abierto
cursor = 0;              // índice del ítem seleccionado
top_index = 0;           // primer ítem visible (para scroll)
items_per_page = 6;      // cuántos ítems mostrar por página

//Lista de ítems
items = [];

