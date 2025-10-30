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

// === DEBUG - AÑADIR ESTO AL FINAL ===
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_font(-1); // Fuente por defecto
draw_text(10, 10, "HP: " + string(global.player_hp) + "/" + string(global.player_max_hp));
draw_text(10, 30, "Inv Frames: " + string(global.inv_frames));
draw_text(10, 50, "Turn State: " + string(global.turn_state));
draw_text(10, 70, "Proyectiles: " + string(instance_number(obj_proyectil_enemy)));