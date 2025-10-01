// Evento DRAW de obj_battle_controller

// Este objeto solo dibuja a los participantes de la batalla.

// 1. Dibuja el sprite de tu personaje (Frisk) a la izquierda
draw_sprite(spr_AllFight_1, image_index, 100, 256);

// 2. Dibuja el sprite del enemigo a la derecha
if (enemy_sprite != noone) {
    draw_sprite(enemy_sprite, image_index, 545, 256);
}