//-------------------------------------
// EVENTO DRAW - obj_battle_controller
//-------------------------------------

// --- Dibuja al jugador (izquierda)
draw_sprite(spr_AllFight_1, image_index, 100, 256);

// --- Dibuja al enemigo (derecha) con efectos ---
if (enemy_sprite != noone) {
    var ex = 545;
    var ey = 256;
    
    // Efecto de sacudida
    if (enemy_shake_timer > 0) {
        ex += irandom_range(-enemy_shake_intensity, enemy_shake_intensity);
        ey += irandom_range(-enemy_shake_intensity, enemy_shake_intensity);
        enemy_shake_timer--;
    }

    // Efecto de parpadeo (flash)
    if (enemy_flash_timer > 0) {
        draw_sprite_ext(enemy_sprite, image_index, ex, ey, 1, 1, 0, c_white, 1);
        enemy_flash_timer--;
    } else {
        draw_sprite(enemy_sprite, image_index, ex, ey);
    }
}
