//-------------------------------------
// DRAW - obj_fight_minigame (con depth corregido)
//-------------------------------------

// 🟢 Barra base
draw_sprite(spr_barra_f, 0, 96, 384);

// 🟢 Cursor
if (can_press) {
    draw_sprite(spr_barra_f2, 0, 96 + cursor_pos_relative, 384);
}

// ⚡ Dibuja la animación del golpe **al frente**
if (hit_anim_frame > -1) {
    var gx = 545;
    var gy = 250;

    if (instance_exists(controller_id)) {
        gx = controller_id.enemy_x;
        gy = controller_id.enemy_y - 6;
    }

    // ⚙️ Dibujar en superficie temporal (truco de prioridad visual)
    var _surf = surface_create(room_width, room_height);
    surface_set_target(_surf);
    draw_clear_alpha(c_black, 0);

    // Dibuja el golpe en esa superficie
    draw_sprite_ext(spr_hit_dmg, floor(hit_anim_frame), gx, gy, 2, 2, 0, c_white, 1);

    // Restaurar dibujo y colocar la superficie encima
    surface_reset_target();
    draw_surface(_surf, 0, 0);
    surface_free(_surf);

    // Avanza frame de la animación
    hit_anim_frame += hit_anim_speed;
    if (hit_anim_frame >= sprite_get_number(spr_hit_dmg)) {
        hit_anim_frame = -1;
    }
}

// 🟡 Texto de daño
if (!can_press && damage_text != "") {
    draw_set_font(fnt_BattleStats);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_yellow);
    draw_text(x, y - 10, damage_text);
}
