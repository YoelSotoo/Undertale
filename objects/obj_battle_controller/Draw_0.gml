// Jugador - con efectos de ataque, hit, muerte y ACTs
var current_sprite = spr_AllFight_1;
var current_frame = image_index;
var draw_x = attack_x;
var draw_y = attack_y;
var draw_alpha = 1;

// Determinar qué sprite usar (ORDEN DE PRIORIDAD)
if (is_player_dead) {
    // Sprite de muerte
    current_sprite = death_sprite;
    current_frame = 0;
    
    // Efecto de desvanecimiento
    if (death_timer > 60) {
        draw_alpha = 1.0 - ((death_timer - 60) / 60.0);
    }
} 
else if (is_doing_act && act_sprite != noone) {
    // Sprite de ACT con animación
    current_sprite = act_sprite;
    current_frame = floor(act_frame); // Usar el frame calculado
}
else if (is_player_hit) {
    // Sprite de hit
    current_sprite = hit_sprite;
    current_frame = 0;
} 
else if (is_attacking) {
    // Sprite de ataque
    current_sprite = attack_sprite;
    current_frame = attack_frame;
}
// Dibujar sprite correspondiente
if (draw_alpha < 1) {
    draw_sprite_ext(current_sprite, current_frame, draw_x, draw_y, 1, 1, 0, c_white, draw_alpha);
} else {
    draw_sprite(current_sprite, current_frame, draw_x, draw_y);
}

// Enemigo con efectos, en enemy_x/enemy_y
if (enemy_sprite != noone) {
    var ex = enemy_x, ey = enemy_y;
    var current_enemy_sprite = enemy_sprite;

    // Cambiar sprite si está derrotado
    if (enemy_hp <= 0 && enemy_happy_sprite != noone) {
        current_enemy_sprite = enemy_happy_sprite;
    }

    if (enemy_shake_timer > 0) {
        ex += irandom_range(-enemy_shake_intensity, enemy_shake_intensity);
        ey += irandom_range(-enemy_shake_intensity, enemy_shake_intensity);
        enemy_shake_timer--;
    }

    if (enemy_flash_timer > 0) {
        draw_sprite_ext(current_enemy_sprite, image_index, ex, ey, 1, 1, 0, c_white, 1);
        enemy_flash_timer--;
    } else {
        draw_sprite(current_enemy_sprite, image_index, ex, ey);
    }
}

// Barra de vida del ENEMIGO
var bar_width = 100;
var bar_height = 8;
var bar_x = enemy_x - bar_width/2;
var bar_y = enemy_y - 50;

// Fondo de la barra (rojo)
draw_set_color(c_red);
draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false);

// Vida actual (verde)
var hp_percent = enemy_hp / enemy_max_hp;
draw_set_color(c_lime);
draw_rectangle(bar_x, bar_y, bar_x + (bar_width * hp_percent), bar_y + bar_height, false);

// Texto de HP
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(enemy_x, bar_y - 15, string(enemy_hp) + "/" + string(enemy_max_hp));

// DEBUG MEJORADO
draw_set_halign(fa_left);
draw_text(10, 10, "Jugador HP: " + string(global.player_hp) + "/" + string(global.player_max_hp));
draw_text(10, 30, "Enemigo HP: " + string(enemy_hp) + "/" + string(enemy_max_hp));
draw_text(10, 50, "Inv Frames: " + string(global.inv_frames));
draw_text(10, 70, "Turn State: " + string(global.turn_state));
draw_text(10, 90, "Proyectiles: " + string(instance_number(obj_proyectil_enemy)));