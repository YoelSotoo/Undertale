// Determinar tipo de enemigo actual y crear su proyectil
switch (global.current_enemy) {
    case obj_Enemy: // ejemplo: maniquí furioso
        instance_create_layer(545, 256, "Instances", obj_proyectil_enemy);
    break;

    // Aquí puedes agregar otros enemigos con distintos ataques
    // case obj_Ghost:
    //     instance_create_layer(545, 256, "Instances", obj_proyectil_ghost);
    // break;
}

// Destruye el controlador después de lanzar
instance_destroy();
