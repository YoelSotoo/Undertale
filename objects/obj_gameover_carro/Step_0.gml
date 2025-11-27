// ===============================
// CONTROLES TOUCH
// ===============================
var mx = device_mouse_x(0);
var my = device_mouse_y(0);
var pressed = device_mouse_check_button_pressed(0, mb_left);

// --- BOTÓN UP ---
if (pressed && point_in_circle(mx, my, btn_up_x, btn_up_y, btn_radius))
{
    if (!touch_up) {
        opcion = max(opcion - 1, 0);
        audio_play_sound(snd_seleccionar, 1, false);
        touch_up = true;
    }
}
else touch_up = false;

// --- BOTÓN DOWN ---
if (pressed && point_in_circle(mx, my, btn_dn_x, btn_dn_y, btn_radius))
{
    if (!touch_dn) {
        opcion = min(opcion + 1, 1);
        audio_play_sound(snd_seleccionar, 1, false);
        touch_dn = true;
    }
}
else touch_dn = false;

// --- BOTÓN CONFIRMAR (Z) ---
if (pressed && point_in_circle(mx, my, btn_ok_x, btn_ok_y, btn_radius))
{
    if (!touch_ok) {
        touch_ok = true;

        // MISMO CÓDIGO DE ENTER
        global.game_paused = false;

        if (opcion == 0) {
            room_restart();
            audio_stop_all();
        } else {
            room_goto(rm_menu);
        }
    }
}
else touch_ok = false;
