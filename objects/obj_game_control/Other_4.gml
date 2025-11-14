if (global.just_loaded && variable_global_exists("load_data")) {
    var data = global.load_data;

    global.player_hp = data.vida;

    global.temp_items_data = data.items;
    alarm[0] = 1; // restaurar inventario

    show_debug_message("Stats + inventario restaurados.");
}
