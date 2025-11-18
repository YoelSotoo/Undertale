function update_act_description() {
    // Ya estamos en el obj_buttoncontroller, usar "id" en lugar de instance_find
    switch (id.current_act_selection) {
        case 0: // Provocar
            id.act_description = "Reduce el daño enemigo 50% próximo turno";
            break;
        case 1: // Meditar
            id.act_description = "Te haces 5 daño, luego +10 daño permanente";
            break;
        case 2: // Rezar
            id.act_description = "Si no recibes daño, curas 5 HP";
            break;
    }
}