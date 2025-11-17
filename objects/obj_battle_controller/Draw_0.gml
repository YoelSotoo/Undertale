// Jugador
draw_sprite(spr_AllFight_1, image_index, 100, 256);

// Enemigo con efectos, en enemy_x/enemy_y
if (enemy_sprite != noone) {
    var ex = enemy_x, ey = enemy_y;

    if (enemy_shake_timer > 0) {
        ex += irandom_range(-enemy_shake_intensity, enemy_shake_intensity);
        ey += irandom_range(-enemy_shake_intensity, enemy_shake_intensity);
        enemy_shake_timer--;
    }

    if (enemy_flash_timer > 0) {
        draw_sprite_ext(enemy_sprite, image_index, ex, ey, 1,1,0, c_white, 1);
        enemy_flash_timer--;
    } else {
        draw_sprite(enemy_sprite, image_index, ex, ey);
    }
}

// DEBUG MEJORADO
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_font(-1);
draw_text(10, 10, "Jugador HP: " + string(global.player_hp) + "/" + string(global.player_max_hp));
draw_text(10, 30, "Enemigo HP: " + string(enemy_hp) + "/" + string(enemy_max_hp));
draw_text(10, 50, "Inv Frames: " + string(global.inv_frames));
draw_text(10, 70, "Turn State: " + string(global.turn_state));
draw_text(10, 90, "Proyectiles: " + string(instance_number(obj_proyectil_enemy)));

//barra de vida enemigo
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