/// Draw GUI Event - obj_inventory
if (!visible) return;

// === Coordenadas y medidas ===
var gui_x = 64;
var gui_y = 64;
var gui_w = 480;
var gui_h = 320;
var line_h = 40;

// === Fondo del inventario ===
draw_set_alpha(1);
draw_set_color(c_black);
draw_rectangle(gui_x, gui_y, gui_x + gui_w, gui_y + gui_h, false);
draw_set_alpha(1);

// === Borde blanco ===
draw_set_color(c_white);
draw_rectangle(gui_x, gui_y, gui_x + gui_w, gui_y + gui_h, true);

// === Fuente del inventario ===
if (font_exists(font_inventario)) {
    draw_set_font(font_inventario);
} else {
    show_debug_message("⚠️ No se encontró 'font_inventario'");
}

// === Título ===
draw_text(gui_x + 16, gui_y + 8, "INVENTARIO");

// === Lista de ítems ===
var list_x = gui_x + 36;
var list_y = gui_y + 50;
var total = array_length(items);
var last_index = min(total - 1, top_index + items_per_page - 1);

for (var i = top_index; i <= last_index; i++) {
    var row = i - top_index;
    var yy = list_y + row * line_h;
    var it = items[i];

    // === Cursor (usa sprite si es el seleccionado) ===
    if (i == cursor) {
        if (sprite_exists(spr_cursor)) {
            var cursor_y = yy + (line_h / 2) - (sprite_get_height(spr_cursor) / 2);
            draw_sprite(spr_cursor, 0, list_x - 20, cursor_y);
        } else {
            draw_set_color(c_white);
            draw_rectangle(list_x - 4, yy - 4, list_x + 440, yy + line_h - 8, false);
        }
    }

    // === Texto del ítem ===
    draw_set_color(c_white);
    draw_text(list_x, yy, it.name + "   x" + string(it.count));
}

// === Línea divisoria blanca (estilo bloque) ===
draw_set_color(c_white);
var divider_y = gui_y + gui_h - 80;
var thickness = 3; // ← grosor de la línea
draw_rectangle(gui_x, divider_y, gui_x + gui_w, divider_y + thickness, false);

// === Descripción del ítem seleccionado ===
var desc_x = gui_x + 16;
var desc_y = gui_y + gui_h - 64;

if (total > 0) {
    var sel = items[cursor];
    draw_text(desc_x, desc_y, sel.desc);
} else {
    draw_text(desc_x, desc_y, "Inventario vacío.");
}
