// 🟢 Barra base
draw_sprite(spr_barra_f, 0, 96, 370);

// 🟢 Cursor
if (can_press) {
    draw_sprite(spr_barra_f2, 0, 96 + cursor_pos_relative, 370);
}

// ⚡ Animación del golpe (versión simplificada)
if (hit_anim_frame > -1) {
    var gx = 545;
    var gy = 250;

    if (instance_exists(controller_id)) {
        gx = controller_id.enemy_x;
        gy = controller_id.enemy_y - 6;
    }
    
    // Dibujar directamente con alta profundidad
    draw_sprite_ext(spr_hit_dmg, floor(hit_anim_frame), gx, gy, 2, 2, 0, c_white, 1);
}

// 🟡 Texto de daño
if (!can_press && damage_text != "") {
    draw_set_font(fnt_BattleStats);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_yellow);
    draw_text(x, y - 10, damage_text);
}