function scr_get_random_pattern() {
    var battle = instance_find(obj_battle_controller, 0);
    if (!instance_exists(battle)) return "basic";
    
    // Elegir patrón aleatorio de la lista disponible
    var random_index = irandom(array_length(battle.available_patterns) - 1);
    return battle.available_patterns[random_index];
}