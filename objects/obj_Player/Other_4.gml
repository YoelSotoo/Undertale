// Buscar el spawn correcto al entrar en la nueva room
if (variable_global_exists("next_spawn")) {
    var spawn_name = global.next_spawn;
    var found_spawn = noone;

    // Buscar el spawn que tenga ese nombre
    var total_spawns = instance_number(obj_spawn);
    for (var i = 0; i < total_spawns; i++) {
        var s = instance_find(obj_spawn, i);
        if (variable_instance_exists(s, "spawn_id")) {
            if (s.spawn_id == spawn_name) {
                found_spawn = s;
                break;
            }
        }
    }

    // Si lo encontró, posicionar ahí al jugador
    if (found_spawn != noone) {
        x = found_spawn.x;
        y = found_spawn.y;
    }

    // Limpiar variable global
    global.next_spawn = "";
}
