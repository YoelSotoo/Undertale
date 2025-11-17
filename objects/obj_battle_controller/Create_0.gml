// Usar SOLO una variable para estados
global.turn_state = "PLAYER_TURN";
image_speed = 0.1;

// Defaults
enemy_sprite  = noone;
enemy_x = 545;
enemy_y = 256;
available_patterns = ["basic", "basic_5", "circle", "rain"];
enemy_pattern = "basic";
enemy_bullet_damage = 4;

// Mapeo según el objeto que vino del textbox:
switch (global.current_enemy) {
    case obj_Enemy:
        enemy_sprite        = spr_Enemy_fury;
		enemy_happy_sprite = spr_Enemy_happy; // Sprite cuando es derrotado
        enemy_x             = 545;
        enemy_y             = 256;
        enemy_pattern       = "basic";
        enemy_bullet_damage = 4;
        break;
}

// Alma
var sx = room_width/2, sy = room_height/2;
global.soul_id = instance_create_depth(sx, sy, -1000, obj_soul);
global.soul_id.visible = false; // Inicialmente oculta

// Stats jugador
global.player_hp      = 20;
global.player_max_hp  = 20;
global.player_defense = 11;
global.soul_spd       = 4;
global.inv_frames     = 0;

// Animación de ataque
attack_sprite = spr_AllFight_Attack_Knif;
attack_timer = 0;
is_attacking = false;
attack_frame = 0;
attack_speed = 3; // Velocidad de la animación (cada 3 frames cambia)
attack_x = 100;
attack_y = 256;

// FX enemigo
enemy_shake_timer = 0;
enemy_shake_intensity = 10;
enemy_flash_timer = 0;

// Temporizador de ataque enemigo
enemy_attack_duration = 90; // 1.5 segundos
audio_play_sound(snd_rudebuster, 1, true);


//stats enemy 
enemy_hp = 30;
enemy_max_hp = 30;
enemy_defense = 5;