//-------------------------------------
// EVENTO DRAW (simplificado y centrado)
//-------------------------------------

// Dibuja la barra de ataque
draw_sprite(spr_barra_f, 0, 96, 384);

// Dibuja el cursor
if (can_press) {
    draw_sprite(spr_barra_f2, 0, 96 + cursor_pos_relative, 384);
}

// Dibuja el golpe
if (hit_anim_frame > -1) {
    var gx = 550;
    var gy = 250;

    draw_sprite_ext(spr_hit_dmg, floor(hit_anim_frame), gx, gy, 2, 2, 0, c_white, 1);

    hit_anim_frame += hit_anim_speed;
    if (hit_anim_frame >= sprite_get_number(spr_hit_dmg))
        hit_anim_frame = -1;
}

// Dibuja el texto de daño
if (!can_press && damage_text != "") {
    draw_set_font(fnt_BattleStats);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_yellow);

    // Posición del número de daño (encima del enemigo)
    var dmg_x = 550; // misma X del golpe
    var dmg_y = 206; // un poco más arriba
    draw_text(dmg_x, dmg_y, damage_text);
}

// Dibuja mensaje de ataque enemigo (opcional)
if (enemy_turn) {
    draw_set_font(fnt_BattleStats);
    draw_set_color(c_red);
    draw_text(400, 350, "¡El enemigo ataca!");
}
