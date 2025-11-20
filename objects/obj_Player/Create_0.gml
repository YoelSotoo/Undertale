xspd = 0;
yspd = 0;

move_spd = 1;

can_move = true;

walk_spd = 1.4;
run_spd = 2.3;

global.inventory_open = false;
global.just_loaded = false;
global.player_hp = 20;

// Crear obj_inventory si no existe
if (!instance_exists(obj_inventory)) {
    instance_create_layer(x, y, "Game_Controls", obj_inventory);
}

// Crear obj_game_control si no existe
if (!instance_exists(obj_game_control)) {
    instance_create_layer(x, y, "Game_Controls", obj_game_control);
}

//asi es la vida asi tan complicada
//juanxho estubo aki


