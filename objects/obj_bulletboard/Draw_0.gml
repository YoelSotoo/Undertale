var cx = room_width/2;
var cy = room_height/2;

var border_l = cx - current_width/2;
var border_r = cx + current_width/2;
var border_u = cy - current_height/2;
var border_d = cy + current_height/2;

// Límites para el alma
global.LeftEdge   = border_l + 8;
global.RightEdge  = border_r - 8;
global.TopEdge    = border_u + 8;
global.BottomEdge = border_d - 8;

// Borde doble
// Contorno blanco
draw_set_color(c_white);
draw_rectangle(border_l - 4, border_u - 4, border_r + 4, border_d + 4, false);

// Interior negro (no relleno)
draw_set_color(c_black);
draw_rectangle(border_l, border_u, border_r, border_d, false);

