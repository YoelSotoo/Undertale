//-------------------------------------
// EVENTO DRAW (versión simplificada)
//-------------------------------------

// Dibuja la barra de ataque
draw_sprite(spr_barra_f, 0, x, y);

// Dibuja el cursor
if (can_press) {
    draw_sprite(spr_barra_f2, 0, x + cursor_pos_relative, y);
}

//-------------------------------------
// Dibuja el golpe siempre que hit_anim_frame > -1
//-------------------------------------
if (hit_anim_frame > -1) {
    // Dibuja el golpe en una posición fija visible
    var gx = 550;
    var gy = 250;

    // Dibujar un círculo rojo para confirmar posición
    draw_set_color(c_red);
    draw_circle(gx, gy, 10, false);
    draw_set_color(c_white);

    // Dibuja el sprite del golpe (duplicado de tamaño)
    draw_sprite_ext(spr_hit_dmg, floor(hit_anim_frame), gx, gy, 2, 2, 0, c_white, 1);

    // Avanza la animación
    hit_anim_frame += hit_anim_speed;
    if (hit_anim_frame >= sprite_get_number(spr_hit_dmg)) {
        hit_anim_frame = -1;
    }
}

//-------------------------------------
// Dibuja el texto del daño
//-------------------------------------
if (!can_press && damage_text != "") {
    draw_set_font(fnt_BattleStats);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_yellow);
    draw_text(x + cursor_pos_relative, y - 30, damage_text);
}
