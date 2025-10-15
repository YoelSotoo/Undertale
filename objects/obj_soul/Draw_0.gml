//-------------------------------------
// EVENTO DRAW - obj_soul
//-------------------------------------

// Si está en modo parpadeo
if (flash_timer > 0) {
    draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, 1);
} else {
    draw_self();
}

// --- Debug temporal ---
draw_set_color(c_lime);
draw_text(x + 10, y - 10, string(round(x)) + "," + string(round(y)));
draw_set_color(c_white);
