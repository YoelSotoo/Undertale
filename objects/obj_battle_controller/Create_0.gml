//-------------------------------------
// CREATE – obj_battle_controller
//-------------------------------------

state = "PLAYER_TURN";
image_speed = 0.1;

// Defaults
enemy_sprite  = noone;
enemy_x = 545;
enemy_y = 256;
enemy_pattern = "basic";
enemy_bullet_damage = 4;

// Mapeo según el objeto que vino del textbox:
switch (global.current_enemy) {
    case obj_Enemy: // tu maniquí
        enemy_sprite        = spr_Enemy_fury; // o el que quieras
        enemy_x             = 545;
        enemy_y             = 256;
        enemy_pattern       = "basic";   // por si luego quieres variar
        enemy_bullet_damage = 4;
        break;

    // Aquí añades más enemigos:
    /*
    case obj_Enemy_Slime:
        enemy_sprite  = spr_Slime;
        enemy_x       = 540;
        enemy_y       = 260;
        enemy_pattern = "rain";
        enemy_bullet_damage = 3;
        break;
    */
}

// Alma
var sx = room_width/2, sy = room_height/2;
global.soul_id = instance_create_depth(sx, sy, -1000, obj_soul);
global.soul_id.visible = false;

// Stats jugador
global.player_hp      = 20;
global.player_max_hp  = 20;
global.player_defense = 11;
global.soul_spd       = 4;
global.inv_frames     = 0;

// FX enemigo
enemy_shake_timer = 0;
enemy_shake_intensity = 10;
enemy_flash_timer = 0;
