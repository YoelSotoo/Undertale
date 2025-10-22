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
