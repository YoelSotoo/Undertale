draw_set_font(font_tienda);

var opciones = [];
var start_x, start_y, offset_y;
offset_y = 25;

//menu por defecto
if (estado_menu == "principal") {
    draw_sprite(spr_elweydelatienda4, 1, 191, 80);
    draw_sprite(spr_humocigarro, image_index, 188, 80);
    opciones = opciones_principal;
    start_x = 470; start_y = 375;
    draw_text(20, 375, "* Kiubole we");
    draw_text(20, 410, "* Va a comprar o q berga");
}

//comprar
else if (estado_menu == "comprar") {
    draw_sprite(spr_elweydelatienda, 1, 191, 80);
    opciones = opciones_comprar;
    start_x = 37; start_y = 375;
    draw_text(470, 375, "* Que\ndeseas\ncomprar?");
}

//pa lo de hablar
else if (estado_menu == "hablar") {
    opciones = opciones_hablar;
    start_x = 460; start_y = 375;
    draw_text(20, 375, texto_actual);

    // Sprite por defecto o seleccionado
    if (sprite_hablar_actual != noone) {
        draw_sprite(sprite_hablar_actual, 0, 191, 80 + anim_offset);
    }
}

//opcion bender
else if (estado_menu == "vender") {
    opciones = opciones_vender;
    start_x = 470; start_y = 375;
    draw_text(20, 375, "* Te compro? te compro berga we");
    draw_text(20, 410, "* Estas viendo que quiero\nvender chamaco pendejo");
}

// Dibujar opciones
if (array_length(opciones) > 0) {
    for (var i = 0; i < array_length(opciones); i++) {
        draw_text(start_x, start_y + (i * offset_y), opciones[i]);
    }
}

// Dibujar cursor
var indicador_x = start_x - 25;
var indicador_y = start_y + (cursor_index * offset_y);
draw_sprite(spr_indicador, 0, indicador_x, indicador_y);
