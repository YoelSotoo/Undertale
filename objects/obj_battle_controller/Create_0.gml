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

// Efecto de hit del jugador - VERSIÓN MEJORADA
hit_sprite = spr_AllFight_Hit;
is_player_hit = false;
hit_timer = 0;
hit_duration = 30; // ↑ MÁS LARGO (de 10 a 30 frames = 0.5 segundos)
hit_knockback = 12; // ↓ UN POCO MENOS DE FUERZA
hit_direction = 1;
player_base_x = 100;
hit_shake_speed = 0.3; // ↓ MÁS LENTO (controla la suavidad)

// Muerte del jugador
death_sprite = spr_AllFight_down;
is_player_dead = false;
death_timer = 0;
death_duration = 120; // 2 segundos para efectos de muerte

// FX enemigo
enemy_shake_timer = 0;
enemy_shake_intensity = 10;
enemy_flash_timer = 0;

// Temporizador de ataque enemigo
enemy_attack_duration = 90; // 1.5 segundos


//stats enemy 
enemy_hp = 30;
enemy_max_hp = 30;
enemy_defense = 5;

// Efectos de ACTs
enemy_damage_reduction = 1.0; // 1.0 = daño normal
enemy_damage_reduction_turns = 0;
player_damage_bonus = 0;
prayer_active = false;
prayer_heal_amount = 5;
prayer_damage_taken = false;

// Sprites de ACTs
act_sprite = noone;
is_doing_act = false;
act_timer = 0;
act_duration = 45; // Duración del sprite de ACT
// Animación de ACTs
act_frame = 0;
act_frame_speed = 0.3; // Velocidad de la animación


//Saca el rifle
audio_play_sound(snd_batallainicio, 1, false);
